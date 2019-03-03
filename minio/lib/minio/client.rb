# frozen_string_literal: true

module MinioRuby
  class Client
    class << self
      def configuration
        @configuration ||= Config.new
        @configuration
      end

      def configure
        yield(configuration) if block_given?
        configuration
      end
      alias config configure
    end

    def bucket_exists?(name)
      request_url = "#{config.endpoint}/#{name}"
      signature = signer.sign_request(http_method: :head, url: request_url)
      response = RestClient.head(request_url, signature.headers)

      response.code == 200
    rescue RestClient::NotFound => exception
      false
    end

    def make_bucket(name)
      if name.include?('/')
        msg = ':bucket name must not contain a forward-slash (/)'
        raise InvalidBucketName, msg
      end

      request_url = "#{config.endpoint}/#{name}"
      signature = signer.sign_request(http_method: :put, url: request_url)
      response = RestClient.put(request_url, {}, signature.headers)

      response.code == 200
    end

    def list_buckets
      request_url = "#{config.endpoint}/"
      signature = signer.sign_request(http_method: :get, url: request_url)

      response = RestClient.get(request_url, signature.headers)
      Bucket.bulk_init_from_xml(response.body)
    end

    def remove_bucket(name)
      request_url = "#{config.endpoint}/#{name}"
      signature = signer.sign_request(http_method: :delete, url: request_url)
      response = RestClient.delete(request_url, signature.headers)

      response.code == 204
    rescue RestClient::NotFound => exception
      false
    end

    def get_object(bucket, name)
      request_url = "#{config.endpoint}/#{bucket}/#{name}"
      signature = signer.sign_request(http_method: :get, url: request_url)
      RestClient.get(request_url, signature.headers)
    end

    def put_object(bucket, name, data, length: nil, content_type: 'application/octet-stream')
      request_url = "#{config.endpoint}/#{bucket}/#{name}"
      signature = signer.sign_request(http_method: :put, url: request_url, body: data, headers: { 'content_type' => content_type })
      RestClient.put(request_url, data, signature.headers)
    end

    private

    def config
      self.class.config
    end

    def signer
      Signer.new(config: config)
    end
  end
end
