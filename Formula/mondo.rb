class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.14"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.14/mondo-0.4.14-darwin-arm64.tar.gz"
    sha256 "fa06dd60aacf5373fdc2bf80d07554a1e44ddcce839777b792257ca4a0e00c94"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.14/mondo-0.4.14-linux-arm64.tar.gz"
      sha256 "9479e0fc9e03e9e4a375a9d24e38dd16dfc7ac7d7d92f68e5777f4b247e677a8"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.14/mondo-0.4.14-linux-x86_64.tar.gz"
      sha256 "937c877d7ca4a66e65268f025e90a265bd8491e4aa18c485a38bc0ae73a7d9b9"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
