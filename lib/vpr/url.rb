require "vpr/git_parser"
require "vpr/services"

module Vpr
  class Url
    def initialize
      @service = services[GitParser.host.to_sym]
    end

    def home_url
      service.home_url
    end

    def pulls_url
      service.pulls_url
    end

    def issues_url
      service.issues_url
    end

    def branches_url
      service.branches_url
    end

    def branch_url
      service.branch_url
    end

    def pull_url(branch = nil)
      service.pull_url(branch)
    end

    def commit_url(commit)
      service.commit_url(commit)
    end

    def search_url(commit)
      service.search_url(commit)
    end

    private

    def services
      {
        'github.com': Vpr::Services::GitHub,
        'bitbucket.org': Vpr::Services::Bitbucket,
        'gitlab.com': Vpr::Services::GitLab,
      }
    end

    attr_reader :service
  end
end
