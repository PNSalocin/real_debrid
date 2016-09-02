class RealDebrid
  # Réponse issue de RealDebrid
  class Response

    # @!attribute success
    #   @return [Bool] Code HTTP de la requête effectuée
    attr_accessor :code

    # @!attribute reason
    #   @return [String] Détails associés au code HTTP de la requête
    attr_accessor :reason

    # @!attribute success
    #   @return [Bool] True si la réponse est satisfaisante, false dans le cas contraire
    attr_accessor :success

    # @!attribute body
    #   @return [Hash] Données retournées par Real-Debrid
    attr_accessor :body

    # Hash des codes de retour possibles en provenance de Real-Debrid
    REASON_CODES = {
        400 => 'Bad Request (see error message)',
        401 => 'Bad token (expired, invalid)',
        403 => 'Permission denied (account locked)',
        503 => 'Service unavailable'
    }

    # Transforme un objet Net::HTTPResponse en RealDebrid::Response
    #
    # @param [Net::HTTPResponse] http_response Clé privée d'accès à l'API real-debrid
    # @return [RealDebrid::Response] Réponse convertie
    def self.process_http_response(http_response)
      response = RealDebrid::Response.new
      response.code = http_response.code
      response.success = (http_response.code == '200')

      if http_response.code == '200'
        require 'json'
        response.body = JSON.parse http_response.body
      else
        response.reason = get_reason_from_code http_response.code
      end

      response
    end

    def self.get_reason_from_code code
      self::REASON_CODES[code]
    end
  end
end
