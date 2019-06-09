require "spec"
require "../spec_helper"

describe MetricsCr::Metrics::Summary do
  describe "#observe" do
    it "observes by the value provided" do
      summary = MetricsCr::Metrics::Summary.new(name: "test")
      summary.observe(2).should be nil
    end
  end

  describe "#count" do
    it "is a getter for count" do
      summary = MetricsCr::Metrics::Summary.new(name: "test")
      summary.count.should eq 0
    end
  end

  describe "#sum" do
    it "is a getter for sum" do
      summary = MetricsCr::Metrics::Summary.new(name: "test")
      summary.sum.should eq 0
    end
  end

  describe "#value" do
    it "is a getter for value" do
      summary = MetricsCr::Metrics::Summary.new(name: "test")
      summary.value.should eq({0, 0})
    end
  end
end
