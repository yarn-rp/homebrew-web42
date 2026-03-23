class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.23/web42-darwin-arm64"
      sha256 "84b7772c61b1babcbb737ff45385c629273d21e027c7618e131a5ce6e8b0d903"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.23/web42-darwin-x64"
      sha256 "814e78f5c51835d68d6199825669b7c1a5cbdee1f1d2f110415dd8fbba928b26"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.23/web42-linux-x64"
    sha256 "435e952ab8caa561ce7c19d28d541b6b64165da6d2f97a4f7b985f964daa1911"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
