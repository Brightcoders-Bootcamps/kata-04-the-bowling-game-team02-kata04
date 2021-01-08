require_relative '../../src/model/scoreboard'
require_relative '../../src/model/frame'

describe Frame do
  before(:each) do
    @frame = Scoreboard.new.frames
  end

  describe 'first_roll' do
    it 'describe when a user throws the first bowling ball of the round' do
      frame_one = @frame[0]
      frame_one.first_roll(2)
      expect(frame_one.first_throw).to eql(2)
    end
  end

  describe 'first_roll' do
    it 'describe when is strike' do
      frame_one = @frame[0]
      frame_one.first_roll(10)
      expect(frame_one.first_throw).to eql(10)
      expect(frame_one.is_strike).to eql(true)
    end
  end

  describe 'second_roll?' do
    it 'describe when a user throws the second bowling ball of the round' do
      frame_one = @frame[0]
      frame_one.first_roll(2)
      frame_one.second_roll(8)
      expect(frame_one.second_throw).to eql(8)
      expect(frame_one.is_spare).to eql(true)
    end
  end

  describe 'score' do
    it "returns the sum of the frame's score" do
      frame_one = @frame[0]
      frame_one.first_roll(2)
      frame_one.second_roll(2)
      expect(frame_one.score).to eql(4)
    end
  end

  describe 'score_with_bonus' do
    it "returns the sum of the frame's score with bonus" do
      @frame[0].first_roll(10)
      @frame[1].first_roll(10)
      @frame[2].first_roll(10)
      expect(@frame[0].score_with_bonus).to eql(30)
    end
  end
end
