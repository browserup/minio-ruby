require_relative '../spec_helper'

RSpec.describe MinioRuby::Client do
  described_class.config do |config|
    config.access_key = "key"
    config.secret_key = "secret"
    config.endpoint = "http://127.0.0.1:9000"
  end

  subject(:client) { described_class.new }

  context 'bucket' do
    it 'creates a bucket' do
      expect(client.make_bucket("chunky-bacon")).to be_truthy
    end
  end
end
