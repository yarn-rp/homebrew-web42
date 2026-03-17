class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.11/web42-darwin-arm64"
      sha256 "4df8b8d6c09b85cfa5fff50732294c3f4e2d5182167882891f05e9944ed4cb0d"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.11/web42-darwin-x64"
      sha256 "a16b2399a06e7e285e2c1a4e0f36567b9f3339be10d8ecc3801fb2568a643e1d"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.11/web42-linux-x64"
    sha256 "2d295871fdf5f42ec7b80ca1e2d3d0630b3b7e320c9396ce7ab4925a7ba17f79"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
