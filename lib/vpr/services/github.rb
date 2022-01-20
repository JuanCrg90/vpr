module Vpr
  module Services
    class GitHub
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

      def self.pull_url(branch = nil)
        branch ||= GitParser.current_branch
        base_url = "#{GitParser.repo_url}/pull"

        base_url.concat("/new") if branch.match?(/\d+\/.+/)

        "#{base_url}/#{branch}"
      end

      def self.commit_url(commit)
        "#{GitParser.repo_url}/commit/#{commit}"
      end

      def self.search_url(commit)
        "#{GitParser.repo_url}/search?q=#{commit}"
      end
    end
  end
end
