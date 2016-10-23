require "lita/bugsnag"

describe Lita::Handlers::Bugsnag, lita_handler: true do
  let(:handler) { Lita::Handlers::Bugsnag.new(robot) }

  context "when buildkite sends a POST" do
    it "responds" do
      expect(handler).to route_http(:post, "/bugsnag").to(:bugsnag_event)
    end
  end

  describe "#bugsnag_event" do
    let(:request) { double(body: double(read: event_json)) }
    let(:response) { double }

    before do
      allow(robot).to receive(:trigger)
    end

    context "with a dummy event" do # until we know more about the data shape they send
      let(:event_json) { JSON.dump(foo: 1) }

      it "emits a lita event" do
        handler.bugsnag_event(request, response)
        expect(robot).to have_received(:trigger).with(:bugsnag_error, event: a_kind_of(BugsnagEvent))
      end
    end

  end
end
