# frozen_string_literal: true

module MinioRuby
  class Config
    attr_accessor :endpoint, :transport, :secure
    attr_accessor :access_key, :secret_key, :region
    attr_reader :service

    def initialize(args = {})
      @endpoint   = args[:endpoint] || 'http://localhost:9000'
      @access_key = args[:access_key]
      @secret_key = args[:secret_key]
      @secure     = args[:secure]
      @transport  = args[:transport]
      @region     = args[:region] || 'us-east-1'
      @service    = 's3'
    end
  end
end
