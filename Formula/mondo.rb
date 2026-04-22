class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.8"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.8/mondo-0.4.8-darwin-arm64.tar.gz"
    sha256 "b2ad76188f0d32b06d5ef626eae9454f912f70cd484c0ff4007351b80afde6b2"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.8/mondo-0.4.8-linux-arm64.tar.gz"
      sha256 "d4ebadd99f18ee036664b4fcfd2afa68dc28ca3f027c6e3c81a64d599424f222"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.8/mondo-0.4.8-linux-x86_64.tar.gz"
      sha256 "453c374003385d295c8138723ca45b55fbe41673a711842fbb84bff9c0726d64"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
