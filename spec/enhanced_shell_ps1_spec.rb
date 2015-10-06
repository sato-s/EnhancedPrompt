# Before run this test, you should login as at least 3 distinct users
# Otherwise some test would fail
require 'spec_helper'
include EnhancedShellPs1


describe EnhancedShellPs1 do
  it 'has a version number' do
    expect(EnhancedShellPs1::VERSION).not_to be nil
  end
end

describe PS1 do
  ps1 = PS1.new
  it 'show private ipv6 addr' do
    expect(ps1.ipv6).to match Resolv::IPv6::Regex
  end
  it 'show private ipv4 addr' do
    expect(ps1.ip).to match /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\Z/
  end
  it 'show private ipv4 addr' do
    expect(ps1.ipv4).to match /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\Z/
  end
  it 'cant show global ipv6 addr' do
    expect(ps1.global_ipv6).to match "No global_ipv6"
  end
  it 'show hostname' do
    expect(ps1.host_full).to match `hostname`.chomp
  end
  it 'show host' do
    expect(ps1.host).to match `hostname`.chomp.split('.')[0]
  end
  it 'show username' do
    expect(ps1.user).to match `echo "$USER"`.chomp
  end
  it 'show group' do
    expect(`id -Gn`.split).to include ps1.group
  end
  it 'show username' do
    expect(ps1.username).to match `echo "$USER"`.chomp
  end
  it 'show usernames' do
    expect(ps1.usernames).to match /\w+|(\w+,)*\w+/
  end
  it 'show other_user_names' do
    expect(ps1.other_user_names).to match /|\w+|(\w+,)*\w+/
  end
  it 'show login_count' do
    expect(ps1.login_count).to match /\d+/
  end
  it 'other_login_count' do
    expect(ps1.other_login_count).to match /\d+/
  end
  it 'show uid' do
    expect(ps1.uid).to eq `id -ru`.chomp
  end
  it 'show gid' do
    expect((0..6000)).to include ps1.gid.to_i
  end
end

describe 'String' do

  describe '+ operator' do
    it 'paints string' do
      expect("abc".c(:red) + "def".c(:blue)).to match "(red)abc(red)(blue)def(blue)"
      expect('abc'.c(:red)+'def'.c(:blue)).to match "(red)abc(red)(blue)def(blue)"
      expect('abc'+'def'.c(:blue)).to match "(default)abc(default)(blue)def(blue)"
      expect('abc'+String("def").c(:blue)).to match "(default)abc(default)(blue)def(blue)"
    end
    it 'Overwite appended string' do
      expect( ('abc'.c(:red)+'def').c(:blue).to_color_s ).to match "(blue)(red)abc(red)(default)def(default)(blue)"
      expect( ('abc'+'def'.c(:red)).c(:blue).to_color_s ).to match "(blue)(default)abc(default)(red)def(red)(blue)"
    end
  end

  describe 'concat' do
    it 'will not paint string' do
      expect("abc".c(:red).concat "def".c(:blue)).to match "abcdef"
      expect('abc'.c(:red).concat'def'.c(:blue)).to match "abcdef"
      expect('abc'.concat 'def'.c(:blue)).to match "abcdef"
      expect('abc'.concat String("def").c(:blue)).to match "abcdef"
    end
  end
  describe '#{} expression' do
    it 'paints embedded string' do
      expect('abc'.c(:red)).to match "__abc(red)__"
    end
  end
end

# describe Colorizable do
#   ps1 = PS1.new
#   it 'can colorize nyaa' do
#     expect(colorize('nyaa',:white)).to eq %+\[$(tput setaf 7)\]nyaa\[$(tput sgr0)\]+
#   end
#   it 'show colorized hostname' do
#     expect(colorize(ps1.host_full,:red)).to eq %+\[$(tput setaf 1)\]localhost.localdomain\[$(tput sgr0)\]+
#   end
# end

# describe Parsable do
#   # it '' do
#   #   expect(parse).to eq
#   # end
#
# end