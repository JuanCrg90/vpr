require "spec_helper"
require "launchy"

RSpec.describe "CLI" do
  describe "home" do
    let(:url) { %r{https://github.com/\w+/vpr} }

    it "open github homepage" do
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["home"])
    end

    context "when user does not specify a remote" do
      it "use :origin by default" do
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["home"])
      end
    end

    context "when user specify a remote" do
      let(:url) { "https://github.com/EduardoGHdez/vpr" }
      let(:remotes) { {upstream: "git@github.com:EduardoGHdez/vpr.git"} }

      it "open github remote's home page" do
        allow(Vpr::GitParser).to receive(:remotes).and_return(remotes)
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["home", "--remote", "upstream"])
      end
    end
  end

  describe "pulls" do
    let(:url) { %r{https://github.com/\w+/vpr/pulls} }

    it "open github pull requests page" do
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["pulls"])
    end

    context "when user does not specify a remote" do
      it "use :origin by default" do
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["pulls"])
      end
    end

    context "when user specify a remote" do
      let(:url) { "https://github.com/EduardoGHdez/vpr/pulls" }
      let(:remotes) { {upstream: "git@github.com:EduardoGHdez/vpr.git"} }

      it "open github remote's pull request" do
        allow(Vpr::GitParser).to receive(:remotes).and_return(remotes)
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["pulls", "--remote", "upstream"])
      end
    end
  end

  describe "issues" do
    let(:url) { %r{https://github.com/\w+/vpr/issues} }

    it "open github issues page" do
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["issues"])
    end

    context "when user does not specify a remote" do
      it "use :origin by default" do
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["issues"])
      end
    end

    context "when user specify a remote" do
      let(:url) { "https://github.com/EduardoGHdez/vpr/issues" }
      let(:remotes) { {upstream: "git@github.com:EduardoGHdez/vpr.git"} }

      it "open github remote's issues page" do
        allow(Vpr::GitParser).to receive(:remotes).and_return(remotes)
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["issues", "--remote", "upstream"])
      end
    end
  end

  describe "branches" do
    let(:url) { %r{https://github.com/\w+/vpr/branches} }

    it "open github branches page" do
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["branches"])
    end

    context "when user does not specify a remote" do
      it "use :origin by default" do
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["branches"])
      end
    end

    context "when user specify a remote" do
      let(:url) { "https://github.com/EduardoGHdez/vpr/branches" }
      let(:remotes) { {upstream: "git@github.com:EduardoGHdez/vpr.git"} }

      it "open githube remote's branches page" do
        allow(Vpr::GitParser).to receive(:remotes).and_return(remotes)
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["branches", "--remote", "upstream"])
      end
    end
  end

  describe "branch" do
    let(:url) { %r{https://github.com/\w+/vpr/tree/.+} }

    it "open github branch page" do
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["branch"])
    end

    context "when user does not specify a remote" do
      it "use :origin by default" do
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["branch"])
      end
    end

    context "when user specify a remote" do
      let(:url) { %r{https://github.com/EduardoGHdez/vpr/tree/.+} }
      let(:remotes) { {upstream: "git@github.com:EduardoGHdez/vpr.git"} }

      it "open github remote's branch page" do
        allow(Vpr::GitParser).to receive(:remotes).and_return(remotes)
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["branch", "--remote", "upstream"])
      end
    end
  end

  describe "pull" do
    let(:url) { %r{https://github.com/\w+/vpr/pull/\w+} }

    it "open github current branch pull request page" do
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["pull"])
    end

    context "when user does not specify a remote" do
      it "use :origin by default" do
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["pull"])
      end
    end

    context "when user specify a remote" do
      let(:url) { %r{https://github.com/EduardoGHdez/vpr/pull/\w+} }
      let(:remotes) { {upstream: "git@github.com:EduardoGHdez/vpr.git"} }

      it "open github remote's current branch pull request page" do
        allow(Vpr::GitParser).to receive(:remotes).and_return(remotes)
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["pull", "--remote", "upstream"])
      end
    end

    context "when user specify a branch" do
      it "open github branch's pull request" do
        expected_url = %r{https://github.com/\w+/vpr/pull/foo}

        expect(Launchy).to receive(:open).with(expected_url)
        Vpr::CLI.start(["pull", "foo"])
      end
    end

    context "when user does not specify a branch" do
      before { allow(Vpr::GitParser).to receive(:current_branch) { "bar" } }
      it "opens github current branch's pull request" do
        expected_url = %r{https://github.com/\w+/vpr/pull/bar}
        expect(Launchy).to receive(:open).with(expected_url)
        Vpr::CLI.start(["pull"])
      end
    end
  end

  describe "visit" do
    let(:url) { %r{https://github.com/\w+/vpr/commit/123} }

    it "open initial commit github page" do
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["visit", "123"])
    end

    context "when user does not specify a remote" do
      it "use :origin by default" do
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["visit", "123"])
      end
    end

    context "when user specify a remote" do
      let(:url) { %r{https://github.com/EduardoGHdez/vpr/commit/123} }
      let(:remotes) { {upstream: "git@github.com:EduardoGHdez/vpr.git"} }

      it "open initial remote's commit github page" do
        allow(Vpr::GitParser).to receive(:remotes).and_return(remotes)
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["visit", "123", "--remote", "upstream"])
      end
    end
  end

  describe "search" do
    let(:url) { %r{https://github.com/\w+/vpr/search\?q=123} }

    it "open initial commit github search page" do
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["search", "123"])
    end

    context "when user does not specify a remote" do
      it "use :origin by default" do
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["search", "123"])
      end
    end

    context "when user specify a remote" do
      let(:url) { %r{https://github.com/EduardoGHdez/vpr/search\?q=123} }
      let(:remotes) { {upstream: "git@github.com:EduardoGHdez/vpr.git"} }

      it "open initial remote's commit github search page" do
        allow(Vpr::GitParser).to receive(:remotes).and_return(remotes)
        expect(Launchy).to receive(:open).with(url)
        Vpr::CLI.start(["search", "123", "--remote", "upstream"])
      end
    end
  end

  describe "version" do
    it "shows gem version with double dash" do
      expect { Vpr::CLI.start(["--version"]) }.to output("#{Vpr::VERSION}\n").to_stdout
    end

    it "shows gem version without double dash" do
      expect { Vpr::CLI.start(["version"]) }.to output("#{Vpr::VERSION}\n").to_stdout
    end
  end
end
