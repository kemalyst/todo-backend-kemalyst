require "kemalyst"
require "kemalyst/adapter/pg"

class Todo < Kemalyst::Model
  adapter pg
  
  def initialize()
    @id = 0
    @name = ""
  end

  sql_mapping({ 
    name: "VARCHAR(255)" 
  })

  JSON.mapping({
    id: Int32,
    name: String
  })


end
