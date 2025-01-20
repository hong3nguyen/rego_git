package istio.authz

default allow = false

allow {
  input.method == "GET"
  input.path == "/preprocessing/"
  # Add your custom logic here
}
