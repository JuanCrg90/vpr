require "git"
require "vpr/configuration"

module Vpr
  class GitParser
    GIT_REPO_URL_REGEX = %r{
    (?<protocol>(http://|https://|git://|ssh://))*
      (?<username>[^@]+@)*
      (?<host>[^/]+)
    [/:]
    (?<owner>[^/]+)
    /
    (?<repo>[^\/]+)\.git
    }x.freeze

    class << self
      def repo_url
        remote_uri = remotes[Configuration.remote]
        matched = remote_uri.match(GIT_REPO_URL_REGEX)

        File.join("https://#{matched[:host]}", matched[:owner], matched[:repo])
      end

      def current_branch
        git = Git.open(git_dir)
        git.current_branch
      end

      def host
        remote_uri = remotes[Configuration.remote]
        matched = remote_uri.match(GIT_REPO_URL_REGEX)

        matched[:host]
      end

      private

      def remotes
        git = Git.open(git_dir)
        git.remotes.map { |remote| [remote.name.to_sym, remote.url] }.to_h
      end

      def git_dir
        dir = Dir.pwd

        loop do
          return dir if File.directory?(File.join(dir, ".git"))

          parent = File.dirname(dir)

          # NOTE: Raising an error because at this point it is at the root dir
          raise Thor::Error.new("There is no repository in current directory") if parent == dir

          dir = parent
        end
      end
    end
  end
end
