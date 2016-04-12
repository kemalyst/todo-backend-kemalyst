curl \
  -H "Content-Type: application/json" \
  -X DELETE \
  -d '{}' \
  http://192.168.99.100/todos
curl \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{"title": "Hello"}' \
  http://192.168.99.100/todos

curl \
  -H "Content-Type: application/json" \
  -X POST \
  -d '{"title": "Hello"}' \
  http://127.0.0.1:5000/todos
curl \
  -H "Content-Type: application/json" \
  -X GET \
  http://127.0.0.1:5000/todos
curl \
  -H "Content-Type: application/json" \
  -X PATCH \
  -d '{"title": "Hello2", "order": 2}' \
  http://127.0.0.1:5000/todos
curl \
  -H "Content-Type: application/json" \
  -X DELETE \
  -d '{}' \
  http://127.0.0.1:5000/todos

