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

module DeliveryTruck
  module Helpers
    module Unit
      extend self

      # Look in the cookbook and return whether or not we can find Spec tests.
      #
      # @param cookbook_path [String] Path to cookbook
      # @return [TrueClass, FalseClass]
      def spec_tests?(cookbook_path)
        File.directory?(File.join(cookbook_path, 'spec'))
      end
    end
  end

  module DSL
    # Does cookbook have spec tests?
    def spec_tests?(cookbook_path)
      DeliveryTruck::Helpers::Unit.spec_tests?(cookbook_path)
    end
  end
end
