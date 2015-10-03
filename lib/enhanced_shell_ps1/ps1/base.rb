
class EnhancedShellPs1::PS1

  class Base

    def ip
      @network ||= Network.new
      @network.ip
    end

    def global_ipv4
      @network ||= Network.new
      @network.global_ipv4
    end

    def global_ipv6
      @network ||= Network.new
      @network.ip_address_private
    end

    def hostname
      @network ||= Network.new
      @network.hostname
    end

    def _colorize

    end

  end

end

