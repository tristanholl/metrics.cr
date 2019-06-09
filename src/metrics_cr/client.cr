module MetricsCr
  module Client
    def self.registry
      @@registry ||= MetricsCr::Client::Registry.new
    end
  end
end
