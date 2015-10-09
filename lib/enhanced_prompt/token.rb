require_relative 'token/base'
require_relative 'token/network'
require_relative 'token/user'
require_relative 'token/dir'
require_relative 'token/system_resource'
require 'forwardable'

# Token class defines all user instruction commands
# Such as ip , ipv4 ...
# This must be exactly same name as instruction command name.
# Because we convert instruction command name into Token method directly
# make sure to EnhancedPrompt::Token.instance_methods(false) shows
# all instruction command name and no methods other than them.
module EnhancedPrompt::Token
  extend ::Forwardable
  $options = {:shell=>:debug}

  # In this section, we just delegate to @base class as is
  # In @base, I named methods to define their semantics
  # this is good for developing but not for users.
  # because it may too long. So in next section, def_delegator defines
  # user friendly aliases
  def_delegators :@base,
                 :ipv4,:ipv6,:global_ipv4,:global_ipv6,:hostname_full,:hostname,
                 :username,:groupname,:usernames,:other_user_names,
                 :other_user_names_if_exists, :users_count,
                 :other_users_count,:login_count,:my_login_count,:other_login_count,
                 :uid,:gid,
                 :users_count_scale1, # TODO : should be method missing to ***_scale?
                 :dir_abbreviated2

  def_delegators :@base,:my_login_count_scale

  # User friendly aliases
  def_delegator :@base, :ipv4, :ip
  def_delegator :@base, :hostname_full, :host_full
  def_delegator :@base, :hostname, :host
  def_delegator :@base, :username, :user
  def_delegator :@base, :groupname, :group

  def initialize()
    @base = Base.new
  end
end