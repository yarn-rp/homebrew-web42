class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.3/web42-darwin-arm64"
      sha256 "433db87dec45987863ad8707d1c1a73f549ee48e97b58d78045c6c8b6847e928"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.3/web42-darwin-x64"
      sha256 "877de7eb1186fbdf1d9026e8482693cf2c2ebd24908f4e9e5d80833bd0860af6"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.3/web42-linux-x64"
    sha256 "155af68253818ced03e2a0cda4615a2f92a3e926c153a1c48b306081091e4f40"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
