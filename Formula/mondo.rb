class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.3"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.3/mondo-0.4.3-darwin-arm64.tar.gz"
    sha256 "7bd5b751ade9c097f8e356e1a5cb75fb8589bab179f64455130a4f078f7f4ca2"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.3/mondo-0.4.3-linux-arm64.tar.gz"
      sha256 "eb2d897aa28b7b5023fa7caad27aa3f8ef2a5f6431a0e9305f0d09c2f1f0012c"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.3/mondo-0.4.3-linux-x86_64.tar.gz"
      sha256 "9acf1948b0a5fff7f9aaf4649ec0f2f28428ca88136bb9aa944a7a965761cb19"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
