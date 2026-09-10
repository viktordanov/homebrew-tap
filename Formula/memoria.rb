class Memoria < Formula
  desc "Keeps project documentation connected to the code it explains"
  homepage "https://github.com/viktordanov/homebrew-tap"
  archive_arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
  url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.4.0/" \
      "memoria-v0.4.0-#{archive_arch}-apple-darwin.tar.gz"
  arm64_sha256 = "0eb089d402135bebd639271c90402905bf6a143abc22b1f8b0d0cff7908171dd"
  x86_64_sha256 = "bd59c218860c6b71760ca27f5a0982214e53fee42cc9ba01f448d3390accc861"
  sha256 Hardware::CPU.arm? ? arm64_sha256 : x86_64_sha256
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "memoria"
  end

  test do
    assert_match "memoria 0.4.0", shell_output("#{bin}/memoria --version")
  end
end
