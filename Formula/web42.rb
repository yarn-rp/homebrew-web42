class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.15/web42-darwin-arm64"
      sha256 "e6bb01e1789d6a5f1139886b42cac0516539f718aac6b73641fd84bb77d82079"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.15/web42-darwin-x64"
      sha256 "13714584095265a39a554ad2068c57607d132d619a348e6e36480d3496113ba8"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.15/web42-linux-x64"
    sha256 "9ee1b7dad12b7c27a0d42a87b2ca3b4a932445e2d5a611a02385093dc262692a"
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
