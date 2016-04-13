require "../spec_helper"

describe TodoView do
  it "should generate JSON from a Todo Model" do
    todo = Todo.new
    todo.title = "Test"
    view = TodoView.new(todo)
    view.to_json.should contain "Test"
  end
end
