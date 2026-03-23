class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.20/web42-darwin-arm64"
      sha256 "f81807011158a9c5377891c7f512f6c84d54e7fa862e18d4b96685582aa11b76"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.20/web42-darwin-x64"
      sha256 "8bb73fb7f2fef0893a4c888535dacf4f9cdcd8313cdf508ed533ff6afb8a9cce"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.20/web42-linux-x64"
    sha256 "9852b3d473e719cda79eeb3ac58547ddb97045a6655f7717aefa0db6209a8ecf"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
    bin.install_symlink "web42" => "w42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
