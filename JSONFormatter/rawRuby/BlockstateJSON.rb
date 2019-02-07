class BlockstateJSON
  def self.makeJSON(modID, blockName)
    return("{\n\t\"variants\": {\n\t\t\"normal\": { \"model\": \"#{modID}:#{blockName}\" }\n\t}\n}")
  end
end
