class EnhancedShellPs1::PS1
  class Base::Dir

    def wd_full
      _wd
    end

    def wd

    end

    private
    def _wd
      @_wd ||= Dir.getwd
    end

  end
end