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

log 'running test-kitchen' do
  action :write
end

# # Misc test-kitchen plugins
# chef_gem 'kitchen-sync' do
#   compile_time false
#   action :install
# end

# chef_gem 'kitchen-digital_ocean' do
#   compile_time false
#   action :install
# end

# test concurrently
# ruby_block "kitchen test" do
#   block do
#     extend Chef::Mixin::ShellOut
#     code =<<-EOF
#     . /home/someara/secure_env_vars.sh ; 
#     time kitchen test -c ;
#     time kitchen destroy -c ;
#     EOF
#     c = Mixlib::ShellOut.new(code, live_stream: STDOUT, cwd: node['delivery']['workspace']['repo'], env: { 'USER' => 'dbuild' })
#     c.run_command
#   end
#   action :run
# end

include_recipe "delivery-cook::publish"
