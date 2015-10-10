require 'spec_helper'
include EnhancedPrompt


describe EnhancedPrompt do
  it 'has a version number' do
    expect(EnhancedPrompt::VERSION).not_to be nil
  end
end

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

# describe EnhancedPrompt::Prompt::Token::Dir do
#   allow(EnhancedPrompt::Prompt::Token::Dir).to receive(:getpwd).and_return({something: 'testing'})
#   it 'show dir_abbreviated2' do
#     expect(EnhancedPrompt.run{dir_abbreviated2}).to match /.+/
#   end
#
# end

describe EnhancedPrompt do
  it 'works in simple case' do
    expect(run{ip}).to match /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\Z/
  end
end