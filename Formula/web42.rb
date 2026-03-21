class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.4/web42-darwin-arm64"
      sha256 "1d072d5b013127f61feb8d19910ca0ed950b1b44f9457f61c26f4cd8d681a9a1"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.4/web42-darwin-x64"
      sha256 "3b037cb13c9c1efa335266af605cb956621cf216fca91cf5d0e725573b46dfb9"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.4/web42-linux-x64"
    sha256 "5d7ff2a4c4961ca35e23ffee555e703f0e226d20ca68eb21ce5170d604167262"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
