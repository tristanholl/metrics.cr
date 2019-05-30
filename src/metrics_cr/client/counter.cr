require "./metric"

module MetricsCr
  module Client
    class Counter < Metric
      getter value : UInt64 = 0

      # Increments the counter by provided value.
      #
      # ```
      # MetricsCr::Client::Counter.new(name: "test").inc(by: 1) # => Nil
      # ```
      def inc(by : UInt64) : Nil
        @value += by
      end
    end
  end
end
