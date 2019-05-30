module MetricsCr
  module Client
    class Registry
      class AlreadyRegisteredError < Exception; end

      def initialize
        @metrics = {} of String => Metric
        @mutex = Mutex.new
      end

      def count
        @metrics.size
      end

      def exists?(name)
        @metrics.has_key?(name)
      end

      def get(name)
        @metrics[name]
      end

      def register(metric : Metric)
        @mutex.synchronize do
          raise(AlreadyRegisteredError.new) if @metrics.has_key?(metric.name)

          @metrics[metric.name] = metric
        end
      end

      def unregister(name : String)
        @mutex.synchronize do
          @metrics.delete(name)
        end
      end
    end
  end
end
