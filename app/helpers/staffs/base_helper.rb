# frozen_string_literal: true

module Staffs
  module BaseHelper
    include Common::NotificationsHelper
    include Common::ParamsHelper
    include Staffs::LayoutHelper
    include Staffs::RecordHelper

    def can(policy_scope)
      policy([:staffs, policy_scope])
    end
  end
end
