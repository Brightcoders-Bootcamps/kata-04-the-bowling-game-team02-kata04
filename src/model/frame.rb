# frozen_string_literal: true

# The Frame class models a frame from the bowling game
class Frame
  attr_accessor :first_throw, :second_throw, :score_with_bonus, :is_strike, :is_spare, :is_first_throw

  def initialize
    @first_throw = 0
    @second_throw = 0
    @is_strike = false
    @is_spare = false
    @is_first_throw = true
    @score_with_bonus = 0
  end

  def score
    first_throw + second_throw
  end

  def to_s
    "first_throw: #{@first_throw}, second_throw: #{@second_throw} is_strike: #{@is_strike}, is_spare: #{@is_spare}, is_first_throw: #{@is_first_throw} score: #{score}"
  end
end
