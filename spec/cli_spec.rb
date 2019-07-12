require 'spec_helper'
require 'launchy'

RSpec.describe "CLI" do
  describe 'home' do
    it 'open github homepage' do
      expect(Launchy).to receive(:open).with("https://github.com/JuanCrg90/vpr")
      Vpr::CLI.start(["home"])
    end
  end

  describe 'visit' do
    it 'open initial commit github page' do
      expect(Launchy).to receive(:open).with("https://github.com/JuanCrg90/vpr/commit/123")
      Vpr::CLI.start(["visit", '123'])
    end
  end

  describe 'search' do
    it 'open initial commit github search page' do
      expect(Launchy).to receive(:open).with("https://github.com/JuanCrg90/vpr/search?q=123")
      Vpr::CLI.start(["search", '123'])
    end
  end
end
