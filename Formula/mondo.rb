class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.3.1-rc4"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.3.1-rc4/mondo-0.3.1-rc4-darwin-arm64.tar.gz"
    sha256 "1651891b17c851cdcb139b80ca6c4ea80226291e87cdd6a45a97c4820d482a3c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.3.1-rc4/mondo-0.3.1-rc4-linux-arm64.tar.gz"
      sha256 "99619a831ff256561b0d918dfad6084321a0dd8560a798cead6d5297f42ab426"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.3.1-rc4/mondo-0.3.1-rc4-linux-x86_64.tar.gz"
      sha256 "772e6ec2a1930a457f66e42f9deff3029d342d3b726b95869d5fde4bb1e75f32"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
