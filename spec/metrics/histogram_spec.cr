require "spec"
require "../spec_helper"

describe MetricsCr::Metrics::Histogram do
  describe "#initiate" do
    it "initiates the class" do
      histogram = MetricsCr::Metrics::Histogram.new(name: "test")

      histogram.should be_a MetricsCr::Metrics::Histogram
    end
  end

  describe "#observe" do
    it "observes by the value provided" do
      histogram = MetricsCr::Metrics::Histogram.new(name: "test")
      histogram.observe(0.09).should be nil
    end
  end
end
