Gem::Specification.new do |spec|
  spec.name = "lita-bugsnag"
  spec.version = "0.1.0"
  spec.summary = "Lita handler for interacting with bugsnag.com, an error tracking provider"
  spec.description = "Lita handler for interacting with bugsnag.com, an error tracking provider"
  spec.license = "MIT"
  spec.files =  Dir.glob("{lib}/**/**/*")
  spec.extra_rdoc_files = %w{README.md MIT-LICENSE }
  spec.authors = ["James Healy"]
  spec.email   = ["james.healy@theconversation.edu.au"]
  spec.homepage = "http://github.com/conversation/lita-bugsnag"
  spec.required_ruby_version = ">=2.0"
  spec.metadata = { "lita_plugin_type" => "handler" }

  spec.add_development_dependency("rake")
  spec.add_development_dependency("rspec", "~> 3.4")
  spec.add_development_dependency("pry")
  spec.add_development_dependency("rdoc")

  spec.add_dependency("lita")
end
