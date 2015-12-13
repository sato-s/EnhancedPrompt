class EnhancedPrompt::Prompt::Token
  class Time

    def time1
      _now.strftime("%T")
    end

    private
    def _now
      @_now ||= ::Time.now
    end

  end
end
