module EnhancedShellPs1::Parsable

  class String
    def start_with?(c)
      raise RuntimeError,%|Invalid token| unless token.kind_of?(String)
      token[0]
    end
  end

  class Command < String
  end

  def parse(str)
    parsed = []
    plus_count=1
    str.scan(/\w+|\s+/).each_char do |token|
      if token.start_with(%x|+|) then
        ""
      end




      end


  end

end