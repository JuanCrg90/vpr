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
        git = Git.open(Dir.pwd)
        git.current_branch
      end

      def host
        remote_uri = remotes[Configuration.remote]
        matched = remote_uri.match(REGEXP)

        matched[:host]
      end

      private

      def remotes
        git = Git.open(Dir.pwd)
        git.remotes.map { |remote| [remote.name.to_sym, remote.url] }.to_h
      end
    end
  end
end
