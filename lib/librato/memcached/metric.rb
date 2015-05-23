module Librato
  module Memcached
    class Metric
      # Key which we don't really ever need metrics for
      def self.static_keys
        %w[ pointer_size libevent uptime time version pid ]
      end

      # These keys are 'gauges' which fill up & empty, and don't represent a value over a measure of
      # time (i.e. requests/sec, etc.)
      def self.gauge_keys
        %w[ bytes connection_structures curr_connections curr_items limit_maxbytes rusage_system rusage_user threads ]
      end

      def initialize(opts = {})
        opts.each do |k,v|
          instance_variable_set("@#{k}", v)
        end
      end

      def name
        @name.to_s
      end

      # Prepend the 'memcached.' namespace for the metrics we send
      def key
        raise "Unknown metric name given: #{name.inspect}" if name.empty?

        return "memcached.#{name}"
      end

      def metric_type
        raise "Unknown metric name given: #{name.inspect}" if name.empty?

        return :static  if self.class.static_keys.include?(name)
        return :gauge   if self.class.gauge_keys.include?(name)
        return :counter
      end

      def source
        @server.name
      end

      [:static, :gauge, :static].each do |m|
        define_method "#{m}?" do
          metric_type == m
        end
      end

      def to_hash
        {
          key => {
            :type => metric_type,
            :value => @value,
            :source => source,
            :measure_time => @time.is_a?(Time) ? @time.tv_sec : @time
          }
        }
      end
    end
  end
end
