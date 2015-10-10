require 'pathname'
class EnhancedPrompt::Prompt
  class Token::Dir

    # Customized Pathname
    # Appended convenient methods for abbreviation
    class Path <::Pathname
      # Usual Pathname#size returns data size
      # string length is more convenient for our purpose
      def length
        self.to_s.size
      end

      def first(n:1)
        (length > n) ? self : self.class.new(self.to_s[0..n])
      end
    end

    def dir_full
      _dir
    end

    def dir_abbreviated1
      ""
    end

    def dir_abbreviated2(limit)
      # if _dir.size >= limit then
      #   '...'+_dir.to_s[-limit..-1]
      # else
      #   _dir
      # end
      ""
    end

    private
    def _dir
      @_dir ||= Path.new(Dir.pwd)
    end
  end
end