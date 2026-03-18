class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.17/web42-darwin-arm64"
      sha256 "4df64f7ed5b798582a885d4b05064b3145d778ceb92f76dc1c336b71199797f3"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.17/web42-darwin-x64"
      sha256 "5998970aad0ba3e8fd23748fbb3e9fcad47f10307528e8e134b4948e58886ad2"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.17/web42-linux-x64"
    sha256 "0877ad13950e5fc51043d6d651952a28d88d79d545994ffda35a29915115c79c"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
