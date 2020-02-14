# frozen_string_literal: true

module BeforeRender
  extend ActiveSupport::Concern
  extend ActiveSupport::Callbacks

  included do
    define_callbacks :render
  end

  def render(*options, &block)
    run_callbacks :render do
      super
    end
  end

  module ClassMethods
    def append_before_render_action(*names, &block)
      _insert_callbacks(names, block) do |name, options|
        set_callback :render, :before, name, options
      end
    end

    def prepend_before_render_action(*names, &block)
      _insert_callbacks(names, block) do |name, options|
        set_callback :render, :before, name, options.merge(prepend: true)
      end
    end

    def skip_before_render_action(*names, &block)
      _insert_callbacks(names, block) do |name, options|
        skip_callback :render, :before, name, options
      end
    end

    alias before_render append_before_render_action
    alias prepend_before_render prepend_before_render_action
    alias skip_before_render skip_before_render_action
  end
end
