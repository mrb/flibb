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

bash "kitchen list" do
  cwd node['delivery']['workspace']['repo']
  code "kitchen list > /tmp/derp/functional-kitchen-list"
  action :run
end
