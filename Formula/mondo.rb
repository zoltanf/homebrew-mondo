class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.1/mondo-0.4.1-darwin-arm64.tar.gz"
    sha256 "1db6a1a23c9faf80aa653378fe5ccdcf25087e45b75c9db4a790d749297915c2"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.1/mondo-0.4.1-linux-arm64.tar.gz"
      sha256 "5b76fb532572a60f157a8e648bd2fcb43b991289f8c5762f07727944fdcd9d32"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.1/mondo-0.4.1-linux-x86_64.tar.gz"
      sha256 "306f159d8683c1841fdede75c3e341e102e2a6063ba6cda0f70f6b5dd1289d1e"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
