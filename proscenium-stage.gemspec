# frozen_string_literal: true

require_relative 'lib/proscenium/stage/version'

Gem::Specification.new do |spec|
  spec.name        = 'proscenium-stage'
  spec.version     = Proscenium::Stage::VERSION
  spec.authors     = ['Joel Moss']
  spec.email       = ['joel@developwithstyle.com']
  spec.homepage    = 'https://github.com/joelmoss/proscenium-stage'
  spec.summary     = 'Proscenium::Stage'
  spec.description = 'Proscenium::Stage'
  spec.license     = 'MIT'

  spec.required_ruby_version = '~> 2.7'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/joelmoss/proscenium-stage'
  spec.metadata['changelog_uri'] = 'https://github.com/joelmoss/proscenium-stage'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'phlex', '1.0.0.rc2'
  spec.add_dependency 'phlex-rails'
  spec.add_dependency 'proscenium', '>= 0.6.0'
  spec.add_dependency 'rails', '>= 7.0.4'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
