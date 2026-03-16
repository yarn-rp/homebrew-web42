class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.0/web42-darwin-arm64"
      sha256 "a166d6ee145a4377cb8ca1b78681e70bda83c477a3dabe2d057b8ff5a57660c0"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.0/web42-darwin-x64"
      sha256 "9db270b76f26a0f8c649d8b6442d7faaa3cbfdacf4c4072e1452bd47273d2859"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.0/web42-linux-x64"
    sha256 "497f4ef035aacf7ee79e8946e23b5b373fedcbf1836e73a6a1b2ed5db8012ac7"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
