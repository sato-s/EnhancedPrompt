require 'socket'

class EnhancedShellPs1::PS1

  class Network < Base

    def initialize
      _ip_list
    end

    def hostname
      @hostname ||= Socket.gethostname
    end

    def ip
      @ip ||= global_ipv4
      @ip ||= private_ipv4
    end

    def private_ipv4
      @private_ipv4 ||= @_ip_list.detect{|ip| ip.ipv4_private? }
    end

    def private_ipv6
      @private_ipv6 ||= @_ip_list.detect{|ip| ip.ipv6_private? }
    end

    def global_ipv4
      @global_ipv4 ||= @_ip_list.detect{|ip| !ip.ipv4_private? && ip.ipv4?}
    end

    def global_ipv6
      @global_ipv4 ||= @_ip_list.detect{|ip| ip.ipv6_private? && ip.ipv6? }
    end

    private
    def _ip_list
      @_ip_list ||= Socket.ip_address_list.delete_if{|ip|ip.ipv6_loopback? || ip.ipv4_loopback? }
    end

  end

end