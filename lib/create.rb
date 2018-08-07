# coding: utf-8
# いっきに fm テンプレートを作る方法を考える
require "Date"
require "erb"

TARGET_DIR = "./_drafts"
TARGET_TEMPLATE = DATA.read

begin
  Dir.open(TARGET_DIR)
rescue
  puts "Jekyll の /_drafts ディレクトリがある箇所に設置してください"
  exit
end

today = Date.parse(Time.new.strftime("%Y-%m-%d"))

loop.with_index(0) do |_, add|
  that_time = today + add
  break if that_time.month == today.next_month.month

  created_file = File.open("#{TARGET_DIR}/#{that_time.strftime("%Y-%m-%d")}-#{ARGV.first}.md", "w")
  ERB.new(TARGET_TEMPLATE).result(binding).split(/\n/).each { |line| created_file.puts(line) }
  created_file.close
end

__END__
---
layout: post
title: H30年度IPA NW の勉強記録(<%= that_time.strftime("%y-%m-%d") %>)
date: <%= that_time %> 23:56 +0900
categories: 
- diary
- Qualification
tags:
- IPA
- Network
---
