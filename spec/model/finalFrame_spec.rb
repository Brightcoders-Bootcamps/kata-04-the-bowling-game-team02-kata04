require_relative '../../src/model/scoreboard'
require_relative '../../src/model/finalFrame'

describe FrameFinal do
  before(:each) do
    @frame_final = Scoreboard.new.frames[9]
  end

  describe 'first_roll' do
    it 'describe when a user throws the first bowling ball of the round' do
      @frame_final.first_roll(2)
      expect(@frame_final.first_throw).to eql(2)
    end
  end

  describe 'first_roll' do
    it 'describe when is strike' do
      @frame_final.first_roll(10)
      expect(@frame_final.first_throw).to eql(10)
      expect(@frame_final.is_strike).to eql(true)
    end
  end

  describe 'second_roll?' do
    it 'describe when a user throws the second bowling ball of the round' do
      @frame_final.first_roll(2)
      @frame_final.second_roll(8)
      expect(@frame_final.second_throw).to eql(8)
      expect(@frame_final.is_spare).to eql(true)
    end
  end

  describe 'third_roll?' do
    it 'describe when a user throws the second bowling ball of the round' do
      @frame_final.first_roll(2)
      @frame_final.second_roll(8)
      @frame_final.third_roll(8)
      expect(@frame_final.third_throw).to eql(8)
    end
  end

  describe 'score' do
    it "returns the sum of the frame's score" do
      @frame_final.first_roll(2)
      @frame_final.second_roll(2)
      expect(@frame_final.score).to eql(4)
    end
  end

  describe 'score_with_bonus' do
    it "returns the sum of the frame's score with bonus" do
      @frame_final.first_roll(10)
      @frame_final.second_roll(10)
      @frame_final.third_roll(10)
      expect(@frame_final.score_with_bonus).to eql(30)
    end
  end
end
