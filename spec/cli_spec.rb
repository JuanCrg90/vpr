require 'spec_helper'

RSpec.describe "CLI" do
  describe 'visit' do
    it 'open initial commit github page' do
      expect_any_instance_of(Kernel).to receive(:system).with("open", "https://github.com/JuanCrg90/vpr/commit/123")
      Vpr::CLI.start(["visit", '123'])
    end
  end

  describe 'search' do
    it 'open initial commit github search page' do
      expect_any_instance_of(Kernel).to receive(:system).with("open", "https://github.com/JuanCrg90/vpr/search?q=123")
      Vpr::CLI.start(["search", '123'])
    end
  end
end
