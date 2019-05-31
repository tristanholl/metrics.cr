require "../metric"

module MetricsCr
  module Metrics
    class Summary < Metric
      getter count : Int64 = 0
      getter sum : Int64 = 0

      def observe(value : Int64) : Nil
        @sum += 1
        @count += value
      end

      def value
        {@sum, @count}
      end
    end
  end
end
