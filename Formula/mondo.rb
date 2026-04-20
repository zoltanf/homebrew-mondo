class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.0/mondo-0.4.0-darwin-arm64.tar.gz"
    sha256 "75a80f7bb4c12cc0fe6ca95878eec251a5745c3695f5198985575182f6ecdfce"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.0/mondo-0.4.0-linux-arm64.tar.gz"
      sha256 "0accc04e4aa00016b1279f03dea47bb4824cae76ab4eedcfaf57c072b0ea9f91"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.0/mondo-0.4.0-linux-x86_64.tar.gz"
      sha256 "ba461b4110ff9ba9551b14e589c4bf4eecdf46f66c4d11e5b265bd54b2e24498"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
