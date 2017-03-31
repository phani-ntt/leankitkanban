module LeanKitKanban
  module Board
    include HTTParty
    include LeanKitRequest
    include Endpoint

    def self.all
      get(GET_BOARDS)
    end

    def self.find(board_id)
      get(build_api_endpoint(GET_BOARD, board: board_id))
    end

  end
end
