class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.5"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.5/mondo-0.4.5-darwin-arm64.tar.gz"
    sha256 "b0969389719b13ab408870d0b46b38a00655128be0c7b77fa8dfc7acc058e714"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.5/mondo-0.4.5-linux-arm64.tar.gz"
      sha256 "a8e28a44de71474419237640b8e27a0aecad4c12616864c14297407c49c777d9"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.5/mondo-0.4.5-linux-x86_64.tar.gz"
      sha256 "ce0388968bc6d97e7c7a4b2b02327a75061cdff88be83f871cf6ec6591817105"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
