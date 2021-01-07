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
    puts('GAME OVER') if @is_game_over

    if @state < 9
      throw_bowling_ball(bowling_pins)
    else
      @state = 10
      final_game(bowling_pins)
    end
    @scoreboard.calculate_bonus
    @scoreboard.print(@state)
  end

  def throw_bowling_ball(bowling_pins)
    frame = @scoreboard.frames[@state]

    if frame.is_first_throw
      frame.first_roll(bowling_pins)
      @state += 1 if bowling_pins == 10
    else
      frame.second_roll(bowling_pins)
      @state += 1
    end
  end

  def final_game(bowling_pins)
    final_frame = @scoreboard.frames[9]
    if final_frame.is_first_throw
      final_frame.first_roll(bowling_pins)
    elsif !final_frame.is_first_throw && !final_frame.is_third_throw
      final_frame.second_roll(bowling_pins)
      @is_game_over = !final_frame.is_spare && !final_frame.is_strike
    elsif final_frame.is_third_throw && (final_frame.is_spare || final_frame.is_strike)
      final_frame.third_roll(bowling_pins)
      @is_game_over = true
    end
  end
end
