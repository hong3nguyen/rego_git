package istio.authz

default allow = false

# Allow all requests to the /public path
allow {
    input.method == "GET"
    input.path = ["public"]
}

# Allow requests if the path is /admin and the role is admin
allow {
    input.path = ["admin"]
    input.role == "admin"
}
