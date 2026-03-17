class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.6/web42-darwin-arm64"
      sha256 "8c8ce5b813f0fb9fcfd1d0dc39369a2e71f560a7a43fa088bfbd062da6391279"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.6/web42-darwin-x64"
      sha256 "b3e168a2f6941b31d75a241e9903d02d79fbb06b5f31ddbeaaae3ebd1c2f9a67"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.6/web42-linux-x64"
    sha256 "5d45bbc2952efbd03b98c6f4295718dcfd14c1940078214e64dcb3b297b4310d"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
