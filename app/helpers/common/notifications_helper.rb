# frozen_string_literal: true

module Common
  module NotificationsHelper
    NOTIFICATION_KEY_NAMES = %w[notice alert info error success].freeze

    def render_flash_notifications
      notification_types = flash.keys & NOTIFICATION_KEY_NAMES
      return unless notification_types.any?

      notifications = notification_types.to_h do |t|
        [Settings.notification_types[t][:type], flash[t]]
      end

      render 'sharing/notifications/flash_notification', notifications: notifications
    end

    def render_announcements(*contents, **opts)
      type = opts[:multiple_line] ? 'multiple_lines' : 'single_line'
      render "sharing/announcements/#{type}", contents: contents,
                                              klass: Settings.notification_types[opts[:type]][:klass]
    end
  end
end
