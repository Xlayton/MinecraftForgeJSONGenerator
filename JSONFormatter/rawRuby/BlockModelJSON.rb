class BlockModelJSON
  def self.makeJSON(modID, blockName)
    ("{\n\t\"parent\": \"block/cube_all\",\n\t\"textures\": {\n\t\t\"all\": \"#{modID}:blocks/#{blockName}\"\n\t}\n}")
  end

  def self.makeItemModelJSON(modID, blockName)
    ("{\n\t\"parent\": \"#{modID}:block/#{blockName}\"\n}")
  end
end
