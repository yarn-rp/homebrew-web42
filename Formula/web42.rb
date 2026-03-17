class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.4/web42-darwin-arm64"
      sha256 "24f9684723137480e865b58fad33c72ca4cf61bf579d14778ff16d7fd0a411d2"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.4/web42-darwin-x64"
      sha256 "092d4caea1621b373e5f30a6717e0703493b2242ed6c4373f74a51dc0ec530e6"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.4/web42-linux-x64"
    sha256 "b830e2eefd9af2d1f26003f1a7a0a510514e81166bb0660e3c7cbb1d251a4a1b"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
