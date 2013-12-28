#!/usr/bin/env ruby
# encoding: UTF-8

require 'rubygems'
require 'plist'

def load_colors_pairs_array_from_file(filename)
  colors_string = File.open(filename, 'r'){ |file| file.read }
  colors_pairs_array = colors_string.split(',')
  return colors_pairs_array
end

def process_colors_pairs_and_save(colors_pairs)
  colors = Array.new

  colors_pairs.each do |color_pair|
    pair_array = color_pair.split('=')
    color = Hash.new
    name = pair_array[0].strip
    puts "#{name} \r\n"
    color["name"] = name
    color["hash"] = pair_array[1]
    colors << color
  end
  puts "Success parsing"

  colors_hash = Hash.new
  colors_hash["colors"] = colors
  save_colors(colors_hash)
end

def save_colors(colors)
  plist = colors.to_plist
  File.open("colors.plist", 'w') {|f| f.write(plist) }
  puts "Success saving colors.plist"
end

filename = ARGV[0]
if (filename.nil?)
  puts "Error: No input file"
else
  colors_pairs = load_colors_pairs_array_from_file(filename)
  process_colors_pairs_and_save(colors_pairs)
end
