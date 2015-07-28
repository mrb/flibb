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

changed_cookbooks.each do |cookbook|
  # Run Foodcritic against any cookbooks that were modified.
  execute "lint_foodcritic_#{cookbook.name}" do
    command "foodcritic -f correctness #{foodcritic_tags} #{cookbook.path}"
  end
  
  # Run Rubocop against any cookbooks that were modified.
  execute "lint_rubocop_#{cookbook.name}" do
    command "rubocop #{cookbook.path}"
    only_if { File.exist?(File.join(cookbook.path, '.rubocop.yml')) }
  end
end
