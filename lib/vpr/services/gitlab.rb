require "vpr/git_parser"

module Vpr
  module Services
    class GitLab
      def self.home_url
        GitParser.repo_url
      end

      def self.pulls_url
        "#{GitParser.repo_url}/-/merge_requests"
      end

      def self.issues_url
        "#{GitParser.repo_url}/-/issues"
      end

      def self.branches_url
        "#{GitParser.repo_url}/-/branches"
      end

      def self.branch_url
        "#{GitParser.repo_url}/-/tree/#{GitParser.current_branch}"
      end

      def self.pull_url
        "#{GitParser.repo_url}/-/merge_requests/#{GitParser.current_branch}"
      end

      def self.commit_url(commit)
        "#{GitParser.repo_url}/-/commit/#{commit}"
      end

      def self.search_url(commit)
        "#{GitParser.host}/search?search=#{commit}"
      end
    end
  end
end
