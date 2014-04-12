#! /usr/bin/env ruby
require 'bigdecimal'

# get first argument from command line
file 	= File.new(ARGV[0], "r")

# delete current output file
if File.exist?("output.txt")
	File.delete("output.txt")
end

# number of cases
cases 	= file.gets

# cookie rate starts at 2

cases.to_i.times do |n|
	price, gain, limit = file.gets.split
	
	# convert to high precision decimals
	# price 	= BigDecimal.new(price)
	# gain  	= BigDecimal.new(gain)
	# limit 	= BigDecimal.new(limit)
	# cookies = BigDecimal.new("2")
	
	# convert to floats
	price 	= price.to_f
	gain  	= gain.to_f
	limit 	= limit.to_f
	cookies = "2".to_f
	added = 0

	time = limit / cookies

	begin
		continue = false
		added = (price / cookies) + added
		cookies = cookies + gain
		tmp = (limit / cookies) + added
		if (time > tmp)
			time = tmp
			continue = true
		end
	end while continue == true

	case_n = "Case ##{n+1}: "
	File.open("output.txt","a") do |output|
		output.puts case_n + "%0.7f" % time.round(7)
	end
end


