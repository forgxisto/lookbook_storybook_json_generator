# frozen_string_literal: true

module LookbookStorybookJsonGenerator
  # lookbook のコードオブジェクトを storybook の json として出力する
  class StorybookJsonGenerator
    def self.execute(code_objects, changes = nil)
      new(code_objects, changes).execute
    rescue => e
      Rails.logger.warn "LookbookStorybookJsonGenerator #{e.message}"
    end

    def initialize(code_objects, changes)
      @code_objects = code_objects
      @changes = changes
    end

    def execute
      generate_all
    end

    private

    attr_reader :code_objects, :changes

    def generate_all
      code_objects.each { generate_json(_1) }
    end

    # code_object と同じ場所にファイルを作成する
    # ただし、ファイル名は .stories.json とする
    def generate_json(code_object)
      file_name = code_object.file.to_s.gsub('.rb', '.stories.json')
      json = LookbookStorybookJsonGenerator::LookbookCodeObjectParser.new(code_object).to_json
      File.open(file_name, 'w') { _1.puts json }
    end
  end
end
