require_relative 'color_table'
module EnhancedPrompt::StringExtension
  module PredefinedColor
    include ColorTable
    def c(kolor)
      if kolor.is_a? Symbol
        if color_table.has_key?(kolor)
          begin
            str =Rainbow(self).foreground(color_table[kolor])
            return str
          rescue
            raise ArgumentError,' Missuse of rainbow interface'
          end
        end
      end
      begin
        Rainbow(self).foreground(kolor)
      rescue
        raise ArgumentError,' Missuse of rainbow interface'
      end
    end


    def bg(kolor)
      if kolor.is_a? Symbol
        if color_table.has_key?(kolor)
          begin
            str =Rainbow(self).background(color_table[kolor])
            return str
          rescue
            raise ArgumentError,' Missuse of rainbow interface'
          end
        else
          raise ArgumentError,'No such color'
        end
      end
      begin
        Rainbow(self).background(kolor)
      rescue
        raise ArgumentError,' Missuse of rainbow interface'
      end
    end

    def _
      Rainbow(self).underline
    end

    def br
      Rainbow(self).bright
    end
  end
end
