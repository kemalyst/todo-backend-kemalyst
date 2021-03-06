require "../spec_helper"

describe Todo do
  it "generate a uid" do
    todo = Todo.new
    todo.title = "Test"
    ((todo.uid.as(String)).size > 0).should be_true
  end

  it "updates title from params" do
    params = {"title" => "Test"} of String => HTTP::Server::Context::ParamTypes
    todo = Todo.new
    todo.update(params)
    todo.title.should eq "Test"
  end

  it "updates sort from param order" do
    params = {"order" => "253"} of String => HTTP::Server::Context::ParamTypes
    todo = Todo.new
    todo.update(params)
    todo.sort.should eq 253
  end

  it "updates completed from params" do
    params = {"completed" => "true"} of String => HTTP::Server::Context::ParamTypes
    todo = Todo.new
    todo.update(params)
    todo.completed.should be_true
  end
end

