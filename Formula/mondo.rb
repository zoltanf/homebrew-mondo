class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.11.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.11.0/mondo-0.11.0-darwin-arm64.tar.gz"
    sha256 "1cf28b3cef104ce864b9bb15e77cddca3edf257c3da235dfc94b5a8477160d94"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.11.0/mondo-0.11.0-linux-arm64.tar.gz"
      sha256 "3555fbca56c758a8178abe5a70cf85a4c2e61a6a67c0f32078dd19060215503d"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.11.0/mondo-0.11.0-linux-x86_64.tar.gz"
      sha256 "cd52b0186d9b32c809cd67599ca31b311b9266d91f26354311052366ebe8d190"
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
