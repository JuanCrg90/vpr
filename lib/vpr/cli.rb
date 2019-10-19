require "thor"
require "launchy"
require "vpr/url"
require "vpr/configuration"

module Vpr
  class CLI < Thor
    map "--version" => :version
    class_option :remote, default: "origin"

    desc "home", "visit the project page in github"
    def home
      select_remote
      Launchy.open(Url.home_url)
    end

    desc "pulls", "visit the project pull requests page in github"
    def pulls
      select_remote
      Launchy.open(Url.pulls_url)
    end

    desc "issues", "visit the project issues page in github"
    def issues
      select_remote
      Launchy.open(Url.issues_url)
    end

    desc "branches", "visit the project branches page in github"
    def branches
      select_remote
      Launchy.open(Url.branches_url)
    end

    desc "branch", "visit the current branch in github"
    def branch
      select_remote
      Launchy.open(Url.branch_url)
    end

    desc "pull", "visit the pull request for the current branch (if exist) in github"
    def pull
      select_remote
      Launchy.open(Url.pull_url)
    end

    desc "visit COMMIT", "visit the commit in github"
    def visit(commit)
      select_remote
      Launchy.open(Url.commit_url(commit))
    end

    desc "search COMMIT", "search the commit in github"
    def search(commit)
      select_remote
      Launchy.open(Url.search_url(commit))
    end

    desc "version", "show the gem version"
    def version
      Vpr::VERSION
    end

    private

    def select_remote
      Configuration.remote = options[:remote].to_sym
    end
  end
end
