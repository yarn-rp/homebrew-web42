class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.12/web42-darwin-arm64"
      sha256 "2e1c4fad2f510c127abd263ca5c3e1c512b28ce51c292f328aa7b348948f9c37"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.12/web42-darwin-x64"
      sha256 "34521d4ebdb1de0b96ef7d9410cd124fc33d6eb75bcec13d5e2525f5fee61bcf"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.12/web42-linux-x64"
    sha256 "b2d2bedb4d1a2aa47c95e0939a99655ff247c7174f46fb5b8940ebdfe3cfc7d1"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
