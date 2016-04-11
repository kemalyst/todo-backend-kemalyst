require "kemalyst"
require "kemalyst/adapter/pg"

class Todo < Kemalyst::Model
  adapter pg
  
  def initialize()
    @id = 0
    @uid = ""
    @title = ""
    @order = 0
    @completed = false
  end

  sql_mapping({ 
    uid: "VARCHAR(255)",
    title: "TEXT",
    order: "INT",
    completed: "BOOL"
  })

  JSON.mapping({
    uid: String,
    title: String,
    order: Int32,
    completed: Boolean
  })


end
