require "../models/todo"

# The TodoView provides an object to generate the JSON for the view.
class TodoView

  def initialize(todo : Todo)
    @uid = todo.uid as String
    @title = todo.title as String
    @order = todo.sort as Int32
    @completed = todo.completed as Bool
    @url = "https://todo-backend-kemalyst.herokuapp.com/todos/#{todo.uid}"
  end

  JSON.mapping({
    uid: String,
    title: String,
    order: Int32,
    completed: Bool,
    url: String
  })
  
end
