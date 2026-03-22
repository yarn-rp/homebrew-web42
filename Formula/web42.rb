class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.11/web42-darwin-arm64"
      sha256 "8775e6d5aa2b028659ae06255cfd546b01e1ff3c116d7bba9a34b5f075f7fa98"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.11/web42-darwin-x64"
      sha256 "b99ada7753f8d9ac6ef3c1587249c9c5e79a98865bdbbae37107613d6407e0a5"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.11/web42-linux-x64"
    sha256 "0fbc9bf2054925e62582d8b2e996a98c67be27a45312886e14bb9adadc78633d"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
