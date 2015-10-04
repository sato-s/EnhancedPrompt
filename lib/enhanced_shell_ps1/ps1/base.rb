
class EnhancedShellPs1::PS1

  # Responsible for delegating instructions to proper instance.
  # And convert into proper string after receiving Integer, AddrInfo or something else
  class Base

    def ipv4
      _network.ipv4 ? _network.ipv4.inspect_sockaddr : "No #{__method__}"
    end

    def ipv6
      _network.ipv6 ? _network.ipv6.inspect_sockaddr : "No #{__method__}"
    end

    def global_ipv4
      _network.global_ipv4 ? _network.global_ipv4.inspect_sockaddr : "No #{__method__}"
    end

    def global_ipv6
      _network.global_ipv6 ? _network.global_ipv6.inspect_sockaddr : "No #{__method__}"
    end

    def hostname_full
      _network.hostname_full || "No #{__method__}"
    end

    def hostname
      _network.hostname || "No #{__method__}"
    end

    def username
      _user.username || "No #{__method__}"
    end

    def groupname
      _user.groupname || "No #{__method__}"
    end

    def usernames
      _user.usernames.join(',')
    end

    def other_user_names
      _user.other_usernames.join(',')
    end

    def other_user_names_if_exists
      _user.other_users_count == 0 ?  '' : _user.other_usernames.join(',')
    end

    def users_count
      _user.users_count.to_s
    end

    def other_users_count
      _user.other_users_count.to_s
    end

    def login_count
      _user.login_count.to_s
    end

    def other_login_count
      _user.other_login_count.to_s
    end

    def uid
      _user.uid.to_s || "No #{__method__}"
    end

    def gid
      _user.gid.to_s || "No #{__method__}"
    end

    private
    def _network
      @network ||= Network.new
    end

    def _user
      @user ||= User.new
    end

  end

end

