require "thor"
require "launchy"
require "vpr/url"
require "vpr/configuration"
require "vpr/version"

module Vpr
  class CLI < Thor
    def initialize(args = [], local_options = {}, config = {})
      super
      select_remote
      @url = Url.new
    end

    map "--version" => :version
    class_option :remote, default: :origin

    desc "home", "visit the project page in github"
    def home
      Launchy.open(url.home_url)
    end

    desc "pulls", "visit the project pull requests page in github"
    def pulls
      Launchy.open(url.pulls_url)
    end

    desc "issues", "visit the project issues page in github"
    def issues
      Launchy.open(url.issues_url)
    end

    desc "branches", "visit the project branches page in github"
    def branches
      Launchy.open(url.branches_url)
    end

    desc "branch", "visit the current branch in github"
    def branch
      Launchy.open(url.branch_url)
    end

    desc "pull [BRANCH]", "visit the pull request for the BRANCH in any of the supported hosts"
    long_desc <<-DESC
      It visits the pull request for the BRANCH in any of the supported hosts

      Since the branch is an optional arg, it uses the current branch by default
    DESC

    def pull(branch = nil)
      Launchy.open(url.pull_url(branch))
    end

    desc "visit COMMIT", "visit the commit in github"
    def visit(commit)
      Launchy.open(url.commit_url(commit))
    end

    desc "search COMMIT", "search the commit in github"
    def search(commit)
      Launchy.open(url.search_url(commit))
    end

    desc "version", "show the gem version"
    def version
      puts Vpr::VERSION
    end

    private

    def select_remote
      Configuration.remote = options[:remote].to_sym
    end

    attr_reader :url
  end
end
