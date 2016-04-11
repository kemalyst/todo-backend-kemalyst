require "kemalyst"
require "kemalyst/adapter/pg"

class Todo < Kemalyst::Model
  adapter pg
  
  def initialize(@name)
  end

  sql_mapping({ 
    name: "VARCHAR(255)" 
  })

  JSON.mapping({
    id: (Nil | Int32),
    name: String
  })


end
