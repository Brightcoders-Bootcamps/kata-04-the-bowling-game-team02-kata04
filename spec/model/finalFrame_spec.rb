require_relative '../../src/model/scoreboard'
require_relative '../../src/model/finalFrame'

describe FrameFinal do
  before(:each) do
    @frame = Scoreboard.new.frames
  end

  describe 'first_roll' do
    it 'describe when a user throws the first bowling ball of the round' do
      @frame[9].first_roll(2)
      expect(@frame[9].first_throw).to eql(2)
      @frame[9].first_roll(10)
      expect(@frame[9].first_throw).to eql(10)
      expect(@frame[9].is_strike).to eql(true)
    end
  end

  describe 'second_roll?' do
    it 'describe when a user throws the second bowling ball of the round' do
      @frame[9].first_roll(2)
      @frame[9].second_roll(8)
      expect(@frame[9].second_throw).to eql(8)
      expect(@frame[9].is_spare).to eql(true)
    end
  end

  describe 'third_roll?' do
    it 'describe when a user throws the second bowling ball of the round' do
      @frame[9].first_roll(2)
      @frame[9].second_roll(8)
      @frame[9].third_roll(8)
      expect(@frame[9].third_throw).to eql(8)
    end
  end

  describe 'score' do
    it "returns the sum of the frame's score" do
      @frame[9].first_roll(2)
      @frame[9].second_roll(2)
      expect(@frame[9].score).to eql(4)
    end
  end

  describe 'score_with_bonus' do
    it "returns the sum of the frame's score with bonus" do
      @frame[9].first_roll(10)
      @frame[9].second_roll(10)
      @frame[9].third_roll(10)
      expect(@frame[9].score_with_bonus).to eql(30)
    end
  end
end
