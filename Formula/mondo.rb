class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.9.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.9.0/mondo-0.9.0-darwin-arm64.tar.gz"
    sha256 "4dc5f0a61022b39d7362da4666e11ce26bd39bfd8ba61f5b2f56a337af071b36"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.9.0/mondo-0.9.0-linux-arm64.tar.gz"
      sha256 "3b2d617d3ada7b6f369b337abcdcc7076fa5fd2aa77b5876455299d75c3d6a42"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.9.0/mondo-0.9.0-linux-x86_64.tar.gz"
      sha256 "5e8cd73735bb2b215c89489c48e8255a5dc6ac220b3725ad4202a043867accfe"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
