require 'serverspec'

set :backend, :exec
puts "os: #{os}"

describe file('/derp') do
  it { should be_mode 777 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
