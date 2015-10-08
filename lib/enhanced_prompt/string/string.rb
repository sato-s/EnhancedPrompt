# Monkey patch to String
# TODO: colors should be class
# TODO define_method to refine #red, #white
$options={:shell=>:debug}

class String
  alias :plus :+
  @@colors = {:white=>7,:red=>1,:green=>2,:blue=>4,:cyan=>6,:magenta=>5,:yellow=>3,:black=>0}

  def color(color)
    @color=color
    return self
  end
  alias :c :color

  def to_bash
    # Something
    raise NotImplementedError, 'should be implemented someday'
  end

  def to_html
    raise NotImplementedError, 'should be implemented someday'
  end

  def to_debug
    "(#{_color.to_s})#{self}(#{_color.to_s})"
  end

  def to_color_s
    case $options[:shell]
      when :debug
        self.to_debug
      when :plain
        # Behave like usual + operator
      when :zsh
      when :fish
      when :csh
        raise NotImplementedError, 'should be implemented someday'
    end
  end

  def +(str)
    self.to_color_s.plus(str.to_color_s)
  end

  private
  def _color
    @color || :default
  end

end

# p "abc".color(:red)
# str = "abc"
# p str
# str2=str.color(:red)
# p str2+"aa"
#
# puts "__#{str2}__"
#
#
# ss='abc'.c(:red)
# bb='def'.c(:blue)
# p ss+bb
#
# p 'abc'.c(:red)+'def'.c(:blue)