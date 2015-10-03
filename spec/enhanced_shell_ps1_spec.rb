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
  it 'cant show global ipv6 addr' do
    expect(ps1.global_ipv6).to match "No global_ipv6"
  end
  it 'show hostname' do
    expect(ps1.hostname).to match "localhost.localdomain"
  end
  it 'show username' do
    expect(ps1.username).to match `echo "$USER"`.chomp
  end
end
