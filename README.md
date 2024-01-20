# LookbookStorybookJsonGenerator

This is a gem that allows you to use lookbook with storybook.
It outputs JSON that can be used with storybook.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add lookbook_storybook_json_generator

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install lookbook_storybook_json_generator

## Usage

This gem depends on lookbook.
No special settings are required.

Create `_preview.stories.json` in the same directory as `_preview.rb` written according to the lookbook rules.

This JSON is created when the lookbook loads `_preview.rb`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

A small Rails app for development is included in this repository. (located in the `dummy_app` directory)

We provide a shortcut command to start this little Rails app.
`bin/dummy_rails` ... start Rails
`bin/dummy_storybook` ... start Storybook

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/forgxisto/lookbook_storybook_json_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/forgxisto/lookbook_storybook_json_generator/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LookbookStorybookJsonGenerator project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/forgxisto/lookbook_storybook_json_generator/blob/master/CODE_OF_CONDUCT.md).
