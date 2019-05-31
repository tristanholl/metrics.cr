module MetricsCr
  abstract class Metric
    getter name : String

    def initialize(@name : String)
    end
  end
end
