class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.15/web42-darwin-arm64"
      sha256 "0eff7ad8d2ec53843d6eb6b33b828046bdb7050eab5f6fbd42b651b43ac8746b"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.15/web42-darwin-x64"
      sha256 "59fe98cdcdc5462184c3f37caa87b7bb58e60e62b26b0b75fa6b3eb71bf85fda"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.15/web42-linux-x64"
    sha256 "02549afbef17e6022ba649196975adb6495c7cb50ada2d7801d85d47490ae2ad"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
