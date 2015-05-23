require "dalli"
require "librato/metrics"

require "librato/memcached/metric"
require "librato/memcached/server"

module Librato
  module Memcached
    VERSION = "0.1.0"

    # Builds a Dalli::Client object with either ENV["MEMCACHE_SERVERS"]
    # or the default: '127.0.0.1:11211'
    def client
      Dalli::Client.new
    end

    def servers
      client.instance_variable_get('@servers').map do |host|
        Server.new(host)
      end
    end

    def collect!(queue = Librato::Metrics::Queue.new)
      time = Time.now

      client.stats.each_pair do |hostname, metrics|
        server = Librato::Memcached::Server.new(hostname)

        metrics.each do |key, value|
          metric = Librato::Memcached::Metric.new(
            :name => key,
            :value => value,
            :server => server,
            :time => time
          )

          queue.add(metric.to_hash) unless metric.static?
        end
      end

      return queue
    end

    extend self
  end
end
