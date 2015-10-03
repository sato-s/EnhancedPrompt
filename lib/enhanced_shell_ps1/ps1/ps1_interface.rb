class EnhancedShellPs1::PS1

  attr_accessor :dir
  extend Forwardable

  def_delegators :@base, :ip,:ipv4,:ipv6,:global_ipv4,:global_ipv6,:hostname,:username

  def initialize(dir="?")
    @dir=dir
    @base = Base.new
  end

end