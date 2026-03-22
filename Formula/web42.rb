class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.8/web42-darwin-arm64"
      sha256 "56555d97562f53f3e7f1d6e5dbc02b34b69c748c068939a8c2fbb6cf41fa77b1"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.8/web42-darwin-x64"
      sha256 "7a650319364833eac9da0d070dfd9155b02c00e7dc5ec9f761ffeb94f554a2b6"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.8/web42-linux-x64"
    sha256 "c4274bc2cebd88ae45c1dc130f16572d92a6ba129de6814121c3e2ecf1b77533"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
