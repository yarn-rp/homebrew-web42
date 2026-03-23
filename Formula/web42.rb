class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.21/web42-darwin-arm64"
      sha256 "cd8f789f317f3c85c46bf0324facdf6158f5c584ad2daf3721641ecb4fe21abd"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.21/web42-darwin-x64"
      sha256 "0af13058145fce87c8145ba0858c24dc27a1e8e94a73535584da7d44c70112f6"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.21/web42-linux-x64"
    sha256 "e05e8ae0dc887d0f4dbeee1c320c788b4ecb07712f7603c7c39be0cd62c4157c"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
