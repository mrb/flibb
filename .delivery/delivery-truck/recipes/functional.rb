#
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# SKIP PHASE

# FIXME: delete all this.
# It's a royal pain to get the output from executes to show up in the
# build logs, so we're just gonna dump them on the filesystem because
# fuckit.

directory '/tmp/derp' do
  action :create
end

bash "whoami" do
  code "whoami > /tmp/derp/functional-whoami"
  action :run
end

bash "pwd" do
  code "pwd > /tmp/derp/functional-pwd"
  action :run
end

# Misc test-kitchen plugins
chef_gem 'kitchen-sync' do
  compile_time false
  action :install
end

chef_gem 'kitchen-digital_ocean' do
  compile_time false
  action :install
end

ruby_block 'print delivery workspace repo' do
  block do
    puts "\n#{node['delivery']['workspace']['repo']}"
  end
end

# list for debugging
ruby_block "kitchen list" do
  block do
    extend Chef::Mixin::ShellOut
    code =<<-EOF
    . /home/someara/secure_env_vars.sh ; time kitchen list
    EOF
    o = shell_out!(code, cwd: node['delivery']['workspace']['repo'])
    puts "\n#{o.stdout}"
  end
  action :run
end

# list for debugging
ruby_block "kitchen list again" do
  block do
    extend Chef::Mixin::ShellOut
    code =<<-EOF
    . /home/someara/secure_env_vars.sh ; time kitchen list
    EOF
    o = shell_out!(code, cwd: node['delivery']['workspace']['repo'])
    puts "\n#{o.stdout}"
  end
  action :run
end

# kitchen diagnose
ruby_block "kitchen diagnose" do
  block do
    extend Chef::Mixin::ShellOut
    code =<<-EOF
    . /home/someara/secure_env_vars.sh ; time kitchen diagnose
    EOF
    o = shell_out!(code, cwd: node['delivery']['workspace']['repo'])
    puts "\n#{o.stdout}"
  end
  action :run
end

# test concurrently
ruby_block "kitchen test" do
  block do
    extend Chef::Mixin::ShellOut
    code =<<-EOF
    . /home/someara/secure_env_vars.sh ; time kitchen test -c
    EOF
    o = shell_out!(code, cwd: node['delivery']['workspace']['repo'])
    puts "\n#{o.stdout}"
  end
  action :run
end

# make sure we're cleaned up
ruby_block "kitchen test" do
  block do
    extend Chef::Mixin::ShellOut
    code =<<-EOF
    . /home/someara/secure_env_vars.sh ; time kitchen destroy -c
    EOF
    o = shell_out!(code, cwd: node['delivery']['workspace']['repo'])
    puts "\n#{o.stdout}"
  end
  action :run
end
