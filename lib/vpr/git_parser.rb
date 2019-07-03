require 'git'

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

    def self.repo_url
      git = Git.open(Dir.pwd)
      remote_uri = git.remotes.first.url

      matched = remote_uri.match(REGEXP)

      File.join("https://#{matched[:host]}", matched[:owner],matched[:repo])
    end
  end
end
