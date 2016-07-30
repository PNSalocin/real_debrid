require 'real_debrid/core'

class RealDebrid
  # Gestion des débridages de liens
  class Unrestrict < Core

    # SUffixe de base des requêtes de débridages de lien
    URL_SUFFIX_BASE = '/unrestrict'.freeze

    # Effetue une requête de débridage d'un lien
    #
    # @param [String] link Ressource sur laquelle effectuer la requête en provenance de Real-debrid
    # @param [String] password Corps de la requête
    # @param [Int] remote Corps de la requête
    # @return [RealDebrid::Response] Réponse en provenance de Real-debrid
    def link(link, password = nil, remote = 0)
      params = {}
      params['link'] = link
      params['remote'] = remote
      params['password'] = password if password
      post_request URL_SUFFIX_BASE + '/link', params
    end
  end
end
