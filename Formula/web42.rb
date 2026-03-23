class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.16/web42-darwin-arm64"
      sha256 "4722e2c278869acd628b94e04c07d399f4628de173ffd77e2161903083f337b1"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.16/web42-darwin-x64"
      sha256 "27fd1b513e227df1a983971576cc030bba4b9c2641ce15ddc1b974eca3b72665"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.16/web42-linux-x64"
    sha256 "62a5a8a961b9e849cb27166a874366ac7897f1815c842d20002b93e1edbc5724"
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
