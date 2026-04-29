class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.15"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.15/mondo-0.4.15-darwin-arm64.tar.gz"
    sha256 "f6dbbfac08bff875c80d3f408679d44424ba7455c007abf0cbfe659dbbb3c56b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.15/mondo-0.4.15-linux-arm64.tar.gz"
      sha256 "49d5465f8a472b839b287690f1e9545dd7d6e8a44b2a93e38c22674902383d8a"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.15/mondo-0.4.15-linux-x86_64.tar.gz"
      sha256 "9994f7f7f9f06c4cdc553f8d8e0330bfa3766a0667027facabb7c5f8f00f91b0"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
