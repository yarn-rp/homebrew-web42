class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.7/web42-darwin-arm64"
      sha256 "0033170aad2ef3598e1ed7e14bf28df98d65d0ef33d5cedc856f36d8170cca87"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.7/web42-darwin-x64"
      sha256 "775f4eb3b2d5e07aee2ba26329fd3a5e892ecb07ad0cf21a4a88883dbb24591c"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.7/web42-linux-x64"
    sha256 "29464002827f962417bbd60147f15e0f9d9a45e630e285d1ad14088bbadd6a01"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
