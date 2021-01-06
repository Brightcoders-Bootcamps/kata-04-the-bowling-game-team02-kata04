# frozen_string_literal: true

require_relative 'frame'
require_relative 'frameFinal'
require 'terminal-table'

# the class BowlingGame describe a bowling game
class BowlingGame
  def initialize
    @scoreboard = []
    @state = 0
    @is_game_over = false
    init_scoreboard
  end

  def init_scoreboard
    9.times { @scoreboard << Frame.new }
    @scoreboard << FrameFinal.new
  end

  def print_scoreboard
    rows = []
    rows << (1..10).to_a
    score = []
    score_with_bonus = []

    (0..8).each do |index|
      frame = @scoreboard[index]
      score << if frame.is_strike
                 "#{frame.first_throw} | -"
               else
                 "#{frame.first_throw} | #{frame.second_throw}"
               end
      score_with_bonus << frame.score_with_bonus
    end
    score << "#{@scoreboard[9].first_throw} | #{@scoreboard[9].second_throw} | #{@scoreboard[9].third_throw}"
    score_with_bonus << @scoreboard[9].score_with_bonus
    rows << score
    rows << score_with_bonus
    table = Terminal::Table.new title: 'Bowling Game ' + (@is_game_over ? '10' : @state.to_s), rows: rows
    puts(table)
    puts
  end

  def play(bowling_pins)
    throw_bowling_ball(bowling_pins)
    calculate_bonus
    print_scoreboard
  end

  def throw_bowling_ball(bowling_pins)
    frame = @scoreboard[@state]
    if @state == 9
      final_game(frame, bowling_pins)
      return true
    end

    if bowling_pins == 10 && frame.is_first_throw
      frame.first_throw = 10
      frame.is_first_throw = false
      frame.is_strike = true
      @state += 1
      return true
    end

    if bowling_pins != 10 && frame.is_first_throw
      frame.first_throw = bowling_pins
      frame.is_first_throw = false
      return true
    end

    unless frame.is_first_throw
      total = bowling_pins + frame.first_throw
      if total === 10
        frame.second_throw = bowling_pins
        frame.is_spare = true
        @state += 1
        true
      else
        frame.second_throw = bowling_pins
        @state += 1
        true
      end
    end
  end

  def final_game(final_frame, bowling_pins)
    if final_frame.is_first_throw
      puts('primer intento final')
      final_frame.is_strike = true if bowling_pins == 10
      final_frame.first_throw = bowling_pins
      final_frame.is_first_throw = false
      return true
    end

    if !final_frame.is_first_throw && !final_frame.is_third_throw
      puts('Segundo intento final')
      total = final_frame.first_throw + bowling_pins
      final_frame.is_spare = true if total == 10
      final_frame.is_third_throw = true
      final_frame.second_throw = bowling_pins
      return true
    end

    final_throw = final_frame.is_third_throw && !@is_game_over && (final_frame.is_spare || final_frame.is_strike)

    if final_throw
      puts('tercer intento final')
      final_frame.third_throw = bowling_pins
      @is_game_over = true
      @state += 1
      true
    end
  end

  def calculate_bonus
    total = 0
    (0..(@state - 1)).each do |index|
      frame = @scoreboard[index]
      if frame.is_strike
        total += calculate_bonus_strike(index)
        frame.score_with_bonus = total
      end

      if frame.is_spare
        total += calculate_bonus_spare(index)
        frame.score_with_bonus = total
      end

      if !frame.is_strike && !frame.is_spare
        total += frame.score
        frame.score_with_bonus = total
      end
    end
    if @state == 9
      total += @scoreboard[9].score
      @scoreboard[9].score_with_bonus = total
    end
  end

  def calculate_bonus_strike(position)
    bonus = 0
    bonus = @scoreboard[position].score

    if position < 8
      if @scoreboard[position + 1].is_strike
        bonus += @scoreboard[position + 1].score
        bonus += @scoreboard[position + 2].first_throw
      else
        bonus += @scoreboard[position + 1].score
      end
    end

    if position == 8 && @scoreboard[8].is_strike
      bonus += @scoreboard[9].first_throw
      bonus += @scoreboard[9].second_throw
    end

    bonus
  end

  def calculate_bonus_spare(position)
    bonus = 0
    bonus = @scoreboard[position].score

    bonus += @scoreboard[position + 1].first_throw if position < 8

    bonus
  end
end
