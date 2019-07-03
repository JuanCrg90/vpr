require 'thor'
require 'vpr/url'

module Vpr
  class CLI < Thor
    desc 'visit COMMIT', 'visit the commit in github'
    def visit(commit)
      system('open', Url.commit_url(commit))
    end

    desc 'search COMMIT', 'search the commit in github'
    def search(commit)
      system('open', Url.search_url(commit))
    end
  end
end
