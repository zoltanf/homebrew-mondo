class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.3.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.3.1/mondo-0.3.1-darwin-arm64.tar.gz"
    sha256 "b62e08b15d6526f463784f226a892fd3e068d03a654fcd53f2b7de6ed6cd88a4"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.3.1/mondo-0.3.1-linux-arm64.tar.gz"
      sha256 "903c373932094b90c820d30d09fced8bf9f131bcd6324e81b7522d49b8dda2b9"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.3.1/mondo-0.3.1-linux-x86_64.tar.gz"
      sha256 "61b0a7121704495515aca132d0fbc41d30295458c3c0aeb9936835ea0f15f18b"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
