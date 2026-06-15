class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.9.2"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.9.2/mondo-0.9.2-darwin-arm64.tar.gz"
    sha256 "685c8da3f378741e1a44efcd9c24d7f5ad2d6bb6bb23feac0e8738c59d63182f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.9.2/mondo-0.9.2-linux-arm64.tar.gz"
      sha256 "8bd2134b42e7a0dc5ded6c6befecee8eff4536ce7a582deeff2e0c388cd86547"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.9.2/mondo-0.9.2-linux-x86_64.tar.gz"
      sha256 "02e651f1f1a92988fc42d84e1a0d4a5a90bb67b064799995e4f582bf839c8be2"
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
