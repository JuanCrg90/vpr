require "vpr/git_parser"

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

    def self.branches_url
      "#{GitParser.repo_url}/branches"
    end

    def self.branch_url
      "#{GitParser.repo_url}/tree/#{GitParser.current_branch}"
    end

    def self.pull_url
      path = {
        'github.com': "pull/#{GitParser.current_branch}",
        'bitbucket.org': "pull-requests/new?source=#{GitParser.current_branch}",
      }

      "#{GitParser.repo_url}/#{path[GitParser.host.to_sym]}"
    end

    def self.commit_url(commit)
      path = {
        'github.com': "commit",
        'bitbucket.org': "commits",
      }

      "#{GitParser.repo_url}/#{path[GitParser.host.to_sym]}/#{commit}"
    end

    def self.search_url(commit)
      search_param =
        if GitParser.repo_url =~ /bitbucket/
          "/commits/all?search="
        else
          "/search?q="
        end
      "#{GitParser.repo_url}#{search_param}#{commit}"
    end
  end
end
