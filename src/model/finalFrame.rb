# frozen_string_literal: true

require_relative 'frame'

# The FrameFinal class models a frame 10th from the bowling game
class FrameFinal < Frame
  attr_accessor :third_throw, :is_third_throw

  def initialize(scoreboard, index)
    super(scoreboard, index)
    @third_throw = 0
    @is_third_throw = false
  end

  def first_roll(bowling_pins)
    @first_throw = bowling_pins
    @is_first_throw = false
    strike if bowling_pins == 10
  end

  def second_roll(bowling_pins)
    @second_throw = bowling_pins
    @is_third_throw = true
    total = first_throw + bowling_pins
    spare if total == 10
  end

  def third_roll(bowling_pins)
    @third_throw = bowling_pins
  end

  def spare
    @is_spare = true
  end

  def strike
    @is_strike = true
  end

  def score
    @first_throw + @second_throw + @third_throw
  end

  def score_to_s
    return "#{@first_throw} | #{@second_throw} | #{@third_throw}" unless is_spare && is_strike

    "#{@first_throw} | #{@second_throw} | #{@third_throw}"
  end

  def score_with_bonus
    @total = score
  end
end
