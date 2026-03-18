class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.16/web42-darwin-arm64"
      sha256 "503f249b16ed399a610ff77476aae06e26df2017ed16b46715e23ddb9c24a29b"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.16/web42-darwin-x64"
      sha256 "3c0728abbaf546f696fc93cb6be4e47a297ff6325805f2d6d09c919a2c3383bd"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.16/web42-linux-x64"
    sha256 "e838a1ca554bb5457b776a254c82d831511381053b507cbab43e722092be715e"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
