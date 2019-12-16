require "spec_helper"

RSpec.describe Vpr::Url do
  let(:commit) { "30bd60" }

  describe ".home_url" do
    subject { described_class.new.home_url }

    it "returns the project url" do
      url = %r{https://github.com/\w+/vpr}
      expect(subject).to match(url)
    end
  end

  describe ".pulls_url" do
    subject { described_class.new.pulls_url }

    context "when github" do
      it "returns the commit url" do
        url = %r{https://github.com/\w+/vpr/pulls}
        expect(subject).to match(url)
      end
    end

    context "when bitbucket" do
      it "returns the commit url" do
        url = %r{https://bitbucket.org/\w+/vpr/pull-requests}
        expect(Vpr::GitParser).to receive(:host).and_return("bitbucket.org")
        expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
        expect(subject).to match(url)
      end
    end
  end

  describe ".issues_url" do
    subject { described_class.new.issues_url }

    it "returns the  issues url" do
      url = %r{https://github.com/\w+/vpr/issues}
      expect(subject).to match(url)
    end
  end

  describe ".branches" do
    subject { described_class.new.branches_url }

    it "returns the branches url" do
      url = %r{https://github.com/\w+/vpr/branches}
      expect(subject).to match(url)
    end
  end

  describe ".branch_url" do
    subject { described_class.new.branch_url }

    context "when github" do
      it "returns the branch url" do
        url = %r{https://github.com/\w+/vpr/tree/\w+}
        expect(subject).to match(url)
      end
    end

    context "when bitbucket" do
      it "returns the branch url" do
        url = %r{https://bitbucket.org/\w+/vpr/branch/\w+}
        expect(Vpr::GitParser).to receive(:host).and_return("bitbucket.org")
        expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
        expect(subject).to match(url)
      end
    end
  end

  describe ".pull_url" do
    subject { described_class.new.pull_url }

    context "when github" do
      it "returns the current branch pull request url" do
        url = %r{https://github.com/\w+/vpr/pull/\w+}
        expect(subject).to match(url)
      end
    end

    context "when bitbucket" do
      it "returns the pull request" do
        url = %r{https://bitbucket.org/\w+/vpr/pull-requests/new\?source=\w+}
        expect(Vpr::GitParser).to receive(:host).and_return("bitbucket.org")
        expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
        expect(subject).to match(url)
      end
    end
  end

  describe ".commit_url" do
    subject { described_class.new.commit_url(commit) }

    context "when github" do
      it "returns the commit url" do
        url = %r{https://github.com/\w+/vpr/commit/30bd60}
        expect(subject).to match(url)
      end
    end

    context "when bitbucket" do
      it "returns the commit url" do
        url = %r{https://bitbucket.org/\w+/vpr/commits/30bd60}
        expect(Vpr::GitParser).to receive(:host).and_return("bitbucket.org")
        expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
        expect(subject).to match(url)
      end
    end
  end

  describe ".search_url" do
    subject { described_class.new.search_url(commit) }

    context "when github" do
      it "returns the search page url" do
        url = %r{https://github.com/\w+/vpr/search\?q=30bd60}
        expect(subject).to match(url)
      end
    end

    context "when bitbucket" do
      it "returns the search page url" do
        url = %r{https://bitbucket.org/\w+/vpr/commits/all\?search=30bd60}
        expect(Vpr::GitParser).to receive(:host).and_return("bitbucket.org")
        expect(Vpr::GitParser).to receive(:repo_url).and_return("https://bitbucket.org/JuanCrg90/vpr")
        expect(subject).to match(url)
      end
    end
  end
end
