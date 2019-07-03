require 'vpr/git_parser'

module Vpr
  class Url
    def self.commit_url(commit)
      "#{GitParser.repo_url}/commit/#{commit}"
    end

    def self.search_url(commit)
      "#{GitParser.repo_url}/search?q=#{commit}"
    end
  end
end
