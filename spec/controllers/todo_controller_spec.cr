require "../spec_helper"

Mocks.create_mock Todo do
  mock self.all, :inherited
  mock self.all(query, param), :inherited
  mock self.clear, :inherited
  mock instance.save(), :inherited
end

describe TodoController::Index do
  it "returns all the Todos in JSON" do
    todo = Todo.new
    todo.title = "Test"
    allow(Todo).to receive(self.all).and_return([todo])

    request = HTTP::Request.new("GET", "/todos")
    io, context = create_context(request) 
    response = TodoController::Index.instance.call(context).as(String)
    response.should contain "Test"
  end
end

describe TodoController::Show do
  it "returns specific Todo in JSON" do
    todo = Todo.new
    todo.title = "Test"
    allow(Todo).to receive(self.all("WHERE uid = :uid", {"uid" => todo.uid})).and_return([todo])

    request = HTTP::Request.new("GET", "/todos/#{todo.uid}")
    io, context = create_context(request) 
    context.params["uid"] = todo.uid.as(String)
    response = TodoController::Show.instance.call(context).as(String)
    response.should contain "Test"
  end
end

# describe TodoController::Create do
#   it "creates and returns Todo" do
#     allow(Todo).to receive(save()).and_return(true)

#     request = HTTP::Request.new("Post", "/todos")
#     io, context = create_context(request)
#     context.params["title"] = "Test"
#     response = TodoController::Create.instance.call(context)
#     response.should contain "Test"
#   end
# end

describe TodoController::DeleteAll do
  it "returns specific Todo in JSON" do
    allow(Todo).to receive(self.clear).and_return(true)

    request = HTTP::Request.new("DELETE", "/todos")
    io, context = create_context(request) 
    response = TodoController::DeleteAll.instance.call(context).as(String)
    response.should contain "Success"
  end
end

