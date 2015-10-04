require_relative 'ps1/base'
require_relative 'ps1/network'
require_relative 'ps1/user'

require 'forwardable'
# PS1 class defines all user instruction commands
# Such as ip , ipv4 ...
# This must be exactly same name as instruction command name.
# Because we convert instruction command name into PS1 method directly
# make sure to EnhancedShellPs1::PS1.instance_methods(false) shows
# all instruction command name and no other than them.
class EnhancedShellPs1::PS1
  extend ::Forwardable

  def_delegators :@base,
                 :ipv4,:ipv6,:global_ipv4,:global_ipv6,:hostname_full,:hostname,
                 :username,:groupname,:usernames,:other_user_names,
                 :other_user_names_if_exists, :users_count,
                 :other_users_count,:login_count,:other_login_count,:uid,:gid,
                 :users_count_scale1 # TODO : should be method missing to ***_scale
  # Aliases
  def_delegator :@base, :ipv4, :ip
  def_delegator :@base, :hostname_full, :host_full
  def_delegator :@base, :hostname, :host
  def_delegator :@base, :username, :user
  def_delegator :@base, :groupname, :group

  def initialize(dir="?")
    @dir=dir
    @base = Base.new
  end

  def dir

  end

end