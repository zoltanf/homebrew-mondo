class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.10.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.10.0/mondo-0.10.0-darwin-arm64.tar.gz"
    sha256 "999c6de0b605990293e62b2c04b728861f4e77ac7842b62c7ee2c0f6e5a63728"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.10.0/mondo-0.10.0-linux-arm64.tar.gz"
      sha256 "468d7d334df90928a4b29cbcf8ae67e598138f36b0940130ec02cd5f16144c5a"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.10.0/mondo-0.10.0-linux-x86_64.tar.gz"
      sha256 "1d5e06599ff30a45b1870324ac52196505afcdb6621008d2428ef276e9b0ee35"
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
