class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.9.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.9.1/mondo-0.9.1-darwin-arm64.tar.gz"
    sha256 "1552e5e283abbcadc68e10a05c9f871cb3458291a1b38ac0e132b00c448e91c9"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.9.1/mondo-0.9.1-linux-arm64.tar.gz"
      sha256 "9319e808b92ba8a01ae478fd9e3d0c5cc7741e8d890a2690b64740fdf79bc0ec"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.9.1/mondo-0.9.1-linux-x86_64.tar.gz"
      sha256 "84edade97a690791f69fa0035403036029ca02178c3033d47702f0e7ed2315b5"
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
