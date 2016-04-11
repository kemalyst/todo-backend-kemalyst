require "../models/todo"

module TodoController

  class HealthCheck < Kemalyst::Controller
    def call(context)
      json %({"results":"Success"}), 200
    end
  end
  
  class Index < Kemalyst::Controller
    def call(context)
      todos = Todo.all
      json todos.to_json, 200
    end
  end

  class Show < Kemalyst::Controller
    def call(context)
      id = context.params["id"]
      if todo = Todo.find id
        json todo.to_json, 200
      else
        json %({"error": "Todo with id:#{id} could not be found"}), 404
      end
    end
  end

  class Create < Kemalyst::Controller
    def call(context)
      if todo = Todo.new
        todo.name = context.params["name"]
        todo.save()
      end
      if id = todo.id
        json todo.to_json, 201
      else
        json %({"error":"Could not create Todo."}), 400
      end
    end
  end

  class Update < Kemalyst::Controller
    def call(context)
      id = context.params["id"]
      if todo = Todo.find id 
        todo.name = context.params["name"]
        todo.save
        json todo.to_json, 204
      else
        json %({"error" => "Todo with id:#{id} could not be found"}), 404
      end
    end
  end

  class DeleteAll < Kemalyst::Controller
    def call(context)
      if Todo.clear
        json "Success".to_json, 200
      else
        json %({"error":"Could not clear Todos"}), 404
      end
    end
  end

end


