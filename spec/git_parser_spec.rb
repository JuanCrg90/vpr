require "spec_helper"

RSpec.describe Vpr::GitParser do
  describe ".repo_url" do
    it "returns the repo url" do
      repo_url = %r{https://github.com/\w+/vpr}
      expect(described_class.repo_url).to match(repo_url)
    end

    context "when is using the remote flag" do
      let(:remotes) { {upstream: "git@github.com:EduardoGHdez/vpr.git"} }

      it "returns the proper repo url" do
        allow(Vpr::Configuration).to receive(:remote).and_return(:upstream)
        allow(described_class).to receive(:remotes).and_return(remotes)
        repo_url = %r{https://github.com/\w+/vpr}
        expect(described_class.repo_url).to match(repo_url)
      end
    end

    context "when in a sub folder of the repository" do
      around do |example|
        Dir.chdir("lib") { example.run }
      end

      it "returns the repo url" do
        repo_url = %r{https://github.com/\w+/vpr}
        expect(described_class.repo_url).to match(repo_url)
      end
    end

    context "when in a folder outside of a git repository" do
      around do |example|
        Dir.chdir(Dir.tmpdir) { example.run }
      end

      it "raises an error" do
        # TODO: replace with a human readable error message and a non-zero exit
        # code
        expect { described_class.repo_url }.to raise_error(ArgumentError)
      end
    end
  end

  describe "current_branch" do
    it "returns the current git branch" do
      expect(described_class.current_branch).to match(/\w+/)
    end
  end
end
