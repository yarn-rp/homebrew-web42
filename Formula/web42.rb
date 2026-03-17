class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.10/web42-darwin-arm64"
      sha256 "00cc6190f9d4f60b2ee22c41073238ce52cadc28f8d3823b89020ad7e88b6cad"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.10/web42-darwin-x64"
      sha256 "a0ea80e0a84ccaac33fa5ae171d9368c864ebd41102a9a34862f9bbe9660a417"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.10/web42-linux-x64"
    sha256 "b2f8bcf2b67eae550a25f0b473c736612bbe1406aa83d8e994e9c12b73f721e3"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
