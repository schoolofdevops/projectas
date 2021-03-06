module RsyslogCookbook
  # helpers for the various service providers on Ubuntu systems
  module Helpers
    def find_provider
      if Chef::VersionConstraint.new('>= 15.04').include?(node['platform_version'])
        service_provider = Chef::Provider::Service::Systemd
      elsif Chef::VersionConstraint.new('>= 12.04').include?(node['platform_version'])
        service_provider = Chef::Provider::Service::Upstart
      else
        service_provider = nil
      end
      service_provider
    end
  end
end
