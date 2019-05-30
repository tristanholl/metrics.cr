require "spec"
require "../../src/metrics_cr/client/counter"

describe MetricsCr::Client::Counter do
  describe "#inc" do
    it "should increase the value" do
      counter = MetricsCr::Client::Counter.new(name: "test")

      counter.inc(by: 1).should eq 1
      counter.inc(by: 1).should eq 2
    end
  end
end
