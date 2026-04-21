class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.6"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.6/mondo-0.4.6-darwin-arm64.tar.gz"
    sha256 "fac135f124aeb4c33f26ce633407aeea89586892c7b65b00cb750c0acab4f817"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.6/mondo-0.4.6-linux-arm64.tar.gz"
      sha256 "3e765e61cc0b659c11211cb8280075d4d923119dcbe6e57fa55a271fdb7dc2e4"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.6/mondo-0.4.6-linux-x86_64.tar.gz"
      sha256 "d2776e82175427004df2338bb8eae25219400e34365665b648d514bccd3ae871"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
