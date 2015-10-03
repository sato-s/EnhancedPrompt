
class EnhancedShellPs1::PS1

  class Base

    def ip
      network.ipv4 ? network.ipv4.inspect_sockaddr : "No #{__method__}"
    end

    def ipv4
      ip
    end

    def ipv6
      network.ipv6 ? network.ipv6.inspect_sockaddr : "No #{__method__}"
    end

    def global_ipv4
      network.global_ipv4 ? network.global_ipv4.inspect_sockaddr : "No #{__method__}"
    end

    def global_ipv6
      network.global_ipv6 ? network.global_ipv6.inspect_sockaddr : "No #{__method__}"
    end

    def hostname
      network.hostname || "No #{__method__}"
    end

    def username
      etc.username
    end

    def _colorize

    end

    private
    def network
      @network ||= Network.new
    end

    def etc
      @etc ||= Etc.new
    end

  end

end

