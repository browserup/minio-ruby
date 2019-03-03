# frozen_string_literal: true

module MinioRuby
  module Utils
    module_function

    def uri_escape_path(path)
      path.gsub(%r{[^/]+}) do |part|
        uri_escape(part)
      end
    end

    def uri_escape(string)
      return unless string

      CGI
        .escape(string.encode('UTF-8'))
        .gsub('+', '%20')
        .gsub('%7E', '~')
    end
  end
end
