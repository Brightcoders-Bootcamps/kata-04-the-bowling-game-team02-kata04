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
    init_scoreboard
  end

  def init_scoreboard
    8.times { @frames << Frame.new(@frames) }
    @frames << PenultimateFrame.new(@frames)
    @frames << FrameFinal.new(@frames)
  end

  def next
    @state += 1
  end

  def print
    rows = []; scores = []; scores_with_bonus = []
    rows << (1..10).to_a
    (0..9).each do |index|
      frame = @frames[index]
      scores << frame.score_to_s
      scores_with_bonus << frame.score_with_bonus
    end
    rows << scores
    rows << scores_with_bonus
    table = Terminal::Table.new title: "Bowling Game #{@state}", rows: rows
    table.style = { alignment: :center }
    puts(table)
    puts
  end
end
