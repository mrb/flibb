# simple file resource

file '/derp' do
  owner 'root'
  group 'root'
  mode '0777'
  content 'herp derp\n'
end

ruby_block 'print command' do
  block do
    extend Chef::Mixin::ShellOut
    o = Mixlib::ShellOut.new('ls -la', cwd: '/', live_stream: STDOUT)
    o.run_command
  end
  action :run
end
