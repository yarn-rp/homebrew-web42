class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.1/web42-darwin-arm64"
      sha256 "928a623c97a0c6067f063bdecc5b805b5babcc67f6f4ea57c8b914c22377487a"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.1/web42-darwin-x64"
      sha256 "80019e2a71a48218a15518d720933ff9f366dc9ae862fd11d2510c3dde6648f0"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.1/web42-linux-x64"
    sha256 "754e6b4b7572dc237228490ec3b31d369aec6092d443c82760c1f6e03946d25c"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
