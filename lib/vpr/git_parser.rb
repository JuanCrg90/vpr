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
        git = Git.open(Dir.pwd)

        remotes = {}
        git.remotes.each do |remote|
          remotes[remote.name.to_sym] = remote.url
        end

        remote_uri = remotes[Configuration.instance.remote]

        matched = remote_uri.match(REGEXP)

        File.join("https://#{matched[:host]}", matched[:owner], matched[:repo])
      end

      def current_branch
        git = Git.open(Dir.pwd)
        git.current_branch
      end

      def host
        git = Git.open(Dir.pwd)

        remotes = {}
        git.remotes.each do |remote|
          remotes[remote.name.to_sym] = remote.url
        end

        remote_uri = remotes[Configuration.instance.remote]

        matched = remote_uri.match(REGEXP)

        matched[:host]
      end
    end
  end
end
