# frozen_string_literal: true

require_relative 'frame'

# The Frame class models a frame from the bowling game
class PenultimateFrame < Frame
  def initialize(scoreboard)
    super(scoreboard)
  end

  def score
    first_throw + second_throw
  end

  def score_with_bonus
    2
  end

  def to_s
    "first_throw: #{@first_throw}, second_throw: #{@second_throw} is_strike: #{@is_strike}, is_spare: #{@is_spare}, is_first_throw: #{@is_first_throw} score: #{score}"
  end
end
