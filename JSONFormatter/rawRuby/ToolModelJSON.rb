class ToolModelJSON
  def self.makeJSON(modID, blockName)
    ("{\n\t\"parent\": \"item/handheld\",\n\t\"textures\": {\n\t\t\"layer0\": \"#{modID}:items/#{blockName}\"\n\t}\n}")
  end
end
