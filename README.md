# EnhancedPrompt

In progress...............................................


## Features

- Provides rich shell prompt
- Helpful information including IP, git branch, nicely abbreviated path name
- Can choose from a bunch of pre-defied shell prompt style
- Extremely flexible running as ruby internal DSL
- Can change colors in simple syntax (thanks to Rainbow) 


## Installation

```
gem install enhanced_prompt
```

```
cat << EOF > ~/.bashrc
export PROMPT_COMMAND='eprompt default2'
export PS1=' '
EOF
```




Add this line to your application's Gemfile:

```ruby
gem 'enhanced_shell_ps1'
```

eprompt(){
/home/sato/work/enhanced_prompt/bin/eprompt "default";
}

export PROMPT_COMMAND=''
export PS1="$(eprompt)"

export PROMPT_COMMAND='eprompt default2'
export PS1=' '


And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enhanced_shell_ps1

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/enhanced_shell_ps1. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

