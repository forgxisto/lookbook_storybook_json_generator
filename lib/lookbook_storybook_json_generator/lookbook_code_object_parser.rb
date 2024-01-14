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

    def title
      code_object.namespace.title.gsub(code_object.namespace.sep, '/')
    end

    def stories
      code_object.meths.map { story(_1) }
    end

    def story(meth)
      {
        name: meth.name,
        parameters: parameters(meth),
        args: args(meth),
        argTypes: arg_types(meth)
      }
    end

    def parameters(meth)
      { server: { id: "#{title.underscore}/#{meth.name}" } }
    end

    def args(meth)
      meth.parameters.each_with_object({}) do |(k, v), a|
        key = k.delete(':').to_sym
        # 値から引用符を削除し、シンボルがあれば文字列に変換
        val = v.gsub(/'|"/, '').then { _1.start_with?(':') ? _1[1..] : _1 }

        a[key] = val
      end
    end

    def arg_types(meth)
      meth.tags.each_with_object({}) do |e, a|
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
