class EnhancedShellPs1::PS1

  attr_accessor :dir

  def initialize(dir="?")
    @dir=dir
    @base = Base.new
  end

  def ip
    @base.ip
  end

  def global_ipv4
    @base.global_ipv4
  end

  def global_ipv6
    @base.ip_address_private
  end

  def hostname
    @base.hostname
  end

end