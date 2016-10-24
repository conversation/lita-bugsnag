require 'lita/bugsnag_event'
require 'json'

describe BugsnagEvent do
  let(:json_path) { File.join(File.dirname(__FILE__), "fixtures", "exception.json")}
  let(:json) { File.read(json_path) }
  let(:event) { BugsnagEvent.new(json)}

  describe 'to_json' do
    it "returns correct json" do
      expect(event.to_json).to match /\{.+\}/m
    end
  end

  describe 'account_name' do
    it "returns correct value" do
      expect(event.account_name).to eq "Test Account"
    end
  end

  describe 'account_id' do
    it "returns correct value" do
      expect(event.account_id).to eq "123"
    end
  end

  describe 'project_name' do
    it "returns correct value" do
      expect(event.project_name).to eq "project"
    end
  end

  describe 'project_id' do
    it "returns correct value" do
      expect(event.project_id).to eq "456"
    end
  end

  describe 'trigger_type' do
    it "returns correct value" do
      expect(event.trigger_type).to eq "exception"
    end
  end

  describe 'trigger_message' do
    it "returns correct value" do
      expect(event.trigger_message).to eq "Event"
    end
  end

  describe 'error_id' do
    it "returns correct value" do
      expect(event.error_id).to eq "789"
    end
  end

  describe 'error_exception_class' do
    it "returns correct value" do
      expect(event.error_exception_class).to eq "ActionController::ParameterMissing"
    end
  end

  describe 'error_release_stage' do
    it "returns correct value" do
      expect(event.error_release_stage).to eq "production"
    end
  end

  describe 'error_url' do
    it "returns correct value" do
      expect(event.error_url).to eq "https://app.bugsnag.com/test-account/project/errors/1234?event_id=789"
    end
  end
end
