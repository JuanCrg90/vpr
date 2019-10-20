require "git"
require "vpr/configuration"

module Vpr
  class GitParser
    REGEXP = %r{
    (?<protocol>(http://|https://|git://|ssh://))*
      (?<username>[^@]+@)*
      (?<host>[^/]+)
    [/:]
    (?<owner>[^/]+)
    /
    (?<repo>[^/.]+)
    }x.freeze

    class << self
      def repo_url
        remote_uri = remotes[Configuration.remote]
        matched = remote_uri.match(REGEXP)

        File.join("https://#{matched[:host]}", matched[:owner], matched[:repo])
      end

      def current_branch
        git = Git.open(git_dir)
        git.current_branch
      end

      def host
        remote_uri = remotes[Configuration.remote]
        matched = remote_uri.match(REGEXP)

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
          return dir if parent == dir # we're at the root

          dir = parent
        end
      end
    end
  end
end
