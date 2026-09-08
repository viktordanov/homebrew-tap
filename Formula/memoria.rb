class Memoria < Formula
  desc "Keeps project documentation connected to the code it explains"
  homepage "https://github.com/viktordanov/homebrew-tap"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.1.0/memoria-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "e1b2ceaf29e733917e106951759f85546f8c1f8f3c4999a6bb98a654ecf86043"
  end

  on_intel do
    url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.1.0/memoria-v0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "bcad21171dd4907123674ea2bdff2793bb7aeb4b00928bd9bc45166f7981637d"
  end

  def install
    bin.install "memoria"
  end

  test do
    assert_match "memoria 0.1.0", shell_output("#{bin}/memoria --version")
  end
end

