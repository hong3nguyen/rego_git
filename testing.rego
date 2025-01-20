package istio.authz

default allow = false

allow {
  input.method == "POST"
  input.path == "/preprocessing/"
  # Add your custom logic here
}
