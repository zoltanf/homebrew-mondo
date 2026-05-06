class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.6.2"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.6.2/mondo-0.6.2-darwin-arm64.tar.gz"
    sha256 "59f9be6f469cba67cbb916991693beba08b675785ed1faa48e912d49cf28a5df"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.6.2/mondo-0.6.2-linux-arm64.tar.gz"
      sha256 "484d65bd90d8ecbd9d27c3aef1c498c696c05540acfada31c2da2d07c7702b99"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.6.2/mondo-0.6.2-linux-x86_64.tar.gz"
      sha256 "793d56cd9557ea15fabecf86cc7fbadafa3746a19e55529361fbbb25d6030fe5"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
