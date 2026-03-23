class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.19/web42-darwin-arm64"
      sha256 "689e2a0f850fc090980e1ee8b6b3af3bcdfd3913ef2facaa7926724adac734d9"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.19/web42-darwin-x64"
      sha256 "a403bf9a833fae9e97166f9d5fa4e32c3894c1a834ee25e3aa0109e220cf3c66"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.19/web42-linux-x64"
    sha256 "fc5b0fa6e0e558e8b282f8d9dddbb49766009c66ed96629e62a0d02772ed7456"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
    bin.install_symlink "web42" => "w42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
