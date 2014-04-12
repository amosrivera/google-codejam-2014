#! /usr/bin/env ruby
file 	= File.new(ARGV[0], "r")

# delete current output file
if File.exist?("output.txt") 
	File.delete("output.txt") 
end

cases 	= file.gets

cases.to_i.times do |n|

	# convert to zero index by substracting  1
	first_answer 	= file.gets.to_i-1
	first_matrix 	= []

	4.times do
		first_matrix << file.gets
	end

	# convert to zero index by substracting  1
	second_answer = file.gets.to_i-1
	second_matrix 	= []

	4.times do
		second_matrix << file.gets
	end

	result = first_matrix[first_answer].split & second_matrix[second_answer].split
	case_n = "Case ##{n+1}: "  

	File.open("output.txt","a") do |output| 
		if result.length == 1
			output.puts case_n+"#{result[0]}"
		elsif result.length < 1
			output.puts case_n+"Volunteer cheated!"
		else 
			output.puts case_n+"Bad magician!"
		end
	end
end
