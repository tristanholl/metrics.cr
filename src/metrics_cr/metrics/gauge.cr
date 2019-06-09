require "../metric"

module MetricsCr
  module Metrics
    class Gauge < Metric
      property value : Float64 = 0

      def initialize(@name : String, @value : Float64 = 0)
      end

      # Decrements the gauge by provided value.
      #
      # ```
      # gauge = MetricsCr::Metrics::Gauge.new(name: "test")
      # gauge.value = 3.14159    # => Nil
      # gauge.decrement(by: 1.1) # => Nil
      # gauge.value              # => 2.04159
      # ```
      def decrement(by : Float64 = 1.0) : Nil
        @value -= by
      end

      # Increments the counter by provided value.
      #
      # ```
      # gauge = MetricsCr::Metrics::Gauge.new(name: "test")
      # gauge.value = 3.14159    # => Nil
      # gauge.increment(by: 1.1) # => Nil
      # gauge.value              # => 3.24159
      # ```
      def increment(by : Float64 = 1.0) : Nil
        @value += by
      end
    end
  end
end
