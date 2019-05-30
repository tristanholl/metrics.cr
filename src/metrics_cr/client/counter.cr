require "./metric"

module MetricsCr
  module Client
    class Counter < Metric
      @value = 0_u64
      property value

      # Increments the counter by
      def inc(by : UInt64)
        @value += by
      end
    end
  end
end
