# frozen_string_literal: true

require 'base64'
require 'openssl'
require 'uri'
require 'digest'
require 'rest-client'
require 'time'
require 'pathname'
require 'pry'
require 'set'
require 'cgi'
require 'nokogiri'

require 'minio_ruby/config'
require 'minio_ruby/utils'
require 'minio_ruby/signature'
require 'minio_ruby/signer'
require 'minio_ruby/digestor'
require 'minio_ruby/bucket'
require 'minio_ruby/client'

module MinioRuby
  class Error < StandardError; end
  class MissingHttpMethodError < Error; end
  class MissingUrlError < Error; end
  class InvalidBucketName < Error; end
end
