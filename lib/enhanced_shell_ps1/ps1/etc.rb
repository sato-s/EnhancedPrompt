require 'etc'

class EnhancedShellPs1::PS1
  class Base::Etc
    def username
      @username ||= Etc.getlogin
    end

  end
end
