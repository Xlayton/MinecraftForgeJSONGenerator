require "io/console"

class GenerateRecipeJSON
  def self.addShapedConditions
    toAdd = ["pattern", "key"]
    toAdd[1] = getKeyJSON
    toAdd[0] = getPatternJSON
    ("#{toAdd[0]}#{toAdd[1]}")
  end

  def self.getKeyJSON
    key = "\t\"key\": {\n"
    print "How many different ingredients are there?\n"
    amtDifIngre = gets.chomp.to_i
    for i in 1..amtDifIngre
      print ("Insert item id of item #{i}\n")
      itemID = gets.chomp
      key += ("\t\t\"#{i}\": {\n" + "\t\t\t\"item\": \"#{itemID}\"\n \t\t}")
      if (i != amtDifIngre)
        key += ",\n"
      else
        key += "\n"
      end
    end
    key += "\t},\n"
  end

  def self.getPatternJSON
    pattern = "\t\"pattern\":\n\t[\n"
    isValid = false
    for i in 1..3
      print "Insert row #{i} of ingredients\n"
      while (!isValid)
        ingredientRow = gets
        ingredientRow = ingredientRow.tr("\n", "")
        if (ingredientRow.length != 3)
          print "There are 3 ingredients to a row\n"
        else
          pattern += ("\t\t\"#{ingredientRow}\"")
          break
        end
      end
      if (i != 3)
        pattern += ",\n"
      else
        pattern += "\n"
      end
    end
    pattern += "\t],\n"
  end

  def self.getIngredientsJSON
    ingredients = "\t\"ingredients\": [\n"
    print "What is the item id of the ingredient?\n"
    ingredientID = gets.chomp
    ingredients += "\t\t{\n\t\t\t\"test\": \"#{ingredientID}\"\n\t\t}\n\t],\n\n"
  end

  def self.getResultJSON(itemID)
    result = "\t\"result\":\n\t{\n"
    result += "\t\t\"item\": \"#{itemID}\",\n"
    print "Enter amount each craft\n"
    amt = gets.chomp
    result += "\t\t\"count\": #{amt}\n"
    result += "\t}\n"
    result
  end

  def self.start
    isOpen = true
    while (isOpen)
      print "0. Quit\n1. Shaped Recipe\n2. Shapeless Recipe\n"
      case gets.chomp
      when "0"
        isOpen = false
      when "1"
        jsonContent = "{\n\t\"type\": \"minecraft:crafting_shaped\",\n\n"
        jsonContent += addShapedConditions
        print "Enter ItemID of the item being crafted\n"
        itemID = gets.chomp
        jsonContent += getResultJSON(itemID)
        jsonContent += "}"
        fullname = itemID.split(":")
        name = fullname[1]
        file = File.open("files\\recipes\\#{name}_recipe.json", "w+")
        file.puts jsonContent
        file.close
      when "2"
        jsonContent = "{\n\t\"type\": \"minecraft:crafting_shapeless\",\n\n"
        jsonContent += getIngredientsJSON
        print "Enter ItemID of the item being crafted\n"
        itemID = gets.chomp
        jsonContent += getResultJSON(itemID)
        fullname = itemID.split(":")
        jsonContent += "}"
        name = fullname[1]
        file = File.open("files\\recipes\\#{name}_recipe.json", "w+")
        file.puts jsonContent
        file.close
      else
        print "Please enter a valid input"
      end
    end
  end
end
