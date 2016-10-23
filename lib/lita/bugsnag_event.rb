require 'date'
require 'json'

# Value object that wraps raw bugsnag webhook data and provides convenience
# methods for querying it
class BugsnagEvent
  def initialize(data)
    @data = JSON.parse(data)
  end

  def to_json
    JSON.pretty_generate(@data)
  end

end
