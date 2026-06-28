class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.12.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.12.0/mondo-0.12.0-darwin-arm64.tar.gz"
    sha256 "0bb499ac9aa3966d8a4ecad0ec3d44b0516efcb200ecb3296ef7ac22fe644c4c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.12.0/mondo-0.12.0-linux-arm64.tar.gz"
      sha256 "baac7011664c66362c51923cd632028e39a95b497f5c48384b13cee2f2c2ce91"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.12.0/mondo-0.12.0-linux-x86_64.tar.gz"
      sha256 "15eba9ed14b1586e267e260fdc8a8df0b69ecb714f749656130a3ed71c5da707"
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
