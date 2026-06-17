class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.9.3"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.9.3/mondo-0.9.3-darwin-arm64.tar.gz"
    sha256 "ff4a06383cdfd5107fa3812336bd9895ac0a43accca0ad02172bd23c321d6dae"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.9.3/mondo-0.9.3-linux-arm64.tar.gz"
      sha256 "6fa5e103272bc264c0ea0a1089ae0047c43d0d16f7a757e597453a5b4925eb7a"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.9.3/mondo-0.9.3-linux-x86_64.tar.gz"
      sha256 "f162ca49821b6803e63f05b4fab54da8e53a7089061e301ff0cc77a6876a8d95"
    end
  end

  def install
    # Homebrew strips the tarball's single top-level `mondo/`
    # directory, leaving the onedir contents at the stage root.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
