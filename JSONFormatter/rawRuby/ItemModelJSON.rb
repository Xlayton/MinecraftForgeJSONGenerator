class ItemModelJSON
  def self.makeJSON(modID, blockName)
    return ("{\n\t\"parent\": \"item/generated\",\n\t\"textures\": {\n" + "\t\t\"layer0\": \"#{modID}:items/#{blockName}\"\n" + "\t}\n}")
  end
end
