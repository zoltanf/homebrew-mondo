class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.6.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.6.1/mondo-0.6.1-darwin-arm64.tar.gz"
    sha256 "ccd120f5b30898d993f3ffb575a6c0c583f55aeda0fa00a32d8d9d10d2cd357f"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.6.1/mondo-0.6.1-linux-arm64.tar.gz"
      sha256 "cb87f0be5f92200fcc0ca44da0a7f3ce0c86c54af7f5c3add807a456e4ce35a2"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.6.1/mondo-0.6.1-linux-x86_64.tar.gz"
      sha256 "fdedfb738120e65a3113baffc5f7b0a10b30c17647ac355498aa368675a41870"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
