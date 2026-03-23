class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.13/web42-darwin-arm64"
      sha256 "7587a6073f7bb1649d9cf0a4087a08fd0d10727610fbf4636c7a54501ffb0a4d"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.13/web42-darwin-x64"
      sha256 "c2884d4a94da7c78c0a0f08472ca4f023fd4f29a3d8469ce93daa75a4a2e2e56"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.13/web42-linux-x64"
    sha256 "2831bb3650a5a8f08f4bd3c817f25bcbb1161a1c888e4cc6ed4061b0755f92d1"
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
