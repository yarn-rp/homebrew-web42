class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.2/web42-darwin-arm64"
      sha256 "99babb2b5a7dc87ca5472e00e65782f8857a3ad44c17d4d9c2aceb592cea87e9"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.2/web42-darwin-x64"
      sha256 "014f35d79167fb6683160621e1cc93d0641b88c7b50603b5f154f4dfe5fe5572"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.2.2/web42-linux-x64"
    sha256 "bd9c8ecbe76b8cca74154d55315e1b4c3fd5cc8bbbfffe9f0c699e50a3112217"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
