require 'net/http'
require 'openssl'

class RealDebrid
  # Méthodes communes aux différentes sous-classes du wrapper
  class Core

    # Hôte de base
    API_HOST = 'api.real-debrid.com'.freeze

    # URL de base des différentes méthodes
    API_BASE_URL = '/rest/1.0'.freeze

    # @param [String] api_key Clé privée d'accès à l'API real-debrid
    def initialize(api_key = nil)
      @api_key = api_key

      # Initialisation de Net::HTTP qui sera utilisé pour l'intégralité des requêtes vers Real-debrid
      @http = Net::HTTP.new API_HOST, 443
      @http.use_ssl = true
      @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    protected

    # Effectue une requête POST vers real-debrid
    #
    # @param [String] uri Ressource sur laquelle effectuer la requête en provenance de Real-debrid
    # @param [Hash] body Corps de la requête
    # @return [RealDebrid::Response] Réponse en provenance de Real-debrid
    def post_request(uri, body = nil)
      request = Net::HTTP::Post.new API_BASE_URL + uri, 'Content-Type': 'application/json'
      request['Authorization'] = 'Bearer ' + @api_key
      request.set_form_data body if body
      response = @http.request request

      require 'real_debrid/response'
      RealDebrid::Response.process_http_response response
    end
  end
end
