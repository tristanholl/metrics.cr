module MetricsCr
  module Client
    abstract class Metric
      getter name : String

      def initialize(name : String)
        @name = name
      end
    end
  end
end
