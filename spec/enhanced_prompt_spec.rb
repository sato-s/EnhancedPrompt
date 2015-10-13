require 'spec_helper'
include EnhancedPrompt

describe EnhancedPrompt::Prompt::Token::Dir::Pathname do
  before(:each) do
    @path_class = EnhancedPrompt::Prompt::Token::Dir::Pathname
    @path = @path_class.new('/home/user/aaa/bbb')
  end
  describe '#length' do
    it 'show path length' do
      expect(@path.length).to eq(18)
    end
  end
  describe '#split_paths' do
    it 'split to multiple paths' do
      expect(@path.split_paths).to eq([@path_class.new('home'),@path_class.new('user'),@path_class.new('aaa'),@path_class.new('bbb')])
      expect(@path_class.new('aa/bb').split_paths).to eq([@path_class.new('aa'),@path_class.new('bb')])
    end
  end
end

describe EnhancedPrompt::Prompt::Token::Dir do
  before(:each) do
    @path_class = EnhancedPrompt::Prompt::Token::Dir::Pathname
    @long_dir_path=@path_class.new('/home/user/workspace/project/com/example/project/database/this/dir/is/too/long/to/print/in/prompt')
    EnhancedPrompt::Prompt::Token::Dir.any_instance.stub(:_dir_full).and_return(@long_dir_path)
    @dir =EnhancedPrompt::Prompt::Token::Dir.new
  end
  describe '#dir_full' do
    it 'show full directory path' do
      expect(@dir.dir_full).to eq @path_class.new('/home/user/workspace/project/com/example/project/database/this/dir/is/too/long/to/print/in/prompt')
    end
  end
  describe '#dir_abbreviated2' do
    it 'omit path name > limit ' do
      expect(@dir.dir_abbreviated2(7)).to eq @path_class.new('.../prompt')
    end
    it 'omit path name > limit ' do
      expect(@dir.dir_abbreviated2(8)).to eq @path_class.new('.../prompt')
    end
    it 'omit path name > limit ' do
      expect(@dir.dir_abbreviated2(9)).to eq @path_class.new('.../prompt')
    end
    it 'omit path name > limit ' do
      expect(@dir.dir_abbreviated2(10)).to eq @path_class.new('.../in/prompt')
    end
    it 'Do nothing if path < limit ' do
      expect(@dir.dir_abbreviated2(5000)).to eq @path_class.new('/home/user/workspace/project/com/example/project/database/this/dir/is/too/long/to/print/in/prompt')
    end
    it 'just show current dir if limit is too shot limit' do
      expect(@dir.dir_abbreviated2(3)).to eq @path_class.new('.../prompt')
    end
  end

end

# integration tests

describe Prompt do
  prompt = Prompt.new
  it 'show private ipv6 addr' do
    expect(prompt.ipv6).to match Resolv::IPv6::Regex
  end
  it 'show private ipv4 addr' do
    expect(prompt.ip).to match /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\Z/
  end
  it 'show private ipv4 addr' do
    expect(prompt.ipv4).to match /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\Z/
  end
  it 'cant show global ipv6 addr' do
    expect(prompt.global_ipv6).to match "No global_ipv6"
  end
  it 'show hostname' do
    expect(prompt.host_full).to match `hostname`.chomp
  end
  it 'show host' do
    expect(prompt.host).to match `hostname`.chomp.split('.')[0]
  end
  it 'show username' do
    expect(prompt.user).to match `echo "$USER"`.chomp
  end
  it 'show group' do
    expect(`id -Gn`.split).to include prompt.group
  end
  it 'show username' do
    expect(prompt.username).to match `echo "$USER"`.chomp
  end
  it 'show usernames' do
    expect(prompt.usernames).to match /\w+|(\w+,)*\w+/
  end
  it 'show other_user_names' do
    expect(prompt.other_user_names).to match /|\w+|(\w+,)*\w+/
  end
  it 'show login_count' do
    expect(prompt.login_count).to match /\d+/
  end
  it 'other_login_count' do
    expect(prompt.other_login_count).to match /\d+/
  end
  it 'show uid' do
    expect(prompt.uid).to eq `id -ru`.chomp
  end
  it 'show gid' do
    expect((0..6000)).to include prompt.gid.to_i
  end
end

describe 'Colors and Styles' do
  it 'can show same style in various order' do
    expect(run{'aa'.c(:aqua)._.bg(:gold).br}).to eq %+\e[38;5;51m\e[4m\e[48;5;226m\e[1maa\e[0m+
  end
  it 'can show same style in various order' do
    expect(run{'aa'._.c(:aqua).bg(:gold).br}).to eq %+\e[4m\e[38;5;51m\e[48;5;226m\e[1maa\e[0m+
  end
  it 'can show same style in various order' do
    expect(run{'aa'.bg(:gold)._.c(:aqua).br}).to eq %+\e[48;5;226m\e[4m\e[38;5;51m\e[1maa\e[0m+
  end
  it 'can show same style in various order' do
    expect(run{'aa'.br._.c(:aqua).bg(:gold)}).to eq %+\e[1m\e[4m\e[38;5;51m\e[48;5;226maa\e[0m+
  end
end

describe EnhancedPrompt do
  it 'works in simple case' do
    expect(run{ip}).to match /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\Z/
  end
end


describe EnhancedPrompt do
  it 'has a version number' do
    expect(EnhancedPrompt::VERSION).not_to be nil
  end
end