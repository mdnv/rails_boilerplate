# frozen_string_literal: true

module Staffs
  module LayoutHelper
    def sidebar_active?(item)
      controller_name == item[:controller]
    end

    def breadcrumbs(items)
      items = {home: manage_root_path}.merge items
      content_for :breadcrumbs, render('layouts/staff/breadcrumb', items: items)
    end
  end
end
