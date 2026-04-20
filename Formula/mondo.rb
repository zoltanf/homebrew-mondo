class Mondo < Formula
  desc "Power-user CLI for the monday.com GraphQL API"
  homepage "https://github.com/zoltanf/mondo"
  version "0.4.2"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/zoltanf/mondo/releases/download/v0.4.2/mondo-0.4.2-darwin-arm64.tar.gz"
    sha256 "9f7d5257908c4a97be351dae0b230318e42b72fa7b562bb35d96dcb41d8d551a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.2/mondo-0.4.2-linux-arm64.tar.gz"
      sha256 "8dfe93f355662d30f4e5e49fbf9edeeae4722643e2d299bcc66a6ce8997b6e6c"
    else
      url "https://github.com/zoltanf/mondo/releases/download/v0.4.2/mondo-0.4.2-linux-x86_64.tar.gz"
      sha256 "66eb2d319827fcff9d4dcd4b34fa55510d122af7dae8f0c00a0553c7bcab3a63"
    end
  end

  def install
    bin.install "mondo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mondo --version")
  end
end
