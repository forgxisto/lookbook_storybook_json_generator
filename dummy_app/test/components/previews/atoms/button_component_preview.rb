module Atoms
  class ButtonComponentPreview < Lookbook::Preview
    def default
      render Atoms::ButtonComponent.new(text: 'Button')
    end

    # @param label text
    def with_text(label: 'Button')
      render Atoms::ButtonComponent.new(text: label)
    end

    # @param label textarea
    def with_textarea(label: 'Button')
      render Atoms::ButtonComponent.new(text: label)
    end

    # @param label select { choices: [primary, secondary, danger] }
    def with_select(label: 'primary')
      render Atoms::ButtonComponent.new(text: label)
    end

    # @param label toggle
    def with_toggle(label: true)
      render Atoms::ButtonComponent.new(text: label.class.name)
    end

    # @param label color
    def with_color(label: '#000000')
      render Atoms::ButtonComponent.new(text: label)
    end

    # @param label range { min: 1, max: 9, step: 2 }
    def with_range(label: 1)
      render Atoms::ButtonComponent.new(text: label)
    end
  end
end
