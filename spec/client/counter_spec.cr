require "spec"
require "../../src/metrics_cr/client/counter"

describe MetricsCr::Client::Counter do
  describe "#get" do
    it "by default it should be zero" do
      MetricsCr::Client::Counter.new(name: "test").get.should eq 0
    end
  end

  describe "#increase" do
    it "should increase the value" do
      counter = MetricsCr::Client::Counter.new(name: "test")

      counter.increase(by: 1).should eq 1
      counter.increase(by: 1).should eq 2
    end
  end
end
