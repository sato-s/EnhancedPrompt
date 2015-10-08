require_relative 'prompt/base'
require_relative 'prompt/network'
require_relative 'prompt/user'
require_relative './string'
require 'forwardable'

# Prompt class defines all user instruction commands
# Such as ip , ipv4 ...
# This must be exactly same name as instruction command name.
# Because we convert instruction command name into Prompt method directly
# make sure to EnhancedPrompt::Prompt.instance_methods(false) shows
# all instruction command name and no methods other than them.
class EnhancedPrompt::Prompt
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
                 :other_users_count,:login_count,:other_login_count,:uid,:gid,
                 :users_count_scale1 # TODO : should be method missing to ***_scale?

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