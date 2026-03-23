class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.18/web42-darwin-arm64"
      sha256 "218aa53ec2ee32edff746c4858bdcd1cb88127b4490f39a91755176d2d3c3f34"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.18/web42-darwin-x64"
      sha256 "f9c0500b52fa97d7bc93483c03c1fc454133dcd44f1d5d5530125485ca27230b"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.18/web42-linux-x64"
    sha256 "a5844f45772f1014607cde3f76b867fbb2afbfcb9f404cec075e01b2f0ae6ef6"
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
