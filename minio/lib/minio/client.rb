module MinioRuby
  class Client
    class << self
      attr_accessor :configuration

      def configure
        self.configuration ||= Config.new
        yield(configuration) if block_given?
        configuration
      end
      alias_method :config, :configure

      def signer
        Signer.new(config: config)
      end
    end

    def config
      self.class.config
    end

    def bucket_exists?(name)
    end

    def make_bucket(bucketname, location='us-east-1')
      method = "PUT"
      headers = {'User-Agent' => 'MinioRuby'}
      content = ""
      signer = self.class.signer
      body = ""

      req = [config.endpoint, bucketname].join("/")

      content_sha256_hex = Digest::SHA256.hexdigest(content)

      headers = signer.sign_v4(method, req, headers, body, true)

      uri = URI.parse(self.class.config.endpoint + '/' + bucketname)

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = false

      req = Net::HTTP::Put.new(uri, headers)
      req.body = body
      https.set_debug_output($stdout)
      response = https.request(req)


      if response.code != "200"
        puts "Error Making bucket"
        false
      else
        puts "Made bucket"
        true
      end
    end
  end
end
