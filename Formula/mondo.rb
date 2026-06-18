class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.9.4"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.9.4/mondo-0.9.4-darwin-arm64.tar.gz"
    sha256 "7d30cf4ac85069095067cdd0a51d9d9e0128e3d90b7628b1426341b524c196bb"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.9.4/mondo-0.9.4-linux-arm64.tar.gz"
      sha256 "8dd6c4f47bde67761be0057409f52481541d91785bbbaefb60fb7b8e0a819b6b"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.9.4/mondo-0.9.4-linux-x86_64.tar.gz"
      sha256 "16eefea8c893633f53ce7d5d3f92a7f9c968a4f5908eae9b8c4ef0f9253ae1bc"
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
