class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.7.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.7.0/mondo-0.7.0-darwin-arm64.tar.gz"
    sha256 "464f462f0ed2802cf763f37f3240a93bcc761a7a855a3c5d5901dc981961f962"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.7.0/mondo-0.7.0-linux-arm64.tar.gz"
      sha256 "ccbb55509cbfaa840e0761dfce855031d289299c3917f65e3e31c9e8b6e98b2e"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.7.0/mondo-0.7.0-linux-x86_64.tar.gz"
      sha256 "5601bdc77a2c9d201588a5ada72224eb3176347a1ecb81e3f7dcb9830a1fa3a5"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
