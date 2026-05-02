class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.5.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.5.0/mondo-0.5.0-darwin-arm64.tar.gz"
    sha256 "65828fc4e4428f4dadfec0bf2fcc0f1241c10f0473783700d52407ce9ff88a04"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.5.0/mondo-0.5.0-linux-arm64.tar.gz"
      sha256 "53fa2ba2e5e6a1e30ed56b9fd41446f82a0f207ff7dcb2bf2178401850d58211"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.5.0/mondo-0.5.0-linux-x86_64.tar.gz"
      sha256 "3f6557ce9e756cbd1f7972830e8e74ed2e32accfe02c38d0dac5287127864015"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
