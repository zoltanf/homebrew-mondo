class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.3.1-rc3"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.3.1-rc3/mondo-0.3.1-rc3-darwin-arm64.tar.gz"
    sha256 "33713596995ebac37c813c2c7b854cc16d8bbe4c8e2ea54816f0c113ea9e2dc7"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.3.1-rc3/mondo-0.3.1-rc3-linux-arm64.tar.gz"
      sha256 "d1d05cebda7c8ae8adb9cdbb49a46063f0293cd7bd0f7b63294f9c528189d2ef"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.3.1-rc3/mondo-0.3.1-rc3-linux-x86_64.tar.gz"
      sha256 "71608bcbb62775409176f77c190544dee25656fc8698f40882b580650fd437f8"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
