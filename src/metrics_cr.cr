require "./metrics_cr/*"
require "./metrics_cr/client/*"
require "./metrics_cr/metrics/*"

lib LibC
  fun getpagesize() : Int
end

# MetricsCr is a [Prometheus](https://prometheus.io/) client library
module MetricsCr
  class StandardExports
    def generate : (Array(MetricsCr::Metric) | Nil)
      # pid = Process.pid
      # if File.directory?("/proc/#{pid}/fd") && \
      #    File.file?("/proc/#{pid}/limits") && \
      #    File.file?("/proc/#{pid}/stat") && \
      #    File.file?("/proc/stat")
      #    Array(MetricsCr::Metric).new
      # else
      return collect_standard_metrics
      # end
    end

    def collect_standard_metrics
      tms = Process.times
      gc_stats = GC.stats

      std_metrics = [] of MetricsCr::Metric
      std_metrics << MetricsCr::Metrics::Gauge.new("gc_heap_bytes", gc_stats.heap_size.to_f)
      std_metrics << MetricsCr::Metrics::Gauge.new("gc_free_bytes", gc_stats.free_bytes.to_f)
      std_metrics << MetricsCr::Metrics::Gauge.new("gc_total_bytes", gc_stats.total_bytes.to_f)
      std_metrics << MetricsCr::Metrics::Gauge.new("gc_unmapped_bytes", gc_stats.unmapped_bytes.to_f)
      std_metrics << MetricsCr::Metrics::Gauge.new("bytes_since_gc", gc_stats.bytes_since_gc.to_f)
      std_metrics << MetricsCr::Metrics::Gauge.new("cpu_seconds_total", tms.stime + tms.utime)
      std_metrics
    end
  end
end

# loop do
#   MetricsCr::StandardExports.new.generate.each do |metric|
#     puts "#{metric.name}: #{metric.value}"
#   end
#   puts "-----------------------------"
#   sleep 0.2
# end
# puts LibC.getpagesize()
