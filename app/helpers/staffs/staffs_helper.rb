# frozen_string_literal: true

module Staffs
  module StaffsHelper
    def staff_roles_for_select
      Staff.roles.select { |_, v| v <= Staff.roles[current_staff.role] }.map do |name, _v|
        [Staff.human_attribute_name("role.#{name}"), name]
      end
    end

    def staff_roles_for_select_search
      Staff.roles.map do |name, value|
        [Staff.human_attribute_name("role.#{name}"), value]
      end
    end

    def staff_statuses_for_select_search
      Staff.statuses.map do |name, value|
        [Staff.human_attribute_name("status.#{name}"), value]
      end
    end
  end
end
