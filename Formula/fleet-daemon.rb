class FleetDaemon < Formula
  desc "Fleet RPC daemon for multi-machine AI orchestration"
  homepage "https://github.com/scrappylabsai/fleet-rpc"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/scrappylabsai/fleet-rpc/releases/download/v#{version}/fleet-daemon_#{version}_darwin_arm64.tar.gz"
      # sha256 will be filled after first release
    end
    on_intel do
      url "https://github.com/scrappylabsai/fleet-rpc/releases/download/v#{version}/fleet-daemon_#{version}_darwin_amd64.tar.gz"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/scrappylabsai/fleet-rpc/releases/download/v#{version}/fleet-daemon_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      url "https://github.com/scrappylabsai/fleet-rpc/releases/download/v#{version}/fleet-daemon_#{version}_linux_amd64.tar.gz"
    end
  end

  def install
    bin.install "fleet-daemon"
  end

  service do
    run [opt_bin/"fleet-daemon"]
    keep_alive true
    log_path var/"log/fleet-daemon.log"
    error_log_path var/"log/fleet-daemon.log"
    environment_variables FLEET_RPC_TOKEN: "changeme"
  end

  test do
    assert_match "fleet-daemon", shell_output("#{bin}/fleet-daemon -version")
  end
end
