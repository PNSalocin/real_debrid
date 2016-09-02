require 'real_debrid/core'

class RealDebrid
  # Gestion des débridages de liens
  class Unrestrict < Core

    URL_SUFFIX_BASE = '/unrestrict'.freeze  # Suffixe de base des requêtes de débridages de lien
    URL_SUFFIX_CHECK = '/check'.freeze      # Suffixe des requêtes de validation de liens
    URL_SUFFIX_LINK = '/link'.freeze        # Suffixe des requêtes de débridage de liens
    URL_SUFFIX_FOLDER = '/folder'.freeze    # Suffixe des requêtes de débridage de dossiers

    # Effetue une requête de validation d'un lien
    #
    # @param [String] link Ressource sur laquelle effectuer la requête en provenance de Real-debrid
    # @param [String] password Corps de la requête
    # @return [RealDebrid::Response] Réponse en provenance de Real-debrid
    def check(link, password = nil)
      params = { 'link': link, 'password': password }
      post_request URL_SUFFIX_BASE + URL_SUFFIX_CHECK, params, {
          503 => 'File unavailable'
      }
    end

    # Effetue une requête de débridage d'un lien
    #
    # @param [String] link Lien à débrider
    # @param [String] password (optionnel) Mot de passe du lien
    # @param [Int] remote 0 ou 1, Utilisation du trafic remote
    # @return [RealDebrid::Response] Réponse en provenance de Real-debrid
    def link(link, password = nil, remote = 0)
      params = { 'link': link, 'remote': remote }
      params['password'] = password if password
      post_request URL_SUFFIX_BASE + URL_SUFFIX_LINK, params
    end

    # Effetue une requête de débridage d'un dossier
    #
    # @param [String] folder Dossier à débrider
    # @return [RealDebrid::Response] Réponse en provenance de Real-debrid
    def folder(folder)
      params = { 'link': folder }
      post_request URL_SUFFIX_BASE + URL_SUFFIX_FOLDER, params
    end

    # Effetue une requête de débridage d'un dossier
    #
    # @param [String] folder Dossier à débrider
    # @return [RealDebrid::Response] Réponse en provenance de Real-debrid
    def container_link(folder)
      params = { 'link': folder }
      post_request URL_SUFFIX_BASE + URL_SUFFIX_FOLDER, params
    end
  end
end
