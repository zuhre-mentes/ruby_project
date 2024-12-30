source "https://rubygems.org"

# Rails Framework
gem "rails", "~> 7.2.2"
gem "sprockets-rails" # The original asset pipeline for Rails

# Database
gem "sqlite3", ">= 1.4" # Use sqlite3 as the database for Active Record

# Web Server
gem "puma", ">= 5.0" # Use the Puma web server

# JavaScript Frameworks and Tools
gem "importmap-rails" # Use JavaScript with ESM import maps
gem "turbo-rails" # Hotwire's SPA-like page accelerator
gem "stimulus-rails" # Hotwire's modest JavaScript framework

# API and JSON Builder
gem "jbuilder" # Build JSON APIs with ease

# Time Zone Support
gem "tzinfo-data", platforms: %i[mswin mswin64 mingw x64_mingw jruby windows jruby] # Time zone support for Windows

# Performance Optimization
gem "bootsnap", require: false # Reduces boot times through caching

# Authentication and Authorization
gem "devise" # User authentication
gem "pundit" # Authorization

# File Uploads and Validations
gem "active_storage_validations" # Validations for Active Storage file uploads
gem "bcrypt", "~> 3.1.7" # Use Active Model has_secure_password

# CSS and Design Frameworks
gem "bootstrap", "~> 5.0" # Frontend framework
gem "sassc-rails", "~> 2.1" # SCSS processing

# Asset Management
gem "propshaft" # Modern asset pipeline
gem "webpacker", "~> 5.4.4" # Webpacker for JavaScript bundling

# Pagination
gem "will_paginate", "~> 3.1.2" # Pagination
gem "kaminari" # Alternative pagination gem


# OpenAI Integration
gem "ruby-openai", "~> 4.0.0" # OpenAI API integration

# Additional Tools
gem "solid_cache" # Database-backed cache for Rails
gem "solid_queue" # Database-backed queue for Rails
gem "solid_cable" # Database-backed Action Cable

# Docker and Deployment
gem "kamal", require: false # Docker deployment tool

# HTTP Optimization
gem "thruster", require: false # HTTP asset caching and compression

group :development, :test do
  # Debugging Tools
  gem "debug", platforms: %i[mri mswin mswin64 mingw x64_mingw windows], require: "debug/prelude"
  
  # Static Analysis
  gem "brakeman", require: false # Static analysis for security vulnerabilities
  gem "rubocop-rails-omakase", require: false # Ruby styling

  # Environment Variables
  gem "dotenv-rails" # Environment management
end

group :development do
  # Console and Error Highlighting
  gem "web-console" # Use console on exceptions pages
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby] # Highlight error location
end

group :test do
  # Testing Tools
  gem "capybara" # Use system testing
  gem "selenium-webdriver" # Browser automation
end

