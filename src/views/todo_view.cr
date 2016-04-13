require "../models/todo"

# The TodoView provides an object to generate the JSON for the view.
class TodoView

  def initialize(todo : Todo)
    @uid = todo.uid
    @title = todo.title
    @order = todo.sort
    @completed = todo.completed
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
