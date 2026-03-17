class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.14/web42-darwin-arm64"
      sha256 "24c8bd51dec97b94df305d216457166e93be7fab70658d695c538ccfe1edcc70"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.14/web42-darwin-x64"
      sha256 "c5b589c476795f6e5917c7a24ef4b774e151e86b951b1018991f6fd5da91a698"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.14/web42-linux-x64"
    sha256 "e0e661b58e1c756ff80a9aa616c980b48e2a1061e67b3a4f5688acb02193ef54"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
