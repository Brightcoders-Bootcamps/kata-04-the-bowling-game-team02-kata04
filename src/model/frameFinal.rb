# frozen_string_literal: true

require_relative 'frame'

# The FrameFinal class models a frame 10th from the bowling game
class FrameFinal < Frame
  attr_accessor :third_throw, :is_third_throw

  def initialize
    super
    @third_throw = 0
    @is_third_throw = false
  end

  def score
    @first_throw + @second_throw + @third_throw
  end

  def to_s
    "first_throw: #{@first_throw}, second_throw: #{@second_throw}, thrid_throw: #{@third_throw}, is_strike: #{@is_strike}, is_spare: #{@is_spare}, is_first_throw: #{@is_first_throw}, is_third_therow: #{@is_third_throw}, score: #{score}"
  end
end
