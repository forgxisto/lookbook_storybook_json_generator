# frozen_string_literal: true

require_relative 'lib/lookbook_storybook_json_generator/version'

Gem::Specification.new do |spec|
  spec.name = 'lookbook_storybook_json_generator'
  spec.version = LookbookStorybookJsonGenerator::VERSION
  spec.authors = ['ikad']
  spec.email = ['tokunaga.c.daigo@forgxisto.com']

  spec.summary = 'Generates JSON for Storybook from Lookbook'
  spec.description = 'Generates JSON for Storybook from Lookbook.'
  spec.homepage = 'https://github.com/forgxisto/lookbook_storybook_json_generator'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.2.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/forgxisto/lookbook_storybook_json_generator'
  spec.metadata['changelog_uri'] = 'https://github.com/forgxisto/lookbook_storybook_json_generator'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile dummy_app/])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'lookbook'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
