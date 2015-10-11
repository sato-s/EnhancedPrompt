require 'rainbow'
require 'rainbow/ext/string'
require_relative 'color_table'
# This monkey patch to String, enable to paint string on ANSI terminal
# Thanks to Rainbow gem we can easily implement colorful string
# Just running 'red'.color(:red), red string appears on terminal
# See
# https://github.com/sickill/rainbow
#
# In addition to the above we implement several utilities and aliases

# TODO must hack Rainbow::Presenter

class Rainbow::Presenter
  undef bg
  def c(kolor)
    # Check
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



module EnhancedPrompt
end


module EnhancedPrompt::StringExtension
  include ColorTable

  def c(kolor)
    # Check
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

String.include EnhancedPrompt::StringExtension

# def foreground(*color)
#   Rainbow(self).foreground(*color)
# end

p "aa".methods.sort
p Rainbow::Presenter.new.methods.sort
Rainbow.enabled = true
puts %Q|abc|.bg(:pale_goldenrod).c(:gold)
puts %Q|abc|.c(:aqua).bg(:pale_goldenrod)._