# frozen_string_literal: true

module Staffs
  class StaffsController < BaseController
    before_action :authorized?, only: %i[index show]
    before_action :find_staff, only: %i[show edit update]

    def index
      @q = Staff.ransack params[:q]
      @staffs = @q.result.page params[:page]
    end

    def new
      @staff = Staff.new flash[:old_params]
    end

    def create
      @staff = Staff.create! create_params
      redirect_to manage_staff_path(@staff),
                  flash: {success: I18n.t('notifications.create_staff_successfully')}
    end

    def edit; end

    def update
      @staff.update! update_params
      redirect_to manage_staff_path(@staff),
                  flash: {success: I18n.t('notifications.update_staff_successfully')}
    end

    private

    def find_staff
      authorize @staff = Staff.find(params[:id])
    end

    def create_params
      params.require(:staff)
            .permit(:username, :email, :password, :password_confirmation, :role, :status, :avatar)
    end

    def update_params
      params.require(:staff)
            .permit(:username, :slug, :role, :status, :avatar)
    end
  end
end
