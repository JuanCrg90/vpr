require 'spec_helper'
require 'launchy'

RSpec.describe "CLI" do
  describe 'home' do
    it 'open github homepage' do
      url = %r{https://github.com/\w+/vpr}
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["home"])
    end
  end

  describe 'pulls' do
    it 'open github pull requests page' do
      url = %r{https://github.com/\w+/vpr/pulls}
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["pulls"])
    end
  end

  describe 'issues' do
    it 'open github issues page' do
      url = %r{https://github.com/\w+/vpr/issues}
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["issues"])
    end
  end

  describe 'branches' do
    it 'open github branches page' do
      url = %r{https://github.com/\w+/vpr/branches}
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["branches"])
    end
  end

  describe 'branch' do
    it 'open github branch page' do
      url = %r{https://github.com/\w+/vpr/tree/\w+}
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["branch"])
    end
  end

  describe 'pull' do
    it 'open github current branch pull request page' do
      url = %r{https://github.com/\w+/vpr/pull/\w+}
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["pull"])
    end
  end

  describe 'visit' do
    it 'open initial commit github page' do
      url = %r{https://github.com/\w+/vpr/commit/123}
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["visit", '123'])
    end
  end

  describe 'search' do
    it 'open initial commit github search page' do
      url = %r{https://github.com/\w+/vpr/search\?q=123}
      expect(Launchy).to receive(:open).with(url)
      Vpr::CLI.start(["search", '123'])
    end
  end
end
