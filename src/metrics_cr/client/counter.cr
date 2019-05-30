require "./metric"

module MetricsCr
  module Client
    class Counter < Metric
      getter value : UInt64 = 0

      # Increments the counter by provided value.
      #
      # ```
      # counter = MetricsCr::Client::Counter.new(name: "test")
      # counter.inc(by: 1) # => Nil
      # counter.inc        # => Nil
      # counter.value      # => 2
      # ```
      def inc(by : UInt64 = 1) : Nil
        @value += by
      end
    end
  end
end
