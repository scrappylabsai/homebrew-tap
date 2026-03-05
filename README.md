# Homebrew Tap for ScrappyLabs

```bash
brew tap scrappylabsai/tap
brew install fleet-daemon
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| `fleet-daemon` | Fleet RPC daemon for multi-machine AI orchestration |

## Running as a Service

```bash
# Set your auth token
export FLEET_RPC_TOKEN="your-token"

# Start as a background service
brew services start fleet-daemon

# Or run in foreground
fleet-daemon -port 9500
```
