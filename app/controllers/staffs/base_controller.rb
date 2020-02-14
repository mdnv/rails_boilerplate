# frozen_string_literal: true

module Staffs
  class BaseController < ApplicationController
    before_action :authenticate_staff!

    include Pundit
    include BeforeRender
    include ErrorHandler
    layout 'staff'

    protected

    def policy_scope(scope)
      super [:staffs, scope]
    end

    def authorize(record, query = nil)
      super [:staffs, record], query
    end

    def pundit_user
      current_staff
    end

    def authorized?
      authorize controller_name.classify.constantize
    end
  end
end
