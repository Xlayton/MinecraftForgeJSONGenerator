require_relative "GenerateJSON.rb"
require_relative "GenerateRecipeJSON.rb"

class JSONFormatter
  def self.start_wizard
    isOpen = true
    while (isOpen)
      print "0. Quit\n1. Generate item JSON\n2. Generate recipe JSON\n"
      case gets.chomp
      when "0"
        isOpen = false
      when "1"
        GenerateJSON.start
      when "2"
        GenerateRecipeJSON.start
      end
    end
  end
end

begin
  JSONFormatter.start_wizard
rescue => exception
  File.open("crashlog.log") do |f|
    f.puts e.inspect
    f.puts e.backtrace
  end
end
