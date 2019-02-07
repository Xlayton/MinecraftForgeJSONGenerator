#!/usr/bin/env ruby
require "io/console"
require_relative "BlockstateJSON.rb"
require_relative "BlockModelJSON.rb"
require_relative "ItemModelJSON.rb"
require_relative "ToolModelJSON.rb"

class GenerateJSON
  def self.addBlockToLang(blockName)
    values = blockName.split("_")
    file = File.open((".\\files\\lang\\en_US.lang"), "a+")
    toAdd = ("tile.#{blockName}.name=")
    values.each do |x|
      toAdd += ("#{x.chomp.capitalize} ")
    end
    file << ("#{toAdd}\n")
    file.close
    print "Item added to en_US.lang file\n"
  end

  def self.addItemToLang(itemName)
    values = itemName.split("_")
    file = File.open((".\\files\\lang\\en_US.lang"), "w+")
    toAdd = ("item.#{itemName}.name=")
    values.each do |x|
      toAdd += ("#{x.chomp.capitalize} ")
    end
    file << ("#{toAdd}\n")
    file.close
    print "Item added to en_US.lang file\n"
  end

  def self.start
    isOpen = true
    changeInput = true
    print "Insert modID:\n"
    modID = gets.chomp
    while (isOpen)
      if (changeInput)
        print "Insert item name:\n"
        itemName = gets.chomp
        changeInput = false
      end
      print "0. Quit\n"
      print "1. Generate Block JSON files\n"
      print "2. Generate Item JSON files\n"
      print "3. Generate Tool JSON files\n"
      print "4. Change Item Inputs\n"
      case gets.chomp
      when "0"
        isOpen = false
      when "1"
        file = File.open((".\\files\\blockstates\\#{itemName}.json"), "w+")
        file.puts BlockstateJSON.makeJSON(modID, itemName)
        file.close
        print ("Created \\files\\blockstates\\#{itemName}.json\n")
        file = File.open((".\\files\\models\\block\\#{itemName}.json"), "w+")
        file.puts BlockModelJSON.makeJSON(modID, itemName)
        file.close
        print ("Created \\files\\models\\block\\#{itemName}.json\n")
        file = File.open((".\\files\\models\\item\\#{itemName}.json"), "w+")
        file.puts BlockModelJSON.makeItemModelJSON(modID, itemName)
        file.close
        print ("Created \\files\\models\\item\\#{itemName}.json\n")
        GenerateJSON.addBlockToLang(itemName)
      when "2"
        file = File.open((".\\files\\models\\item\\#{itemName}.json"), "w+")
        file.puts ItemModelJSON.makeJSON(modID, itemName)
        file.close
        print ("Created \\files\\models\\item\\#{itemName}.json\n")
        GenerateJSON.addItemToLang(itemName)
      when "3"
        file = File.open((".\\files\\models\\item\\#{itemName}.json"), "w+")
        file.puts ToolModelJSON.makeJSON(modID, itemName)
        file.close
        GenerateJSON.addItemToLang(itemName)
      when "4"
        changeInput = true
      else
        print "Please select one of the options\n"
      end
    end
  end
end
