require "spec_helper"
require "launchy"

RSpec.describe "CLI" do
  let(:configuration) { Vpr::Configuration.instance }

  describe "home" do
    let(:url) { %r{https://github.com/\w+/vpr} }

    it "open github homepage" do
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["home"])
    end

    context "when user does not specify a remote" do
      it "use :origin by default" do
        expect(Launchy).to receive(:open).with(url)
        expect(configuration).to receive(:remote).and_return(:origin)
        Vpr::CLI.start(["home"])
      end
    end

    context "when user specify a remote" do
      it "open github remote's home page" do
        expect(Launchy).to receive(:open).with(url)
        expect(configuration).to receive(:remote).and_return(:mine)
        Vpr::CLI.start(["home", "--remote", "mine"])
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
        expect(configuration).to receive(:remote).and_return(:origin)
        Vpr::CLI.start(["pulls"])
      end
    end

    context "when user specify a remote" do
      it "open github remote's pull request" do
        expect(Launchy).to receive(:open).with(url)
        expect(configuration).to receive(:remote).and_return(:mine)
        Vpr::CLI.start(["pulls", "--remote", "mine"])
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
        expect(configuration).to receive(:remote).and_return(:origin)
        Vpr::CLI.start(["issues"])
      end
    end

    context "when user specify a remote" do
      it "open github remote's issues page" do
        expect(Launchy).to receive(:open).with(url)
        expect(configuration).to receive(:remote).and_return(:mine)
        Vpr::CLI.start(["issues", "--remote", "mine"])
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
        expect(configuration).to receive(:remote).and_return(:origin)
        Vpr::CLI.start(["branches"])
      end
    end

    context "when user specify a remote" do
      it "open githube remote's branches page" do
        expect(Launchy).to receive(:open).with(url)
        expect(configuration).to receive(:remote).and_return(:mine)
        Vpr::CLI.start(["branches", "--remote", "mine"])
      end
    end
  end

  describe "branch" do
    let(:url) { %r{https://github.com/\w+/vpr/tree/\w+} }

    it "open github branch page" do
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["branch"])
    end

    context "when user does not specify a remote" do
      it "use :origin by default" do
        expect(Launchy).to receive(:open).with(url)
        expect(configuration).to receive(:remote).and_return(:origin)
        Vpr::CLI.start(["branch"])
      end
    end

    context "when user specify a remote" do
      it "open github remote's branch page" do
        expect(Launchy).to receive(:open).with(url)
        expect(configuration).to receive(:remote).and_return(:mine)
        Vpr::CLI.start(["branch", "--remote", "mine"])
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
        expect(configuration).to receive(:remote).and_return(:origin)
        Vpr::CLI.start(["pull"])
      end
    end

    context "when user specify a remote" do
      it "open github remote's current branch pull request page" do
        expect(Launchy).to receive(:open).with(url)
        expect(configuration).to receive(:remote).and_return(:mine)
        Vpr::CLI.start(["pull", "--remote", "mine"])
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
        expect(configuration).to receive(:remote).twice.and_return(:origin)
        Vpr::CLI.start(["visit", "123"])
      end
    end

    context "when user specify a remote" do
      it "open initial remote's commit github page" do
        expect(Launchy).to receive(:open).with(url)
        expect(configuration).to receive(:remote).twice.and_return(:mine)
        Vpr::CLI.start(["visit", "123", "--remote", "mine"])
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
        expect(configuration).to receive(:remote).and_return(:origin)
        Vpr::CLI.start(["search", "123"])
      end
    end

    context "when user specify a remote" do
      it "open initial remote's commit github search page" do
        expect(Launchy).to receive(:open).with(url)
        expect(configuration).to receive(:remote).and_return(:mine)
        Vpr::CLI.start(["search", "123", "--remote", "mine"])
      end
    end
  end

  describe "version" do
    it "shows gem version with double dash" do
      expect(Vpr::CLI.start(["--version"])).to match("1.0.0")
    end

    it "shows gem version without double dash" do
      expect(Vpr::CLI.start(["version"])).to match("1.0.0")
    end
  end
end
