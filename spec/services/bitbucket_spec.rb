require "spec_helper"

RSpec.describe Vpr::Services::Bitbucket do
  let(:commit) { "30bd60" }

  describe ".home_url" do
    subject { described_class.home_url }

    it "returns the project url" do
      url = %r{https://bitbucket.org/\w+/vpr}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end

  describe ".pulls_url" do
    subject { described_class.pulls_url }

    it "returns the commit url" do
      url = %r{https://bitbucket.org/\w+/vpr/pull-requests}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end

  describe ".issues_url" do
    subject { described_class.issues_url }

    it "returns the  issues url" do
      url = %r{https://bitbucket.org/\w+/vpr/issues}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end

  describe ".branches_url" do
    subject { described_class.branches_url }

    it "returns the  issues url" do
      url = %r{https://bitbucket.org/\w+/vpr/branches}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end

  describe ".branch_url" do
    subject { described_class.branch_url }

    it "returns the branch url" do
      url = %r{https://bitbucket.org/\w+/vpr/branch/.+}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end

  describe ".pull_url" do
    subject { described_class.pull_url }

    it "returns the pull request" do
      url = %r{https://bitbucket.org/\w+/vpr/pull-requests/new\?source=.+}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
      expect(subject).to match(url)
    end

    context "when no branch is passed" do
      before { allow(Vpr::GitParser).to receive(:current_branch).and_return "foo-branch" }

      it "uses the current branch for generating the pull request url" do
        url = %r{https://bitbucket.org/\w+/vpr/pull-requests/new\?source=foo-branch}
        expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
        expect(subject).to match(url)
      end
    end

    context "whend it branch is passed" do
      subject { described_class.pull_url("awesome-branch") }

      it "uses it for generating the pull request url" do
        url = %r{https://bitbucket.org/\w+/vpr/pull-requests/new\?source=awesome-branch}
        expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
        expect(subject).to match(url)
      end
    end
  end

  describe ".commit_url" do
    subject { described_class.commit_url(commit) }

    it "returns the commit url" do
      url = %r{https://bitbucket.org/\w+/vpr/commits/30bd60}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end

  describe ".search_url" do
    subject { described_class.search_url(commit) }

    it "returns the search page url" do
      url = %r{https://bitbucket.org/\w+/vpr/commits/all\?search=30bd60}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end
end
