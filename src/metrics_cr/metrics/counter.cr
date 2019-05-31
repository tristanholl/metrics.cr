require "../metric"

module MetricsCr
  module Metrics
    class Counter < Metric
      getter value : UInt64 = 0

      # Increments the counter by provided value.
      #
      # ```
      # counter = MetricsCr::Metrics::Counter.new(name: "test")
      # counter.increment(by: 1) # => Nil
      # counter.increment        # => Nil
      # counter.value            # => 2
      # ```
      def increment(by : UInt64 = 1) : Nil
        @value += by
      end
    end
  end
end
