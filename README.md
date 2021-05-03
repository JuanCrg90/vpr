# vpr

![StandardRB](https://github.com/JuanCrg90/vpr/workflows/StandardRB/badge.svg)
![CI](https://github.com/JuanCrg90/vpr/workflows/CI/badge.svg)


VPR is a CLI that helps you to quickly manage your project in GitHub/GitLab/Bitbucket.
You can visit with ease different project sections, like the issues page, a specific commit,
create pull requests (merge requests for GitLab),
and more, also is configurable for other platforms PRs are open.

![vpr pull](https://res.cloudinary.com/juancrg90/image/upload/v1562970242/vpr/vpr_pull.gif)

## Installation

```bash
  $ gem install vpr
```

## Usage

All the commands use the URL set as `origin` in your git remote to perform the web request,
you can use the flag `--remote=REMOTE` to specify which service you want to visit if you have your project stored in more than one platform.

### `vpr branch`
Open in your browser your current branch.

### `vpr branches`
Open the page that shows the uploaded branch list.

### `vpr help`
Show the likst of available `vpr` commands, you can pass an specific command to get more details.

###  `vpr home`
Open in your browser the project page.

### `vpr issues`
Open the in your browser issues list page.

### `vpr pull`
Create a new pull request or visit an existing one for the current branch.

### `vpr pulls`
Open the pull requests list page.

### `vpr search COMMIT`
Search a given commit in the project page. the behavior of this command depends of the plaftorm, for example
GitHub search in code, issues an PRs.

### `vpr visit COMMIT`
Open in the browser the page with the commit passed as an argument.

### `vpr version`
Show the current `vpr` version

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JuanCrg90/vpr. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Vpr project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/JuanCrg90/vpr/blob/master/CODE_OF_CONDUCT.md).
