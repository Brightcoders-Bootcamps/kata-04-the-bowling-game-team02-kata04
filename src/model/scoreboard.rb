# frozen_string_literal: true

require_relative 'frame'
require_relative 'penultimateFrame'
require_relative 'finalFrame'
require 'terminal-table'

# The FrameFinal class models a frame 10th from the bowling game
class Scoreboard
  attr_reader :frames, :state

  def initialize
    @frames = []
    @state = 1
    @total_score = 0
    init_scoreboard
  end

  def init_scoreboard
    (0..7).each { |index| @frames << Frame.new(@frames, index) }
    @frames << PenultimateFrame.new(@frames, 8)
    @frames << FrameFinal.new(@frames, 9)
  end

  def next
    @state += 1
  end

  def calculate_bonus
    @total_score = 0
    @frames.each do |frame|
      frame.score_with_bonus
      @total_score += frame.total
      frame.total = @total_score
    end
  end

  def print
    rows = create_rows
    print_table(rows)
  end

  def create_rows
    rows = []; scores = []; scores_with_bonus = []
    rows << (1..10).to_a
    @frames.each do |frame|
      scores << frame.score_to_s
      scores_with_bonus << frame.total
    end
    rows << scores
    rows << scores_with_bonus
  end

  def print_table(rows)
    table_score = Terminal::Table.new title: "Bowling Game #{@state}", rows: rows
    table_score.style = { alignment: :center }
    puts(table_score)
  end
end
