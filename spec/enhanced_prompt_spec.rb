require 'spec_helper'
include EnhancedPrompt


describe EnhancedPrompt do
  it 'has a version number' do
    expect(EnhancedPrompt::VERSION).not_to be nil
  end
end

describe Prompt do
  ps1 = Prompt.new
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

describe EnhancedPrompt do
  it 'works in simple case' do
    expect(run{ip}).to match /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\Z/
  end
end