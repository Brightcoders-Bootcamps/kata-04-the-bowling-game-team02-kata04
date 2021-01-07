# frozen_string_literal: true

require_relative 'frame'

# The Frame class models a frame from the bowling game
class PenultimateFrame < Frame
  def initialize(scoreboard, index)
    super(scoreboard, index)
  end

  def score
    first_throw + second_throw
  end

  def score_with_bonus
    @total = if is_strike
               score + @scoreboard[@index + 1].first_throw + @scoreboard[@index + 1].second_throw
             elsif is_spare
               score + @scoreboard[@index + 1].first_throw
             else
               score
             end
  end

  def to_s
    "first_throw: #{@first_throw}, second_throw: #{@second_throw} is_strike: #{@is_strike}, is_spare: #{@is_spare}, is_first_throw: #{@is_first_throw} score: #{score}"
  end
end
