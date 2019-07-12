require 'vpr/git_parser'

module Vpr
  class Url
    def self.home_url
      GitParser.repo_url
    end

    def self.pulls_url
      "#{GitParser.repo_url}/pulls"
    end

    def self.issues_url
      "#{GitParser.repo_url}/issues"
    end

    def self.branch_url
      "#{GitParser.repo_url}/tree/#{GitParser.current_branch}"
    end

    def self.pull_url
      "#{GitParser.repo_url}/pull/#{GitParser.current_branch}"
    end

    def self.commit_url(commit)
      "#{GitParser.repo_url}/commit/#{commit}"
    end

    def self.search_url(commit)
      "#{GitParser.repo_url}/search?q=#{commit}"
    end
  end
end
