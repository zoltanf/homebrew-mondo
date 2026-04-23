class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.13"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.13/mondo-0.4.13-darwin-arm64.tar.gz"
    sha256 "2bbf6807f41cfe7e29322ff40a24bac33efb5de53d29c3ff4c93db00ffacbc17"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.13/mondo-0.4.13-linux-arm64.tar.gz"
      sha256 "8d589f29f4d642e0f6a2e89604c1cbda08bd1062facdf2ab4b5492f868b9381c"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.13/mondo-0.4.13-linux-x86_64.tar.gz"
      sha256 "0d5ae72e45de4a8b8687c5519a897649fbf7e5516c4a5e82f55c104afa0fbca5"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
