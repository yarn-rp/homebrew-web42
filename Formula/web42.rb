class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.6/web42-darwin-arm64"
      sha256 "038a5534179c6459fad8ffd376c5ff7409367eb787d2a36905055a8e5248f31e"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.6/web42-darwin-x64"
      sha256 "580d13e59d222e10a8c9d587eb57c35a527ff88a5bcf70d235e7992518f9332c"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.6/web42-linux-x64"
    sha256 "1ed8c8c1a89ae773588ef1a387a5b4e27fa357558d35b185c606974a167bc740"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
