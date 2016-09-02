module Helpers
  module Url

    #
    #
    #
    def construct_url(suffix)
      'https://' + RealDebrid::Core::API_HOST + RealDebrid::Core::API_BASE_URI +
          described_class::URL_SUFFIX_BASE + suffix
    end
  end
end
