module Atoms
  class ButtonComponentPreview < Lookbook::Preview
    # @param text text
    def default(text: 'Button')
      render Atoms::ButtonComponent.new(text:)
    end
  end
end
