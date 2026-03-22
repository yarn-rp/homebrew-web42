class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.9/web42-darwin-arm64"
      sha256 "0a05adb398616fbbca59d47ccaeb8cb44f158a821f0af4e4433366b6e8920526"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.9/web42-darwin-x64"
      sha256 "b77818c63494b5c125380056518545752f0727a0a9cda26b7474840800176415"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.9/web42-linux-x64"
    sha256 "d858355d3d7ae86dafdfc58baf0937dede7908ab7978a09747b4aa5f4e1c3014"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
