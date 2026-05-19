class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.7.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.7.1/mondo-0.7.1-darwin-arm64.tar.gz"
    sha256 "81d503812ddcfe9ca245a70106638ae6e09c204dc2aebd637e2a6cd895308491"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.7.1/mondo-0.7.1-linux-arm64.tar.gz"
      sha256 "2591c930080497351953ca02fc2d681bddd35c880cb4d519a8c07bf030d8bf9b"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.7.1/mondo-0.7.1-linux-x86_64.tar.gz"
      sha256 "4c66729931ead97fc27fd24e7c0db705b06c0c356225829b158dae7ff18aa367"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
