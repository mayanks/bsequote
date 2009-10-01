require 'rubygems'
require 'bsequote'

include BseQuote

sq = quote('507685') # this is the scrip code for Wipro
sq.each do |x,y|
  puts "#{x} : #{y}"
end

