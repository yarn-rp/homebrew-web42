class Web42 < Formula
  desc "CLI for the Web42 Agent Marketplace"
  homepage "https://web42.ai"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.2/web42-darwin-arm64"
      sha256 "845a8c6d38bb548f20b8d8c1e25fd8248036237210e945fc13c6a07938921a8d"
    else
      url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.2/web42-darwin-x64"
      sha256 "7b84d9aa3ccd73e389ef302c222fa59a5f11ee03abdf092acb1789a59130b7ab"
    end
  end

  on_linux do
    url "https://github.com/yarn-rp/web42-marketplace/releases/download/cli/v0.1.2/web42-linux-x64"
    sha256 "29449361a6eb7a62caecde9962372071069dfa68fe37b0dbcdf252e68d58afdf"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "web42"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web42 --version").strip
  end
end
