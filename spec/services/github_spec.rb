require "spec_helper"

RSpec.describe Vpr::Services::GitHub do
  let(:commit) { "30bd60" }

  describe ".home_url" do
    subject { described_class.home_url }

    it "returns the project url" do
      url = %r{https://github.com/\w+/vpr}
      expect(subject).to match(url)
    end
  end

  describe ".pulls_url" do
    subject { described_class.pulls_url }

    it "returns the commit url" do
      url = %r{https://github.com/\w+/vpr/pulls}
      expect(subject).to match(url)
    end
  end

  describe ".issues_url" do
    subject { described_class.issues_url }

    it "returns the  issues url" do
      url = %r{https://github.com/\w+/vpr/issues}
      expect(subject).to match(url)
    end
  end

  describe ".branches_url" do
    subject { described_class.branches_url }

    it "returns the branches url" do
      url = %r{https://github.com/\w+/vpr/branches}
      expect(subject).to match(url)
    end
  end

  describe ".branch_url" do
    subject { described_class.branch_url }

    it "returns the branch url" do
      url = %r{https://github.com/\w+/vpr/tree/.+}
      expect(subject).to match(url)
    end
  end

  describe ".pull_url" do
    subject { described_class.pull_url }

    context "when current branch start with a word" do
      it "returns the current branch pull request url" do
        branch = "feature/my-feature"
        expect(Vpr::GitParser).to receive(:current_branch).and_return(branch)

        url = %r{https://github.com/\w+/vpr/pull/.+}
        expect(subject).to match(url)
      end
    end

    context "when current branch start with number slash" do
      it "returns the new pull request url" do
        branch = "123/feature"
        expect(Vpr::GitParser).to receive(:current_branch).and_return(branch)

        url = %r{https://github.com/\w+/vpr/pull/new/\d+/.+}
        expect(subject).to match(url)
      end
    end

    context "when no branch is passed" do
      before { allow(Vpr::GitParser).to receive(:current_branch).and_return "foo-branch" }
      it "uses the current branch for generating the pull request url" do
        url = %r{https://github.com/\w+/vpr/pull/foo-branch}
        expect(Vpr::GitParser).to receive(:repo_url).and_return("https://github.com/JuanCrg90/vpr")
        expect(subject).to match(url)
      end
    end

    context "when branch is passed" do
      subject { described_class.pull_url("awesome-branch") }

      it "uses it for generating the pull request url" do
        url = %r{https://github.com/\w+/vpr/pull/awesome-branch}
        expect(Vpr::GitParser).to receive(:repo_url).and_return("https://github.com/JuanCrg90/vpr")
        expect(subject).to match(url)
      end
    end
  end

  describe ".commit_url" do
    subject { described_class.commit_url(commit) }

    it "returns the commit url" do
      url = %r{https://github.com/\w+/vpr/commit/30bd60}
      expect(subject).to match(url)
    end
  end

  describe ".search_url" do
    subject { described_class.search_url(commit) }

    it "returns the search page url" do
      url = %r{https://github.com/\w+/vpr/search\?q=30bd60}
      expect(subject).to match(url)
    end
  end
end
