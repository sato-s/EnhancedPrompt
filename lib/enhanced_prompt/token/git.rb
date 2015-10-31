# TODO should be implemented someday
class EnhancedPrompt::Prompt
  class Token::Git

    def git(prefix:'',suffix:'')
      _current_branch
    end

    private
    def _current_branch
      if @_current_branch.nil? then
        begin
          result = %x|git branch|
          if $?.exitstatus =! 0 then
            return ''
          else
            current_branch_line = result[/^[*]+/]
            @_current_branch = current_branch_line[/\w+/]
          end
        rescue e
          return ''
        end
      end
    else
      @_current_branch
    end

  end
end
