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
    if is_strike
      calculate_bonus_strike
    elsif is_spare
      calculate_bonus_spare
    else
      @total = score
    end
  end

  def calculate_bonus_strike
    next_one = @scoreboard[@index + 1]
    @total = score + next_one.first_throw + next_one.second_throw
  end

  def calculate_bonus_spare
    next_one = @scoreboard[@index + 1]
    @total = score + next_one.first_throw
  end
end
