# frozen_string_literal: true

module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Exception do |e|
      Rails.logger.error "**ERROR**: #{e.message}"

      if e.class == ActiveRecord::RecordInvalid
        model_name = e.record.class.name.underscore
        flash[:old_params] = request.request_parameters[model_name]
                                    .except(*Settings.image_params)
                                    .merge(is_submitted: true)
      end

      e_message = I18n.t "notifications.errors.#{e.class.name.demodulize.underscore}",
                         default: I18n.t('notifications.errors.unknown')

      redirect_to error_redirect_path, flash: {error: e_message}
    end
  end

  private

  def error_redirect_path
    default_path = send "#{'manage_' if self.class.to_s.deconstantize == 'Staffs'}root_path"
    request.referer.presence || default_path
  end
end
