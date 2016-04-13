require "../models/todo"
require "../views/todo_view"

# The TodoController module contains all of the Handlers for each route.  It's
# responsible for looking up the model and passing it to the view to be
# rendered.
module TodoController

  class Index < Kemalyst::Controller
    def call(context)
      todos = Todo.all
      views = todos.map {|todo| TodoView.new(todo) }
      json views.to_json, 200
    end
  end

  class Show < Kemalyst::Controller
    def call(context)
      uid = context.params["uid"]
      if todos = Todo.all("WHERE uid = :uid", {"uid" => uid})
        unless todos.empty?
          view = TodoView.new(todos.first)
          json view.to_json, 200
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
        todo.update(context.params)
        todo.save()
      end
      if todo.id
        view = TodoView.new(todo)
        json view.to_json, 201
      else
        json "Could not create Todo.".to_json, 400
      end
    end
  end

  class Update < Kemalyst::Controller
    def call(context)
      uid = context.params["uid"]
      if todo = Todo.all("WHERE uid = :uid", {"uid" => uid}).first
        todo.update(context.params)
        todo.save
        view = TodoView.new(todo)
        json view.to_json, 200
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


