require 'date'
require 'json'

# Value object that wraps raw bugsnag webhook data and provides convenience
# methods for querying it
class BugsnagEvent
  def initialize(data)
    @data = JSON.parse(data)
  end

  def account_id
    @data.fetch("account", {}).fetch("id", "")
  end

  def account_name
    @data.fetch("account", {}).fetch("name", "")
  end

  def project_id
    @data.fetch("project", {}).fetch("id", "")
  end

  def project_name
    @data.fetch("project", {}).fetch("name", "")
  end

  def trigger_type
    @data.fetch("trigger", {}).fetch("type", "")
  end

  def trigger_message
    @data.fetch("trigger", {}).fetch("message", "")
  end

  def error_id
    @data.fetch("error", {}).fetch("id", "")
  end

  def error_exception_class
    @data.fetch("error", {}).fetch("exceptionClass", "")
  end

  def error_release_stage
    @data.fetch("error", {}).fetch("releaseStage", "")
  end

  def error_url
    @data.fetch("error", {}).fetch("url", "")
  end

  def to_json
    JSON.pretty_generate(@data)
  end

end
