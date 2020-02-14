# frozen_string_literal: true

module Common
  module ParamsHelper
    def filter_params
      @filter_params ||= begin
        return {} if params[:q].blank?

        {q: params[:q].reject { |_, v| v.blank? }.permit!.to_h}
      end
    end
  end
end
