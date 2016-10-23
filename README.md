# lita-bugsnag

A lita handler for interacting with bugsnag.com, an error tracking provider

## Installation

Add this gem to your lita installation by including the following line in your Gemfile:

    gem "lita-bugsnag"

## Externally triggered events

This handler can track errors and trigger a variety of activities as appropriate. To
get started, use the bugnsag web interface to configure a webhook that POSTs to:

    http://your-lita-bot.com/bugsnag

## Chat commands

This handler provides no additional chat commands. Yet.

## Lita Events

This handler will emit an event onto the lita event bus for each bugsnag webhook, allowing
other handlers to respond them.

Currently, the following event are emitted:

* bugsnag\_error

To respond to the events, write a new handler that looks something like this:

    class BugsnagDebugHandler < Lita::Handlers::Handler
      on :bugsnag_error, :debug

      def debug(payload)
        event = payload[:event]

        robot.send_message(target, event.inspect)
      end

      private

      def target
        Source.new(room: Lita::Room.find_by_name(config.channel_name) || "general")
      end
    end

## TODO

Possible ideas for new features, either via chat commands or externally triggered events:

* more specs
