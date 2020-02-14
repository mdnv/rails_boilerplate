# frozen_string_literal: true

module Staffs
  module RecordHelper
    def error_messages_of(record, attribute)
      render partial: 'sharing/announcements/invalid_attribute_text',
             collection: record.errors.full_messages_for(attribute), as: :content
    end
  end
end
