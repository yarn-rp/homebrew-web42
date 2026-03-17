class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.9/web42-darwin-arm64"
      sha256 "7e928f9950e89a7a2a08ae1f885321e13d56153f2dad9152bd1408fe454db1d8"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.9/web42-darwin-x64"
      sha256 "8996a39404692b998611e1c21bd59cfd7a19322f43e608ac979e40337278c238"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.9/web42-linux-x64"
    sha256 "e3120757a3f1eef1bcad33042cf5f94bb79e87beb9748b79c6e30e9a598537e8"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
