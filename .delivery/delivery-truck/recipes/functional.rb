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

ruby_block "kitchen list" do
  extend Chef::Mixin::ShellOut
  block do
    code =<<-EOF
    source /home/someara/secure_env_vars.sh
    kitchen list | tee /tmp/derp/functional-kitchen-list
    EOF
    o = shell_out!(code, cwd: node['delivery']['workspace']['repo'])
    puts "\no.stdout: #{o.stdout}"
  end
  action :run
end

bash "kitchen test" do
  cwd node['delivery']['workspace']['repo']
  code <<-EOF
  source /home/someara/secure_env_vars.sh
  time kitchen test -c | tee /tmp/derp/functional-kitchen-test
  EOF
  action :run
end

bash "kitchen destroy" do
  cwd node['delivery']['workspace']['repo']
  code <<-EOF
  source /home/someara/secure_env_vars.sh
  time kitchen destroy -c | tee /tmp/derp/functional-kitchen-destroy
  EOF
  action :run
end
