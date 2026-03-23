class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.14/web42-darwin-arm64"
      sha256 "cdb5687630819887044bf4bb8cc74a617f6a8cb918d6ee67a28405406a4df8f9"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.14/web42-darwin-x64"
      sha256 "2df370044101be3ef3d7392c05823e9fda8bcfc5df7f53d318167e84bef50e1c"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.14/web42-linux-x64"
    sha256 "f3bf52a4afbd572581be4e6cac62c087aea78f1f3bed5b31387668f6c1850b24"
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
