module Librato
  module Memcached
    class Server
      attr_reader :hostname

      def initialize(hostname)
        @hostname = hostname
      end

      def name
        hostname.split(":").first
      end
    end
  end
end
