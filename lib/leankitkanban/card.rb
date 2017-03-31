module LeanKitKanban
  module Card
    include HTTParty
    include LeanKitRequest
    include Endpoint

    def self.delete(card_id)
      delete(build_api_endpoint(DELETE_CARD, card_id: card_id), {})
    end

    def self.find(card_id)
      get(build_api_endpoint(FIND_CARD, board: board_id, card: card_id))
    end

    def self.addbody)
      post(build_api_endpoint(ADD_CARD), body)
    end

    def self.update(body)
      patch(build_api_endpoint(UPDATE_CARD), body)
    end
  end
end
