# can define in different structure
package drone.data.sharing

# Default deny all data transfers
default allow := false

# Define domain mappings
domains := {
    "domain1": ["drone1", "drone2"],
    "domain2": ["drone3", "drone4"],
    "domain3": ["drone5", "drone6"]
}

# Helper function to get drone's domain
get_drone_domain(drone_id) := domain {
    some domain, drones in domains
    drone_id in drones
}

# Rule for same domain data sharing
allow {
    # Get the source drone's domain
    source_domain := get_drone_domain(input.drone_id)
    
    # Get the target server's domain
    target_domain := input.target_server.domain
    
    # Allow if source and target domains match
    source_domain == target_domain
}

# Rule for cross-domain data sharing
allow {
    # Verify cross-domain permission exists
    some permission in input.permissions
    
    # Check if permission is valid
    permission.source_drone == input.drone_id
    permission.target_domain == input.target_server.domain
    permission.status == "approved"
    
    # Verify permission hasn't expired
    permission.expiry_time > time.now_ns()
}

# Example input structure
sample_input := {
    "drone_id": "drone1",
    "target_server": {
        "domain": "domain2",
        "server_id": "server2"
    },
    "permissions": [
        {
            "source_drone": "drone1",
            "target_domain": "domain2",
            "status": "approved",
            "expiry_time": "2025-02-01T00:00:00Z"
        }
    ]
}
