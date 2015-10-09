class EnhancedPrompt::Token
  class Base::Dir

    def dir_full
      _dir
    end

    def dir_abbreviated1()

    end

    def dir_abbreviated2(limit)
      if _dir.size >= limit then
        '...'+_dir[-1..limit]
      else
        _dir
      end
    end

    private
    def _dir
      @_pwd ||= Dir.pwd
    end

  end
end