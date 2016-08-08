class EnhancedPrompt::Prompt
  module Style

    def default
      (user + '@' + ip + ' ' + dir + "\n" + '->')
        .c(:white).bg.(:dodgerblue)
    end

  end
end
