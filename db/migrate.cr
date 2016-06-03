require "kemalyst"
require "../src/models/*"

Todo.migrate
Todo.prune

