class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.8.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.8.0/mondo-0.8.0-darwin-arm64.tar.gz"
    sha256 "8da1bfdaaf8d9c373a7fac6a053bc76cf577179216fe1561726aa4f97b3412e8"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.8.0/mondo-0.8.0-linux-arm64.tar.gz"
      sha256 "f486418d6aeaf3dc081612dc15f9cf9f3c33f7007af7cfbd13a753d3936394a4"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.8.0/mondo-0.8.0-linux-x86_64.tar.gz"
      sha256 "86e25feced9fcbb582668406d289291a715db92b89bad562d993cc4e78810970"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
