require "spec_helper"

RSpec.describe Vpr::Services::GitLab do
  let(:commit) { "30bd60" }

  describe ".home_url" do
    subject { described_class.home_url }

    it "returns the project url" do
      url = %r{https://gitlab.com/\w+/vpr}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://gitlab.com/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end

  describe ".pulls_url" do
    subject { described_class.pulls_url }

    it "returns the commit url" do
      url = %r{https://gitlab.com/\w+/vpr/-/merge_requests}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://gitlab.com/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end

  describe ".issues_url" do
    subject { described_class.issues_url }

    it "returns the  issues url" do
      url = %r{https://gitlab.com/\w+/vpr/-/issues}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://gitlab.com/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end

  describe ".branches_url" do
    subject { described_class.branches_url }

    it "returns the branches url" do
      url = %r{https://gitlab.com/\w+/vpr/-/branches}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://gitlab.com/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end

  describe ".branch_url" do
    subject { described_class.branch_url }

    it "returns the branch url" do
      url = %r{https://gitlab.com/\w+/vpr/-/tree/.+}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://gitlab.com/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end

  describe ".pull_url" do
    subject { described_class.pull_url }

    it "returns the pull request" do
      url = %r{https://gitlab.com/\w+/vpr/-/merge_requests/.+}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://gitlab.com/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end

  describe ".commit_url" do
    subject { described_class.commit_url(commit) }

    it "returns the commit url" do
      url = %r{https://gitlab.com/\w+/vpr/-/commit/30bd60}
      expect(Vpr::GitParser).to receive(:repo_url).and_return("https://gitlab.com/JuanCrg90/vpr")
      expect(subject).to match(url)
    end
  end

  describe ".search_url" do
    subject { described_class.search_url(commit) }

    it "returns the search page url" do
      url = %r{https://gitlab.com/search\?search=30bd60}
      expect(Vpr::GitParser).to receive(:host).and_return("https://gitlab.com")
      expect(subject).to match(url)
    end
  end
end
