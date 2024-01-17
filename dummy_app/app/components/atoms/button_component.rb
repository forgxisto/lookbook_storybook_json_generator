module Atoms
  class ButtonComponent < ViewComponent::Base
    def initialize(text:)
      @text = text
    end

    def call
      tag.button(@text)
    end
  end
end
