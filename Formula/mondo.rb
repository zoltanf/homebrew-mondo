class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.10.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.10.1/mondo-0.10.1-darwin-arm64.tar.gz"
    sha256 "bc10098711b7a2b06cfe4a5cf1acd89e7b85c1375094a190e0eb9a7a308b38d5"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.10.1/mondo-0.10.1-linux-arm64.tar.gz"
      sha256 "ae4ff8b4f07baa3d81bf94f7f3ac58e6ed701c47584f0f85fc08bc6016669c63"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.10.1/mondo-0.10.1-linux-x86_64.tar.gz"
      sha256 "f76fc9bb4c469c729094e6df7c33e641ffd65cc3f49c51bd62856a8b4775a1af"
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
