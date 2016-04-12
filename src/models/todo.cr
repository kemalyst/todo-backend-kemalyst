require "kemalyst"
require "kemalyst/adapter/pg"
require "secure_random"

class Todo < Kemalyst::Model
  adapter pg
  @id = 0
  @uid = SecureRandom.hex(32).to_s
  @title = ""
  @priority = 0
  @completed = false
  
  def initialize()
  end

  sql_mapping({ 
    uid: { db_type: "VARCHAR(255)", type: String },
    title: { db_type: "TEXT", type: String },
    priority: { db_type: "INTEGER", type: Int32 },
    completed: { db_type: "BOOLEAN", type: Bool }
  })

  JSON.mapping({
    uid: String,
    title: String,
    priority: Int32,
    completed: Bool
  })


end
