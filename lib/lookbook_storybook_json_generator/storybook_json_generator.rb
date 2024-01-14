# frozen_string_literal: true

module LookbookStorybookJsonGenerator
  # lookbook のコードオブジェクトを storybook の json として出力する
  class StorybookJsonGenerator
    def self.execute(code_objects, _args)
      code_objects.each do |code_object|
        # code_object と同じ場所にファイルを作成する
        # ただし、ファイル名は .stories.json とする
        file_name = code_object.file.to_s.gsub('.rb', '.stories.json')
        json = LookbookStorybookJsonGenerator::LookbookCodeObjectParser.new(code_object).to_json
        File.open(file_name, 'w') { _1.puts json }
      end
    end
  end
end
