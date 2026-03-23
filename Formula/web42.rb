class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.12/web42-darwin-arm64"
      sha256 "b5f6dadad860c2e07c7867c02cf964d1928d6529931880f75479bc4423e6fc6a"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.12/web42-darwin-x64"
      sha256 "bdadab766b57363dc8aa89812167015d1934fbb338a6c69bac988d619b0b9cf3"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.12/web42-linux-x64"
    sha256 "fb99c9359cf9c5617c7f0f5b5e9b43caf87ff4724088e433d5a0ec72ce6a80dc"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
