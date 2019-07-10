require 'thor'
require 'launchy'
require 'vpr/url'

module Vpr
  class CLI < Thor
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
