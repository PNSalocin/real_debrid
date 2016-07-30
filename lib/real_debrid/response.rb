class RealDebrid
  # Réponse issue de RealDebrid
  class Response

    # @!attribute success
    #   @return [Bool] True si la réponse est satisfaisante, false dans le cas contraire
    attr_accessor :success

    # @!attribute body
    #   @return [Hash] Données retournées par Real-Debrid
    attr_accessor :body

    # Transforme un objet Net::HTTPResponse en RealDebrid::Response
    #
    # @param [Net::HTTPResponse] http_response Clé privée d'accès à l'API real-debrid
    # @return [RealDebrid::Response] Réponse convertie
    def self.process_http_response(http_response)
      response = RealDebrid::Response.new
      if http_response.code == '200'
        response.success = true

        require 'json'
        response.body = JSON.parse http_response.body
      else
        response.success = false
      end

      response
    end
  end
end
