require "spec"
require "../spec_helper"

describe MetricsCr::Exports::Standard do
  describe "#register" do
    it "registers standard metrics" do
      # Given
      registry = MetricsCr::Client::Registry.new

      # When
      MetricsCr::Exports::Standard.register(registry)

      # Then
      registry.count.should eq(6)
      registry.exists?("gc_heap_bytes")
      registry.exists?("gc_free_bytes")
      registry.exists?("gc_total_bytes")
      registry.exists?("gc_unmapped_bytes")
      registry.exists?("bytes_since_gc")
      registry.exists?("cpu_seconds_total")
    end
  end
end
