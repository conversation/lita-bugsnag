require "lita"
require 'lita/bugsnag_event'

module Lita
  module Handlers
    # Receives bugsnag webhooks and emits them onto the lita event bus
    # so other handlers can do their thing
    class Bugsnag < Handler

      http.post "/bugsnag", :bugsnag_event

      def bugsnag_event(request, response)
        event = BugsnagEvent.new(request.body.read)
        robot.trigger(:bugsnag_error, event: event)
      end

      Lita.register_handler(self)
    end

  end
end
