require 'spec_helper'

describe RealDebrid::Unrestrict do
  before {
    stub_request(:post, construct_url(RealDebrid::Unrestrict::URL_SUFFIX_LINK))
        .to_return(body: "abc")

    @realdebrid = RealDebrid.new api_key: 'API_KEY'
  }



  context 'post_request' do
    context '200' do


      it 'should be k' do

        response = @realdebrid.unrestrict.link 'https://www.youtube.com/watch?v=SxNcKXjfaQo'
        expect(response.success).to eq true
      end
    end

    context '401' do

    end

    context '403' do

    end

    context '503' do

    end
  end
end