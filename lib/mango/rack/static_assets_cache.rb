module Mango
  module Rack
    class StaticAssetsCache
      # 12 hours in seconds
      MAX_AGE = 12 * 60 * 60

      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, body = @app.call(env)

        if cacheable_asset?(status, body)
          headers["Cache-Control"] = "public, max-age=#{MAX_AGE}"
        end

        [status, headers, body]
      end

      def cacheable_asset?(status, body)
        body.kind_of?(Sinatra::Helpers::StaticFile) && status.to_i == 200
      end
    end
  end
end
