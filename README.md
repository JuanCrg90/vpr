![StandardRB](https://github.com/JuanCrg90/vpr/workflows/StandardRB/badge.svg)

# vpr

A CLI to visit quickly github project sections

## Installation
```
  $ gem install vpr
```
## Usage

```
$ vpr home # visit the project page in github
```
![vpr home](https://res.cloudinary.com/juancrg90/image/upload/v1562969660/vpr/vpr_home.gif)

```
$ vpr pulls # visit the project pull requests page in github
```
![vpr pulls](https://res.cloudinary.com/juancrg90/image/upload/v1562969866/vpr/vpr_pulls.gif)

```
$ vpr issues # visit the project issues page in github
```
![vpr issues](https://res.cloudinary.com/juancrg90/image/upload/v1562969959/vpr/vpr_issues.gif)

```
$ vpr branches # visit the project branches page in github
```
![vpr branches](https://res.cloudinary.com/juancrg90/image/upload/v1562970055/vpr/vpr_branches.gif)

```
$ vpr branch # 'visit the current branch in github'
```
![vpr branch](https://res.cloudinary.com/juancrg90/image/upload/v1562970153/vpr/vpr_branch.gif)

```
$ vpr pull # 'visit the pull request for the current branch (if exist) in github'
```
![vpr pull](https://res.cloudinary.com/juancrg90/image/upload/v1562970242/vpr/vpr_pull.gif)

```
$ vpr visit <commit> # visit the commit in github
```
![vpr visit](https://res.cloudinary.com/juancrg90/image/upload/v1562970485/vpr/vpr_visit.gif)

```
$ vpr search <commit> # search the commit in github
```
![vpr search](https://res.cloudinary.com/juancrg90/image/upload/v1562970606/vpr/vpr_search.gif)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JuanCrg90/vpr. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Vpr project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/JuanCrg90/vpr/blob/master/CODE_OF_CONDUCT.md).
