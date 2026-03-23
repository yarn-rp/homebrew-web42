class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.3/web42-darwin-arm64"
      sha256 "6d8bfe0d764f9b6679c059be717a1d07b7c850d60ddc9f560a882d6ed1ecb10e"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.3/web42-darwin-x64"
      sha256 "faa979cbcbc15e67bc834db4d8700532b9be1ff6971d693084a061e9204a9109"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.3/web42-linux-x64"
    sha256 "2e1611979b621885909fd932fb1825948a918391a34214672742ff18236b199a"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
