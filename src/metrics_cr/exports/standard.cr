module MetricsCr
  module Exports
    module Standard
      extend self

      def register(registry : MetricsCr::Client::Registry)
        tms = Process.times
        gc_stats = GC.stats

        registry.register(MetricsCr::Metrics::Gauge.new("gc_heap_bytes", gc_stats.heap_size.to_f))
        registry.register(MetricsCr::Metrics::Gauge.new("gc_free_bytes", gc_stats.free_bytes.to_f))
        registry.register(MetricsCr::Metrics::Gauge.new("gc_total_bytes", gc_stats.total_bytes.to_f))
        registry.register(MetricsCr::Metrics::Gauge.new("gc_unmapped_bytes", gc_stats.unmapped_bytes.to_f))
        registry.register(MetricsCr::Metrics::Gauge.new("bytes_since_gc", gc_stats.bytes_since_gc.to_f))
        registry.register(MetricsCr::Metrics::Gauge.new("cpu_seconds_total", tms.stime + tms.utime))
      end
    end
  end
end
