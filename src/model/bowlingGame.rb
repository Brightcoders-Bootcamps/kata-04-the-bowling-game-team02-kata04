# frozen_string_literal: true

require_relative 'frame'
require_relative 'finalFrame'
require 'terminal-table'

# the class BowlingGame describe a bowling game
class BowlingGame
  def initialize(scoreboard)
    @scoreboard = scoreboard
    @state = 0
    @is_game_over = false
  end

  def play(bowling_pins)
    final_game(bowling_pins) if @state == 9
    throw_bowling_ball(bowling_pins) if @state < 9
    @scoreboard.print
  end

  def throw_bowling_ball(bowling_pins)
    frame = @scoreboard.frames[@state]

    if frame.is_first_throw
      bowling_pins == 10 ? (frame.strike(bowling_pins); @state += 1) : frame.first_roll(bowling_pins)
    else
      total = bowling_pins + frame.first_throw
      total == 10 ? (frame.spare(bowling_pins); @state += 1) : (frame.second_roll(bowling_pins); @state += 1)
    end
  end

  def final_game(bowling_pins)
    final_frame = @scoreboard.frames[9]
    if final_frame.is_first_throw
      final_frame.first_roll(bowling_pins)
    elsif !final_frame.is_first_throw && !final_frame.is_third_throw
      final_frame.second_roll(bowling_pins)
      @is_game_over = true unless final_frame.is_spare && final_frame.is_strike
    elsif final_frame.is_third_throw && (final_frame.is_spare || final_frame.is_strike)
      final_frame.third_roll(bowling_pins)
      @is_game_over = true
      @state += 1
    end
  end

  #   def calculate_bonus
  #     total = 0
  #     (0..(@state - 1)).each do |index|
  #       frame = @scoreboard[index]
  #       if frame.is_strike
  #         total += calculate_bonus_strike(index)
  #         frame.score_with_bonus = total
  #       end

  #       if frame.is_spare
  #         total += calculate_bonus_spare(index)
  #         frame.score_with_bonus = total
  #       end

  #       if !frame.is_strike && !frame.is_spare
  #         total += frame.score
  #         frame.score_with_bonus = total
  #       end
  #     end
  #     if @state == 9
  #       total += @scoreboard[9].score
  #       @scoreboard[9].score_with_bonus = total
  #     end
  #   end

  #   def calculate_bonus_strike(position)
  #     bonus = 0
  #     bonus = @scoreboard[position].score

  #     if position < 8
  #       if @scoreboard[position + 1].is_strike
  #         bonus += @scoreboard[position + 1].score
  #         bonus += @scoreboard[position + 2].first_throw
  #       else
  #         bonus += @scoreboard[position + 1].score
  #       end
  #     end

  #     if position == 8 && @scoreboard[8].is_strike
  #       bonus += @scoreboard[9].first_throw
  #       bonus += @scoreboard[9].second_throw
  #     end

  #     bonus
  #   end

  #   def calculate_bonus_spare(position)
  #     bonus = 0
  #     bonus = @scoreboard[position].score

  #     bonus += @scoreboard[position + 1].first_throw if position < 8

  #     bonus
  #   end
end
