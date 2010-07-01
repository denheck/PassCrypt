#!/usr/bin/ruby

require 'PassFile.rb'

passFile = PassFile.new("pass.yaml")
puts passFile.passwords.get("test")
