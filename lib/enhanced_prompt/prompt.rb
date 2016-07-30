require_relative './string/string'
require_relative 'token/token'
require_relative 'token/git'
require_relative 'token/time'
require_relative './token/network'
require_relative './token/user'
require_relative './token/dir'
require_relative './token/system_resource'
require_relative './style/style'

require 'forwardable'

class EnhancedPrompt::Prompt

end

# Prompt class defines all user instruction commands
# Such as ip , ipv4 ...
# This must be exactly same name as instruction command name.
# Because we convert instruction command name into Prompt method directly
# make sure that EnhancedPrompt::Prompt.instance_methods(false) shows
# all instruction command name and no methods other than them.
class EnhancedPrompt::Prompt
  extend ::Forwardable
  include Style

  # In this section, we just delegate to @base class as is
  # In @base, I named methods to define their semantics
  # this is good for developing but not always good for users.
  # because it may too long. So in next section, def_delegator defines
  # user friendly aliases
  def_delegators :@token,
                 :ipv4,:ipv6,:global_ipv4,:global_ipv6,:hostname_full,:hostname,
                 :username,:groupname,:usernames,:other_user_names,
                 :other_user_names_if_exists, :users_count,
                 :other_users_count,:login_count,:my_login_count,:other_login_count,
                 :uid,:gid,
                 :users_count_scale1, # TODO : should be method missing to ***_scale?
                 :dir_abbreviated2,
                :time1,
                 :git

  def_delegators :@token,:my_login_count_scale
  # User friendly aliases
  def_delegator :@token, :ipv4, :ip
  def_delegator :@token, :hostname_full, :host_full
  def_delegator :@token, :hostname, :host
  def_delegator :@token, :username, :user
  def_delegator :@token, :groupname, :group

  def initialize
    @token =Token.new
  end

end
