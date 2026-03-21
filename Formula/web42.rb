class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.3/web42-darwin-arm64"
      sha256 "b3ace5350dff241342cc1e6a9698ad8de2068cf2c5b484752ad472478e29d901"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.3/web42-darwin-x64"
      sha256 "d841af2d4f5a3e557bd2e7691e97803b68a146773b15e6658217225201709f9f"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.3/web42-linux-x64"
    sha256 "d1afaf7e9c8c3855f33f97bad9b4ab181bdae33b512dd8fa3d67100d08a0e04e"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
