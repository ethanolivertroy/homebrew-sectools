class KevsTui < Formula
  desc "Terminal UI for browsing CISA Known Exploited Vulnerabilities (KEV)"
  homepage "https://github.com/ethanolivertroy/kevs-tui"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ethanolivertroy/kevs-tui/releases/download/v0.1.1/kevs-tui-darwin-arm64"
      sha256 "9bfe5b8e525e64dc21cda47cc1b66b9180f861032938e582a298017a229e5d0b"
    else
      url "https://github.com/ethanolivertroy/kevs-tui/releases/download/v0.1.1/kevs-tui-darwin-amd64"
      sha256 "137664f6c8bfa3a0728ca5c7dbe9fff2144d6cbe62ac0f3fab3b5572bcfd953f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ethanolivertroy/kevs-tui/releases/download/v0.1.1/kevs-tui-linux-arm64"
      sha256 "aef75b12b051744c8d92bc3980b8de7850881195f9bd91edfc0df96917210207"
    else
      url "https://github.com/ethanolivertroy/kevs-tui/releases/download/v0.1.1/kevs-tui-linux-amd64"
      sha256 "913a5cf70235ae8f407bc90569ccbe7d543770f83202a0c05f63f7978aefadf3"
    end
  end

  def install
    binary_name = Dir["*"].first
    bin.install binary_name => "kevs-tui"
  end

  test do
    assert_match "KEV", shell_output("#{bin}/kevs-tui --help 2>&1", 1)
  end
end
