require "../src/controllers/*"

# uncomment the next line to enable Basic Authentication for the whole
# application.  You can specify a specific path and method types if you want
# to limit the Basic Authentication to specific routes.  You can also add the
# BasicAuth to a specific route using an array of handlers.
# all    "/*",                Kemalyst::Handler::BasicAuth.instance("admin", "password")

get    "/",                 TodoController::HealthCheck.instance
get    "/todos",            TodoController::Index.instance
post   "/todos",            TodoController::Create.instance  
get    "/todos/:id",        TodoController::Show.instance
patch  "/todos/:id",        TodoController::Update.instance
delete "/todos",            TodoController::DeleteAll.instance
