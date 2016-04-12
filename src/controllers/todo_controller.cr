require "../models/todo"

module TodoController

  class Index < Kemalyst::Controller
    def call(context)
      todos = Todo.all
      todos.map {|todo| todo.order = todo.sort; todo.url = "https://todo-backend-kemalyst.herokuapp.com/todos/#{todo.uid}" }
      json todos.to_json, 200
    end
  end

  class Show < Kemalyst::Controller
    def call(context)
      uid = context.params["uid"]
      if todos = Todo.all("WHERE uid = :uid", {"uid" => uid})
        unless todos.empty?
          todo = todos.first
          todo.url = "https://todo-backend-kemalyst.herokuapp.com/todos/#{todo.uid}"
          todo.order = todo.sort
          json todo.to_json, 200
        else
          json "Todo with uid:#{uid} could not be found".to_json, 404
        end
      else
        json "Could not search for Todo".to_json, 400
      end
    end
  end

  class Create < Kemalyst::Controller
    def call(context)
      if todo = Todo.new
        if context.params.has_key? "title"
          todo.title = context.params["title"] as String
        end
        if context.params.has_key? "completed"
          todo.completed = context.params["completed"] as Bool
        end
        if context.params.has_key? "order"
          todo.order = (context.params["order"] as Int64).to_i32
          todo.sort = todo.order
        end
        todo.url = "https://todo-backend-kemalyst.herokuapp.com/todos/#{todo.uid}"
        todo.save()
      end
      if id = todo.id
        json todo.to_json, 201
      else
        json "Could not create Todo.".to_json, 400
      end
    end
  end

  class Update < Kemalyst::Controller
    def call(context)
      uid = context.params["uid"]
      if todo = Todo.all("WHERE uid = :uid", {"uid" => uid}).first
        if context.params.has_key? "title"
          todo.title = context.params["title"] as String
        end
        if context.params.has_key? "completed"
          todo.completed = context.params["completed"] as Bool
        end
        if context.params.has_key? "order"
          todo.order = (context.params["order"] as Int64).to_i32
          todo.sort = todo.order
        end
        todo.url = "https://todo-backend-kemalyst.herokuapp.com/todos/#{todo.uid}"
        todo.save
        json todo.to_json, 200
      else
        json "Todo with id:#{uid} could not be found".to_json, 404
      end
    end
  end

  class Delete < Kemalyst::Controller
    def call(context)
      uid = context.params["uid"]
      if todo = Todo.all("WHERE uid = :uid", {"uid" => uid}).first
        if todo.destroy
          json "Success".to_json, 200
        else
          json "Could not destroy Todo #{uid}".to_json, 400
        end
      else
        json "Could not find Todo #{uid} to destroy".to_json, 404
      end
    end
  end

  class DeleteAll < Kemalyst::Controller
    def call(context)
      if Todo.clear
        json "Success".to_json, 200
      else
        json "Could not clear Todos".to_json, 404
      end
    end
  end
end


