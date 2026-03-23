class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.4/web42-darwin-arm64"
      sha256 "6c95423dd4df6d7ac8e5aea22f2fd911349c7eefa0ffd00bb8751fe2bfde069e"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.4/web42-darwin-x64"
      sha256 "c1b7c02b56c60a5817cb133ff4b0821f79085e3d9237bafc93c51f59ea27e8cc"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.4/web42-linux-x64"
    sha256 "7b9a2e74c5430fc5c70b2f38772e45eef86f5f16b8dd2aa751fdba17faac099a"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
