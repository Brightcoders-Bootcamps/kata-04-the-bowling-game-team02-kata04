# frozen_string_literal: true

# The Frame class models a frame from the bowling game
class Frame
  attr_accessor :first_throw, :second_throw, :is_strike, :is_spare, :is_first_throw, :total
  attr_reader :scoreboard

  def initialize(scoreboard, index)
    @index = index
    @scoreboard = scoreboard
    @first_throw = 0
    @second_throw = 0
    @is_strike = false
    @is_spare = false
    @is_first_throw = true
    @total = 0
  end

  def first_roll(bowling_pins)
    @first_throw = bowling_pins
    @is_first_throw = false
  end

  def second_roll(bowling_pins)
    @second_throw = bowling_pins
  end

  def spare(bowling_pins)
    @second_throw = bowling_pins
    @is_spare = true
  end

  def strike(bowling_pins)
    @first_throw = bowling_pins
    @is_first_throw = false
    @is_strike = true
  end

  def score
    first_throw + second_throw
  end

  def score_to_s
    return "#{@first_throw} | -" if is_strike

    "#{@first_throw} | #{@second_throw}"
  end

  def score_with_bonus
    if is_strike
      @total = @scoreboard[@index + 1].is_strike ? score + @scoreboard[@index + 1].first_throw + @scoreboard[@index + 2].first_throw : @scoreboard[@index + 1].score
    elsif is_spare
      @total = score + @scoreboard[@index + 1].first_throw
    else
      @total = + score
    end
  end

  def to_s
    "first_throw: #{@first_throw}, second_throw: #{@second_throw} is_strike: #{@is_strike}, is_spare: #{@is_spare}, is_first_throw: #{@is_first_throw} score: #{score}"
  end
end
