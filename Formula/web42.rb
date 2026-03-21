class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.5/web42-darwin-arm64"
      sha256 "8e9269ac5b201349abf22e1f357066b55faa3c1e7dcdd3bf80e0884bd5b5e16f"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.5/web42-darwin-x64"
      sha256 "130a6cdc1bfb2d2b552163372aa8ffc97cd63adb5e2bed660733b7672589f93e"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.5/web42-linux-x64"
    sha256 "bb4435185989a4dbfdd84f43e2e26c137961bfec17bdaed307e10810deca4ce9"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
