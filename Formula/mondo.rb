class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.6.3"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.6.3/mondo-0.6.3-darwin-arm64.tar.gz"
    sha256 "61ac3170da1972e33cd8637f592122138f3553aaa32344c4dc7be9bd6b77398b"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.6.3/mondo-0.6.3-linux-arm64.tar.gz"
      sha256 "b5789a246fd6fdc6169d6d44256d59124d68c87679b75b5f818cb3152d99b066"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.6.3/mondo-0.6.3-linux-x86_64.tar.gz"
      sha256 "728f1bd260eab957968d2baa7deb92b3c288f5ef6eaada4db0b79a9bd5e8e735"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
