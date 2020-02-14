# frozen_string_literal: true

module Staffs
  class StaffPolicy < ApplicationPolicy
    attr_reader :current_staff, :staff

    def initialize(current_staff, staff)
      @current_staff = current_staff
      @staff = staff
    end

    def index?
      true
    end

    def show?
      true
    end

    def create?
      current_staff.administrator? &&
        current_staff.active? &&
        create_lower_or_equal_self_role?
    end

    def new?
      create?
    end

    def edit?
      current_staff.eql?(staff)
    end

    def update?
      edit? && not_upgrade_role? && not_set_active_by_self?
    end

    private

    def create_lower_or_equal_self_role?
      Staff.roles[current_staff.role] >= Staff.roles[staff.role]
    end

    def not_upgrade_role?
      (staff.role_was == staff.role) || (Staff.roles[staff.role_was] < Staff.roles[staff.role])
    end

    def not_set_active_by_self?
      (staff.status_was == staff.status) || (Staff.statuses[staff.status_was] < Staff.statuses[staff.status])
    end
  end
end
