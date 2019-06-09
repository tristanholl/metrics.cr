require "spec"
require "../spec_helper"

def setup_specs
  registry = MetricsCr::Client::Registry.new
  counter = MetricsCr::Metrics::Counter.new(name: "CounterName")

  return registry, counter
end

describe MetricsCr::Client::Registry do
  describe "#initialize" do
    it "creates an empty repository" do
      # Given
      registry, counter = setup_specs

      # Then
      registry.count.should eq(0)
    end
  end

  describe "#count" do
    it "returns number if metrics registered" do
      # Given
      registry, counter = setup_specs
      counter2 = MetricsCr::Metrics::Counter.new("CounterName2")

      # When
      registry.register(counter)
      registry.register(counter2)

      # Then
      registry.count.should eq(2)
    end
  end

  describe "#exists?" do
    it "returns true if metric is registered" do
      # Given
      registry, counter = setup_specs

      # When
      registry.register(counter)

      # Then
      registry.exists?(counter.name).should be_true
    end

    it "returns false if metric is not registered" do
      # Given
      registry = MetricsCr::Client::Registry.new

      # Then
      registry.exists?("not-registered").should be_false
    end
  end

  describe "#get" do
    it "returns single metric" do
      # Given
      registry, counter = setup_specs

      # When
      registry.register(counter)

      # Then
      registry.get(counter.name).should eq(counter)
    end
  end

  describe "#register" do
    it "successfully registers metric" do
      # Given
      registry, counter = setup_specs

      # When
      registry.register(counter)

      # Then
      registry.exists?(counter.name).should be_true
      counter.should eq(registry.get(counter.name))
    end

    it "fails on registering a duplicate" do
      # Given
      registry, counter = setup_specs

      # Then
      expect_raises(MetricsCr::Client::Registry::AlreadyRegisteredError) do
        # When
        registry.register(counter)
        registry.register(counter)
      end
    end
  end

  describe "#unregister" do
    it "successfully unregisters a metric" do
      # Given
      registry, counter = setup_specs
      registry.register(counter)

      # When
      registry.unregister(counter.name)

      # Then
      registry.exists?(counter.name).should be_false
      registry.count.should eq(0)
    end
  end
end
