require 'cdn'

module Edgecast
  describe CDN do
    let(:account_number) { '1234' }
    let(:api_key) { 'fake_key' }
    subject { Edgecast::CDN.new(account_number, api_key) }

    describe '#headers' do
      it 'should contain an authorization header with the api key' do
        subject.headers.should have_key 'Authorization'
        subject.headers['Authorization'].should == "TOK:#{api_key}"
      end

      it 'should contain a content-type header set to application/json' do
        subject.headers.should have_key 'Content-Type'
        subject.headers['Content-Type'].should == 'application/json'
      end

      it 'should contain an accept header set to application/json' do
        subject.headers.should have_key 'Accept'
        subject.headers['Accept'].should == 'application/json'
      end
    end

    describe '#asset_description' do
      let(:asset) { "/fake_asset" }

      it 'should contain a MediaPath key with the asset location' do
        subject.asset_description(asset).should have_key 'MediaPath'
        subject.asset_description(asset)['MediaPath'].should == "#{asset}"
      end

      it 'should contain a MediaType key with HTTP Small constant value' do
        subject.asset_description(asset).should have_key 'MediaType'
        subject.asset_description(asset)['MediaType'].should == Edgecast::CDN::PLATFORM_HTTP_SMALL
      end
    end

    describe '#purge' do
      let(:asset) { "/fake_asset" }
      let(:options) do
        {
          :body => subject.asset_description(asset).to_json,
          :headers => subject.headers
        }
      end

      before do
        subject.class.should_receive(:put).with("/v2/mcc/customers/#{account_number}/edge/purge", options)
      end

      it 'submits a put request to the purge API with the asset description' do
        subject.purge(asset)
      end
    end
  end
end
