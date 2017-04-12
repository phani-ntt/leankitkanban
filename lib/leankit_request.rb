module LeanKitRequest
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    private
    def get(api_call, options = {})
      url      = "#{LeanKitKanban::Config.uri}#{api_call}"
      headers("Content-Type" => "application/json", "Accept" => "application/json")
      response = super(url, {query: options}.merge(LeanKitKanban::Config.basic_auth_hash))
      parse_body(response.body)
    end

    def post(api_call, body)
      url = "#{LeanKitKanban::Config.uri}#{api_call}"
      headers("Content-Type" => "application/json", "Accept" => "application/json")
      request = LeanKitKanban::Config.basic_auth_hash
      request[:body] = body.to_json
      response = super(url, request)
      parse_body(response.body)
    end

    def parse_body(body)
      json_data = JSON.parse(body)
    end
  end
end
