require 'pathname'
class EnhancedPrompt::Prompt::Token
  class Dir
    # Customized Pathname
    # Appended convenient methods for abbreviation
    class ::Pathname

      def length
        #self.to_s.include?('/') ? self.to_s.size : self.to_s.count("^/")+1
        self.to_s.size
      end

      def split_paths
        # have to delete empty string to exclude first /
        paths = self.to_s.split('/')
        paths.delete('')
        paths.map{|str| self.class.new(str)}
      end

      def first(n:1)
        (length > n) ? self : self.class.new(self.to_s[0..n])
      end

    end
  end
end

class EnhancedPrompt::Prompt::Token
  class Dir
    def dir_full
      _dir_full
    end

    # TODO
    # cd /home/sato/work/serverspec_test/spec/nyaa
    # corrupt this if limit =40
    def dir_abbreviated1(limit=50)
      dir = _base
      if _dir_full.length >= limit then
        _dir.split_paths.reverse.each do |path|
          if dir.length + path.length <= limit
            dir = path + dir
          else
            return Pathname.new('...')+dir
          end
        end
        _dir_full
      else
        _dir_full
      end
    end

    private
    def _dir
      @_dir ||= _dir_full.split.first
    end

    def _base
      @_base ||= _dir_full.basename
    end

    def _dir_full
      @_dir_full ||= Pathname.new(::Dir.pwd)
    end
  end
end
