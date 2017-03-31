module LeanKitKanban
  module Endpoint
    # Board endpoints
    GET_BOARDS                = "/board"
    GET_BOARD                 = "/board/{boardID}"

    # Card endpoints
    GET_CARDS         = "/card"
    DELETE_CARD      = "/card/{cardID}"
    FIND_CARD        = "/card/{cardID}"
    ADD_CARD         = "/card"
    UPDATE_CARD      = "/card/{cardID}"

    module ClassMethods
      # Method that replaces the arguments in an endpoint with the given parameters.
      # Arguments that are passed to the build_api_endpoint method, but do not
      # live in the endpoint, are discarded.
      def build_api_endpoint(api_endpoint_template, arguments = {})
        # Duplicate constant to temporary endpoint string
        api_endpoint_result = api_endpoint_template.dup
        # Endpoint parameters hash that links symbols to regex
        endpoint_parameters = { board:    /\{boardID\}/,
                                version:  /\{versionID\}/,
                                lane:     /\{laneID\}/,
                                card:     /\{cardID\}/,
                                external: /\{externalID\}/,
                                position: /\{position\}/,
                                comment:  /\{comment\}/
                              }
        # Loop over the given argument symbols, retrieve the corresponding regex
        # and replace the argument with the corresponding value.
        arguments.each do |k, v|
          api_endpoint_result.gsub!(endpoint_parameters.fetch(k), v.to_s)
        end

        return api_endpoint_result
      end

      # Make the method available for Rspec
      module_function :build_api_endpoint
    end

    def self.included(receiver)
      receiver.extend ClassMethods
    end
  end
end
