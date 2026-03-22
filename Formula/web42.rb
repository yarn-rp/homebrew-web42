class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.10/web42-darwin-arm64"
      sha256 "d22831ae3dbd96049ca7167e3312db4ce27af34689c2ecf71f15c210d1f89150"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.10/web42-darwin-x64"
      sha256 "c8dd3d279100c96995e67bd577d9a1a0f9d31d5a8da9fd5c612cae2555a288f8"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.10/web42-linux-x64"
    sha256 "860cf579dce5796c7423039d64cb74446d0c612d118ffd7ceed782d782502b54"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
