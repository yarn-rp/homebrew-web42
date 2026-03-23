class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.17/web42-darwin-arm64"
      sha256 "5bd70fbb48c7a53dd8852c73cefb4c98f59d1412661fe32c8e0b97c3c1a379a6"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.17/web42-darwin-x64"
      sha256 "a650badd127c16c7c23c31456cdb59477cb7b6fb275558a541a5af8cf4cf80b3"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.17/web42-linux-x64"
    sha256 "8fa4093289ad6fadaf781a795e96b035fa964554db32a60666e8dbf4eea68053"
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
