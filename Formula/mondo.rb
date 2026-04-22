class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.10"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.10/mondo-0.4.10-darwin-arm64.tar.gz"
    sha256 "a5013b0c7c783099ab92c6d540f9f393687067eb189de716fecb1fbd9bbc3b99"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.10/mondo-0.4.10-linux-arm64.tar.gz"
      sha256 "e44f011f922256ee8aaeb292a658e14a5e6dfa5390d18c39d6489719baf27c3d"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.10/mondo-0.4.10-linux-x86_64.tar.gz"
      sha256 "bbd0e2562a608a87389885885541b640f92b8c668cff8e6568e0084d8f2c132b"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
