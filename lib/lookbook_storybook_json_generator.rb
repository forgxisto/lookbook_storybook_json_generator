# frozen_string_literal: true

require 'lookbook'
require_relative 'lookbook_storybook_json_generator/version'
require_relative 'lookbook_storybook_json_generator/storybook_json_generator'
require_relative 'lookbook_storybook_json_generator/lookbook_code_object_parser'

# Lookbook::PreviewCollection の load メソッドをオーバーライドする
module LookbookStorybookJsonGenerator
  def load(...)
    super(...)
    StorybookJsonGenerator.execute(...)
  end
end

Lookbook::PreviewCollection.prepend(LookbookStorybookJsonGenerator)
