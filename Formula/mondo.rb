class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.12"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.12/mondo-0.4.12-darwin-arm64.tar.gz"
    sha256 "64a4603c956ae07ce0f5491dcd79b2b0ad14c196733bdfda597965f0168d006d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.12/mondo-0.4.12-linux-arm64.tar.gz"
      sha256 "ae020d49ea6a18be7094c342aa05052747d944a558d46597e5b42ce820d7f99e"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.12/mondo-0.4.12-linux-x86_64.tar.gz"
      sha256 "ba0d28aad7ab6f0c645eef88c3b0e35127f9941819bbb83cde34813aa49c943e"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
