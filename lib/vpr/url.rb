require "vpr/git_parser"

module Vpr
  class Url
    def self.home_url
      GitParser.repo_url
    end

    def self.pulls_url
      path = {
        'github.com': "pulls",
        'bitbucket.org': "pull-requests",
      }

      "#{GitParser.repo_url}/#{path[GitParser.host.to_sym]}"
    end

    def self.issues_url
      "#{GitParser.repo_url}/issues"
    end

    def self.branches_url
      "#{GitParser.repo_url}/branches"
    end

    def self.branch_url
      path = {
        'github.com': "tree",
        'bitbucket.org': "branch",
      }
      "#{GitParser.repo_url}/#{path[GitParser.host.to_sym]}/#{GitParser.current_branch}"
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
      path = {
        'github.com': "search?q=",
        'bitbucket.org': "commits/all?search=",
      }
      p "#{GitParser.repo_url}/#{path[GitParser.host.to_sym]}#{commit}"
    end
  end
end
