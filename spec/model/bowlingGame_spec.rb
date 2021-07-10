require_relative '../../src/model/scoreboard'
require_relative '../../src/model/bowlingGame'

describe BowlingGame do
  before(:each) do
    score = Scoreboard.new
    @game = BowlingGame.new(score)
    @scoreboard = score.frames
  end

  describe 'play' do
    it 'describes when the user throws a bowling ball' do
      @game.play(2)
      @game.play(8)
      expect(@scoreboard[0].first_throw).to eql(2)
      expect(@scoreboard[0].second_throw).to eql(8)
    end
  end

  describe 'final_game?' do
    it 'describe when final round (round 10)' do
      @game.final_game(5)
      @game.final_game(2)
      expect(@scoreboard[9].score).to eql(7)
      expect(@scoreboard[9].is_spare).to eql(false)
    end
  end
end
