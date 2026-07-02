class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.12.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.12.1/mondo-0.12.1-darwin-arm64.tar.gz"
    sha256 "5a1ceaa77e5f28c9d7860b52a61a5e7c893411eacc0527cf9111acc1aad4cf7d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.12.1/mondo-0.12.1-linux-arm64.tar.gz"
      sha256 "672b6b04991113e15c70c10a0cea60ceba4938e1c7811daffcd51de0daef0f1f"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.12.1/mondo-0.12.1-linux-x86_64.tar.gz"
      sha256 "2096efc24dff55837070e1f07f235b323ea32e04c7660e0500fea0d507f2bb89"
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
