require "spec"
require "../spec_helper"

describe MetricsCr::Metrics::Counter do
  describe "#increment" do
    it "increments by the value provided" do
      counter = MetricsCr::Metrics::Counter.new(name: "test")

      counter.increment(by: 1).should be nil
    end

    it "increments by the default value" do
      counter = MetricsCr::Metrics::Counter.new(name: "test")

      counter.increment.should be nil
    end
  end
end
