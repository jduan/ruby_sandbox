#!/usr/bin/env ruby

require "bundler/setup"
require "sandbox"
require 'datadog/statsd'

# Create a stats instance.
statsd = Datadog::Statsd.new('127.0.0.1', 8125)

# Increment a counter.
statsd.distribution("build.duration", 100, :tags => ["name:value", "name2:value2"])
