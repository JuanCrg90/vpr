require "spec_helper"

RSpec.describe Vpr::GitParser do
  describe "GIT_REPO_URL_REGEX maches as expected" do
    context "URI matches correctly" do
      it "it matches vpr as repo name" do
        remote_uri = "git@github.com:JuanCrg90/vpr.git"

        matched = remote_uri.match(described_class::GIT_REPO_URL_REGEX)
        expect(matched[:host]).to eq("github.com")
        expect(matched[:owner]).to eq("JuanCrg90")
        expect(matched[:repo]).to eq("vpr")
      end

      it "matches compi as repo name" do
        remote_uri = "git@github.com:JuanCrg90/compi.git"

        matched = remote_uri.match(described_class::GIT_REPO_URL_REGEX)
        expect(matched[:host]).to eq("github.com")
        expect(matched[:owner]).to eq("JuanCrg90")
        expect(matched[:repo]).to eq("compi")
      end

      it "matches app_checkout as repo name" do
        remote_uri = "git@github.com:JuanCrg90/app_checkout.git"

        matched = remote_uri.match(described_class::GIT_REPO_URL_REGEX)
        expect(matched[:host]).to eq("github.com")
        expect(matched[:owner]).to eq("JuanCrg90")
        expect(matched[:repo]).to eq("app_checkout")
      end
    end
  end

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
        expect { described_class.repo_url }.to raise_error Thor::Error
      end
    end

    it "supports repositories with url name" do
      repo_url = %r{https://github.com/\w+/test.vpr.io}

      url = "git@github.com:JuanCrg90/test.vpr.io.git"
      expect_any_instance_of(Git::Remote).to receive(:url).and_return(url)

      expect(described_class.repo_url).to match(repo_url)
    end
  end

  describe "current_branch" do
    it "returns the current git branch" do
      expect(described_class.current_branch).to match(/\w+/)
    end
  end
end
