class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.7/web42-darwin-arm64"
      sha256 "bc2502ad444a1062af27f6043440b44cf3dce990fbcb60de40b034f50f246f56"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.7/web42-darwin-x64"
      sha256 "7379edd69c79d68f9ac052f688603404fa22673e1eae9fba5439ee74de345038"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.7/web42-linux-x64"
    sha256 "004e416893dc67e2f78fc899df5114d5797bc2e49a11442310ae6643fbc85325"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
