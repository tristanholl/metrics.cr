require "./metric"

module MetricsCr
  module Client
    class Counter < Metric
      @value = 0_u64

      def get
        @value
      end

      # Increments the counter by
      def increase(by : UInt64)
        @value += by
      end
    end
  end
end
