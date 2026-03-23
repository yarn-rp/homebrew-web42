class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.22/web42-darwin-arm64"
      sha256 "d6bfb80e5a25a9b389aee074e00ae264c46f22eb9ac41b154120b93a15421499"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.22/web42-darwin-x64"
      sha256 "e611a3689305974a47d27c2687097d3d71b2f406e6009989d63c44ed95de5861"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.22/web42-linux-x64"
    sha256 "3f3d2eb46e20f02aaf8accc273e96f2471be2957251c5e3d8c483c3e619af61d"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
