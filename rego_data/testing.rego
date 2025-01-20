package istio.authz

default allow = false

allow {
  input.method == "POST"
  input.path == "/notify-leader/"
  # Add your custom logic here
}
