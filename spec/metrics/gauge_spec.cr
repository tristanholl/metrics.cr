require "spec"
require "../../src/metrics_cr/metrics/gauge"

describe MetricsCr::Metrics::Gauge do
  describe "#decrement" do
    it "decrements by the value provided" do
      gauge = MetricsCr::Metrics::Gauge.new(name: "test")

      gauge.decrement(by: 1.1).should be nil
    end

    it "decrements by the default value" do
      gauge = MetricsCr::Metrics::Gauge.new(name: "test")

      gauge.decrement.should be nil
    end
  end

  describe "#increment" do
    it "increments by the value provided" do
      gauge = MetricsCr::Metrics::Gauge.new(name: "test")

      gauge.increment(by: 1.1).should be nil
    end

    it "increments by the default value" do
      gauge = MetricsCr::Metrics::Gauge.new(name: "test")

      gauge.increment.should be nil
    end
  end
end
