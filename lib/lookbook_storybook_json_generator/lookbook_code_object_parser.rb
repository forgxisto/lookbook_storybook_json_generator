# frozen_string_literal: true

module LookbookStorybookJsonGenerator
  # lookbookのコードオブジェクトをパースして、storybookのjsonに変換する
  class LookbookCodeObjectParser
    def initialize(code_object)
      @code_object = code_object
    end

    def to_json(*_args)
      JSON.pretty_generate(
        {
          title:,
          stories:
        }
      )
    end

    private

    attr_reader :code_object

    def preview_entity
      @preview_entity ||= Lookbook::PreviewEntity.new(code_object)
    end

    def title
      preview_entity.lookup_path.titleize
    end

    def stories
      preview_entity.scenarios.map { story(_1) }
    end

    def story(scenario_entity)
      {
        name: scenario_entity.name,
        parameters: parameters(scenario_entity),
        args: args(scenario_entity),
        argTypes: arg_types(scenario_entity)
      }
    end

    def parameters(scenario_entity)
      { server: { id: scenario_entity.lookup_path } }
    end

    def args(scenario_entity)
      scenario_entity.tags.to_h { [_1.name, _1.value_default] }
    end

    def arg_types(scenario_entity)
      scenario_entity.tags.each_with_object({}) do |e, a|
        a[e.name] = {
          control: { type: control_type(e.tag_args[:input]) },
          name: e.name.camelcase,
          options: type_options(e.tag_args[:rest])
        }
      end
    end

    def control_type(input)
      case input
      when 'toggle'
        'boolean'
      when 'number'
        'number'
      else
        'text'
      end
    end

    def type_options(rest)
      case rest
      when /choices: \[(.+)\]/
        ::Regexp.last_match(1).split(',').map(&:strip)
      else
        []
      end
    end
  end
end
