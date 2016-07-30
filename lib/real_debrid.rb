# Wrapper pour l'API Real-Debrid
class RealDebrid

  VERSION = '0.0.0.dev'.freeze # Version

  # @!attribute [r] unrestrict
  #   @return [RealDebrid::Unrestrict] Gestion des débridages
  attr_reader :unrestrict

  # @!attribute api_key
  #   @return [String] Clé privée d'accès à l'API real-debrid
  attr_reader :api_key
  def api_key=(api_key)
    @api_key = api_key
    @unrestrict.api_key = api_key
  end

  # @param [Hash] options Options d'initialisation de real-debrid
  # @option options [String] api_key Clé privée d'accès à l'API real-debrid
  def initialize(options = {})
    @api_key = options[:api_key] if options[:api_key]
    @unrestrict = RealDebrid::Unrestrict.new @api_key
  end
end

require 'real_debrid/unrestrict'
