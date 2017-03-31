require "spec_helper"

describe LeanKitKanban::board do
  before :all do
    ConfigHelper.set_test_config
  end

  describe :all do
    it "should get all boards for the given account" do
      api_call = "/board"
      LeanKitKanban::board.should_receive(:get).with(api_call)
      LeanKitKanban::board.all
    end
  end

  describe :find do
    before :each do
      @board_id  = double("boardID")
    end

    it "should get the board" do
      api_call = "/board/#{@board_id}"
      LeanKitKanban::board.should_receive(:get).with(api_call)
      LeanKitKanban::board.find(@board_id)
    end
  end
end
