require 'thor'
require 'launchy'
require 'vpr/url'

module Vpr
  class CLI < Thor
    desc 'home', 'visit the project page in github'
    def home
      Launchy.open(Url.home_url)
    end

    desc 'pulls', 'visit the project pull requests page in github'
    def pulls
      Launchy.open(Url.pulls_url)
    end

    desc 'issues', 'visit the project issues page in github'
    def issues
      Launchy.open(Url.issues_url)
    end

    desc 'visit COMMIT', 'visit the commit in github'
    def visit(commit)
      Launchy.open(Url.commit_url(commit))
    end

    desc 'search COMMIT', 'search the commit in github'
    def search(commit)
      Launchy.open(Url.search_url(commit))
    end
  end
end
