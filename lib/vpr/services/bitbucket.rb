require "vpr/git_parser"

module Vpr
  module Services
    class Bitbucket
      def self.home_url
        GitParser.repo_url
      end

      def self.pulls_url
        "#{GitParser.repo_url}/pull-requests"
      end

      def self.issues_url
        "#{GitParser.repo_url}/issues"
      end

      def self.branches_url
        "#{GitParser.repo_url}/branches"
      end

      def self.branch_url
        "#{GitParser.repo_url}/branch/#{GitParser.current_branch}"
      end

      def self.pull_url
        "#{GitParser.repo_url}/pull-requests/new?source=#{GitParser.current_branch}"
      end

      def self.commit_url(commit)
        "#{GitParser.repo_url}/commits/#{commit}"
      end

      def self.search_url(commit)
        "#{GitParser.repo_url}/commits/all?search=#{commit}"
      end
    end
  end
end
