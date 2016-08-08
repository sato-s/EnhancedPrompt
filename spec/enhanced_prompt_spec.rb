require 'spec_helper'
include EnhancedPrompt

describe 'Monkey patched Pathname' do
  subject(:path) { Pathname.new('/home/user/aaa/bbb') }

  describe '#length' do
    it 'show path length' do
      expect(path.length).to eq(18)
    end
  end

  describe '#split_paths' do
    it 'split to multiple paths' do
      expect(path.split_paths).to eq([Pathname.new('home'),Pathname.new('user'),Pathname.new('aaa'),Pathname.new('bbb')])
    end
  end
end

describe EnhancedPrompt::Prompt::Token::Dir do

  describe 'Normal case' do
    subject(:long_dir_path) { Pathname.new('/home/user/workspace/project/com/example/project/database/this/dir/is/too/long/to/print/in/prompt') }
    subject(:dir) { EnhancedPrompt::Prompt::Token::Dir.new}
    before(:each){ allow_any_instance_of(EnhancedPrompt::Prompt::Token::Dir).to receive(:_dir_full).and_return(long_dir_path)}

    describe '#dir_full' do
      it 'show full directory path' do
        expect(dir.dir_full).to eq Pathname.new('/home/user/workspace/project/com/example/project/database/this/dir/is/too/long/to/print/in/prompt')
      end
    end
    describe '#dir_abbreviated2 7' do
      it 'omit path name > limit ' do
        expect(dir.dir_abbreviated2(7)).to eq Pathname.new('.../prompt')
      end
      it 'omit path name > limit 8' do
        expect(dir.dir_abbreviated2(8)).to eq Pathname.new('.../in/prompt')
      end
      it 'omit path name > limit 9' do
        expect(dir.dir_abbreviated2(9)).to eq Pathname.new('.../in/prompt')
      end
      it 'omit path name > limit 100' do
        expect(dir.dir_abbreviated2(10)).to eq Pathname.new('.../in/prompt')
      end
      it 'Do nothing if path < limit 5000' do
        expect(dir.dir_abbreviated2(5000)).to eq Pathname.new('/home/user/workspace/project/com/example/project/database/this/dir/is/too/long/to/print/in/prompt')
      end
      it 'just show current dir if limit is too shot limit' do
        expect(dir.dir_abbreviated2(3)).to eq Pathname.new('.../prompt')
      end
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
  it 'show hostname' do
    expect(prompt.host_full).not_to be_empty
  end
  it 'show host' do
    expect(prompt.host).not_to be_empty
  end
  it 'show username' do
    expect(prompt.user).not_to be_empty
  end
  it 'show group' do
    expect(prompt.group).not_to be_empty
  end
  it 'show username' do
    expect(prompt.username).not_to be_empty
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
    expect(prompt.uid).not_to be_empty
  end
  it 'show gid' do
    expect(prompt.gid).not_to be_empty
  end
end

describe 'String' do
  it '#color' do
    expect('aa'.color(:aqua)).to eq "\e[38;5;51maa\e[0m"
  end
  it '#c' do
    expect('aa'.c(:aqua)).to eq "\e[38;5;51maa\e[0m"
  end
  it '#bg' do
    expect(run{'aa'.bg(:aqua)}).to eq "\e[48;5;51maa\e[0m"
  end
  it '#background' do
    expect(run{'aa'.background(:aqua)}).to eq "\e[48;5;51maa\e[0m"
  end
  it '#_' do
    expect(run{'aa'._}).to eq "\e[4maa\e[0m"
  end
  it 'with blink' do
    expect(run{'aa'.blink}).to eq "\e[5maa\e[0m"
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
