require 'socket'

class EnhancedPrompt::Prompt
  class Token::Network

    def initialize
      _ip_list
    end

    def hostname
      @hostname ||= hostname_full.split('.')[0]
    end

    def hostname_full
      @hostname ||= Socket.gethostname
    end

    def ipv4
      @ipv4 ||= global_ipv4
      @ipv4 ||= private_ipv4
    end

    def ipv6
      @ipv6 ||= global_ipv6
      @ipv6 ||= private_ipv6
    end

    def private_ipv4
      @private_ipv4 ||= @_ip_list.detect{|ip| ip.ipv4_private? }
    end

    def private_ipv6
      @private_ipv6 ||= @_ip_list.detect{|ip| !ip.ipv6_mc_global? && ip.ipv6?}
    end

    def global_ipv4
      @global_ipv4 ||= @_ip_list.detect{|ip| !ip.ipv4_private? && ip.ipv4?}
    end

    def global_ipv6
      @global_ipv6 ||= @_ip_list.detect{|ip| ip.ipv6_mc_global? && ip.ipv6? }
    end

    private
    def _ip_list
      @_ip_list ||= Socket.ip_address_list.delete_if{|ip|ip.ipv6_loopback? || ip.ipv4_loopback? }
    end

  end

end