class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.4"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.4/mondo-0.4.4-darwin-arm64.tar.gz"
    sha256 "b8aca1522939c88a620f2d2ce08c40921f6f8b49f15747550dd9c1f907c6311a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.4/mondo-0.4.4-linux-arm64.tar.gz"
      sha256 "0aace2728fbaee6112bc1bf176adad90cecbcb9f6a4a7c133c55e4becb52b03e"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.4/mondo-0.4.4-linux-x86_64.tar.gz"
      sha256 "ca92379874c64e8b76f7b571f6b7785ea8da54482dcd674c1db9e1f7c38f7f05"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
