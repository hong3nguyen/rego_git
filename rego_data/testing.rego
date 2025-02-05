package istio.authz

default allow = false

allow {
  input.method == "POST"
  input.path == "/preprocessing-gateway"
  # Add your custom logic here
}
