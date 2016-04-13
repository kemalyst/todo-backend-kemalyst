require "kemalyst"
require "kemalyst/adapter/pg"
require "secure_random"

class Todo < Kemalyst::Model
  adapter pg

  
  def initialize
    @id = nil
    @uid = SecureRandom.uuid
    @title = ""
    @sort = 0
    @completed = false
  end
  
  def update(params)
    if params.has_key? "title"
      @title = params["title"] as String
    end
    if params.has_key? "order"
      @sort = (params["order"] as Int64).to_i32
    end
    if params.has_key? "completed"
      @completed = params["completed"] as Bool
    end
    return true
  end

  sql_mapping({ 
    uid: { db_type: "VARCHAR(255)", type: String },
    title: { db_type: "TEXT", type: String },
    sort: { db_type: "INTEGER", type: Int32 },
    completed: { db_type: "BOOLEAN", type: Bool }
  })

end
