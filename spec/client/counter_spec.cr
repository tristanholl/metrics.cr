require "spec"
require "../../src/metrics_cr/client/counter"

describe MetricsCr::Client::Counter do
  describe "#inc" do
    it "should increase by the value provided" do
      counter = MetricsCr::Client::Counter.new(name: "test")

      counter.inc(by: 1).should be nil
    end

    it "should increase by the default value" do
      counter = MetricsCr::Client::Counter.new(name: "test")

      counter.inc.should be nil
    end
  end
end
