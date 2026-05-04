class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.6.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.6.0/mondo-0.6.0-darwin-arm64.tar.gz"
    sha256 "d9682a32620998ba53677495ef889bd2ada3c8415d490ae5ed01f4911e90a44c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.6.0/mondo-0.6.0-linux-arm64.tar.gz"
      sha256 "7ed585c1374c5358f1fa07f24b3a4e23b474fb2024107646b1db2380aa8fbcd1"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.6.0/mondo-0.6.0-linux-x86_64.tar.gz"
      sha256 "309c1f64204e8990d2a9a7711f301d3959f657fbbd3b436e7e2f9cc9d5ce5f0d"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
