# Monkey patch to String

class String
  alias :plus :+

  def color(color)
    @color=color
  end
  alias :c :color

  def to_bash
    # Something
  end

  def to_debug

  end

  def +(str)
    case $options[:shell]

      when :debug
        self.plus(str).plus(_color.to_s)

    end

  end

  private
  def _color
    @color || :default
  end

end


print "aa"
p "aaa"