#!/usr/bin/env ruby
require 'extralite'
require 'sequel'
require 'fileutils'

FileUtils.cp('locked.db', '/tmp/locked.db')
@sequel = Sequel.connect("extralite:///tmp/locked.db")

gen = @sequel.create_table_generator
gen.primary_key :_id
@sequel.create_table!(:test1, generator: gen, strict: true)
puts 'Worked first time'
@sequel.create_table!(:test1, generator: gen, strict: true)
puts 'Worked second time'
@sequel.table_exists?(:_keyvalue)
@sequel.create_table!(:test1, generator: gen, strict: true)
puts 'Worked third time'
