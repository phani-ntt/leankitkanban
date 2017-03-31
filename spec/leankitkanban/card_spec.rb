require "spec_helper"

describe LeanKitKanban::Card do
  before :all do
    @card_id   = double("cardID")
  end
  describe :find do
    it "should get the card" do
      api_call = "/card/#{@card_id}"
      LeanKitKanban::Card.should_receive(:get).with(api_call)
      LeanKitKanban::Card.find(@card_id)
    end
  end

  describe :delete do
    it "should delete the card from the given board" do
      api_call = "card/#{@card_id}"
      LeanKitKanban::Card.should_receive(:delete).with(api_call)
      LeanKitKanban::Card.delete(@card_id)
    end
  end

  describe :add do
    before :each do
      @board_id  = double("boardID")
      @body = { "title" => double("title"), "TypeId" => double("typeID")}
    end

    # it "should add the card into the lane and position provided" do
    #   api_call = "/Board/#{@board_id}/AddCard/Lane/#{@lane_id}/Position/#{@position}"
    #   LeanKitKanban::Card.should_receive(:post).with(api_call, @body)
    #   LeanKitKanban::Card.add(@board_id, @lane_id, @position, @body)
    # end
  end

  describe :update do
    before :each do
      @body = { "id" => double("id"), "title" => double("title"), "description" => double("description") }
    end

    it "should update the card using the title and description provided" do
      api_call = "card/#{@card_id}"
      LeanKitKanban::Card.should_receive(:post).with(api_call, @body)
      LeanKitKanban::Card.update(@board_id, @body)
    end
  end
end
