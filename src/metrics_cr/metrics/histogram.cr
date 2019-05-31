require "../metric"

module MetricsCr
  module Metrics
    class Histogram < Metric
      # DEFAULT_BUCKETS are the default Histogram buckets. The default buckets
      # are tailored to broadly measure the response time (in seconds) of a
      # network service. (From DefBuckets client_golang)
      DEFAULT_BUCKETS = [
        0.005, 0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1, 2.5, 5, 10,
      ]

      getter value = {} of String => Float64

      def initialize(@name : String, @buckets = DEFAULT_BUCKETS)
        (@buckets + ["+Inf", "sum"]).each { |v| @value[v.to_s] = 0.0 }
      end

      def observe(value : Float64) : Nil
        @value[
          (@buckets.find { |upper_limit| upper_limit > value } || "+Inf").to_s,
        ] += 1

        @value["sum"] += value
      end
    end
  end
end
