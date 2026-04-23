class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.11"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.11/mondo-0.4.11-darwin-arm64.tar.gz"
    sha256 "627d4863a3141b6478706d4ce2823c1ff70b8b80bde152946c1d4d9bbd88b7cc"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.11/mondo-0.4.11-linux-arm64.tar.gz"
      sha256 "cea803eecdcc472feb62f79355ef1e9baa887411b51acef00e3b18b5dbbce308"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.11/mondo-0.4.11-linux-x86_64.tar.gz"
      sha256 "6ee14d1d74c213e0238a1df6e9e8eed349a4ec6c56b705f719ecdfd8ef5e6f35"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
