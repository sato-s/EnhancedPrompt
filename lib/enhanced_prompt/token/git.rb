require 'open3'
class EnhancedPrompt::Prompt
  class Token::Git

    def initialize(dir)
      @dir = dir
    end

    def git(prefix:'(',suffix:')')
      _call_git_branch
    end

    # TODO this could not show git branch
    # I should run %x|git branch| in Dir.pwd
    private

    def _call_git_branch
      stdout,stderr,status = *Open3.capture3("cd #{@dir};git branch")
      if stdout =~ /^[*]\s(\w+)/ && status.exitstatus == 0 then
        @_current_branch = $1
      else
        ''
      end
    end

    def _current_branch
      if @_current_branch.nil? then
        begin
          result = %x|cd #{@dir};git branch|
          if result =~ /^[*]\s(\w+)/ then
            @_current_branch = $1
          else
            ''
          end
        rescue =>e
          return ''
        end
      else
        @_current_branch
      end

    end

  end
end
