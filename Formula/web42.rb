class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.13/web42-darwin-arm64"
      sha256 "6d2f496107de9902b361331f05c20711322349656e5c033a3587ddda969967b9"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.13/web42-darwin-x64"
      sha256 "4551d51cd46328e5e70d4ef8b8bdcbd7b1509c520619c274deb3b4bbd4427133"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.13/web42-linux-x64"
    sha256 "a0efb511a467c43f213d833d61d847b06f761a8c4cc9f4e4bfa896424a4fd157"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
