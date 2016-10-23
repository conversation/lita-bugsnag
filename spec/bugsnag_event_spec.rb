require 'lita/bugsnag_event'
require 'json'

describe BugsnagEvent do
  let(:json) { JSON.dump(foo: 1) }
  let(:event) { BugsnagEvent.new(json)}

  describe 'to_json' do
    it "returns correct json" do
      expect(event.to_json).to eq %Q{{\n  "foo": 1\n}}
    end
  end
end
