require "./metrics_cr.cr"

MetricsCr::Exports::Standard.register(MetricsCr::Client.registry)

puts MetricsCr::Client.registry.get("gc_heap_bytes").value
