
module MetricsCr
  module Client
    class Counter < Metric
      @value = 0.0

      def get
        @value
      end

      def inc(x : Int | Float = 1.0)
        raise ArgumentError.new "Counter increments must be positive" if x < 0
        @value += x
      end

      # Sets the counter value to `0.0`.
      def reset
        @value = 0.0
      end
    end
  end
end
