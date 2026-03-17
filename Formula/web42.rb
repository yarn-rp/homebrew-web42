class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.8/web42-darwin-arm64"
      sha256 "680f54b3f6766c1eee8e1961e5291c04648a1e158d3d04e454c042ec7b071908"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.8/web42-darwin-x64"
      sha256 "5c971cdf179f8cfa60562cc1875076e473a12455fe22476edd4d2fc2108d9b51"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.8/web42-linux-x64"
    sha256 "a522ab1e95b280fa7a3959a2364ffcc55a88ece0c1557cac0bad0c8cac617549"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
