# frozen_string_literal: true

module MinioRuby
  class Digestor
    class << self
      def hexdigest(value)
        Digest::SHA256.new.update(value).hexdigest
      end

      def hmac(key, value)
        OpenSSL::HMAC.hexdigest(digest, key, value)
      end

      def hexhmac(key, value)
        OpenSSL::HMAC.hexdigest(digest, key, value)
      end

      def base64(value)
        Digest::MD5.base64digest(value)
      end

      private

      def digest
        OpenSSL::Digest.new('sha256')
      end
    end
  end
end
