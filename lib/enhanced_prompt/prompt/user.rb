require 'etc'

class EnhancedPrompt::Prompt
  class Base::User

    # Shows your username
    def username
      @username ||= ENV['USER'] || ENV['LOGNAME'] || Etc.getlogin
    end

    # Shows usernames currently in your system
    def usernames
      @user_names ||= _user_list.uniq
    end

    def other_usernames
      @other_user_names ||= usernames - [username]
    end

    def users_count
      @users_count ||= usernames.size
    end

    def other_users_count
      @other_users_count ||= users_count - 1
    end

    def login_count
      @login_count ||= _user_list.size
    end

    def my_login_count
      @my_login_count ||= _user_list.count{|user| user == username}
    end

    def other_login_count
      @other_login_count ||= login_count - my_login_count
    end

    def groupname
      @groupname = _group.name
    end

    def uid
      @uid = _passwd.uid
    end

    def gid
      @gid = _passwd.gid
    end

    private
    def _passwd
      if @passwd.nil?
        Etc.passwd{|g| @passwd = g if g.name == username}
        @passwd
      else
        @passwd
      end
    end

    def _group
      @group ||= Etc.getgrgid(gid)
    end

    def _users
      _user_list.size
    end

    def _other_users

    end

    # TODO: need proper error handling
    def _user_list
      @user_list ||= %x|who|.lines.map{|line|line.split.first}
    end

  end
end