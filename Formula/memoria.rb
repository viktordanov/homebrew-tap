class Memoria < Formula
  desc "Keeps project documentation connected to the code it explains"
  homepage "https://github.com/viktordanov/homebrew-tap"
  archive_arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
  url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.9.0/" \
      "memoria-v0.9.0-#{archive_arch}-apple-darwin.tar.gz"
  arm64_sha256 = "e21f83b10cdb666a8d76bc53102d41b1f3c842083492bc5fced1f4b1bea54463"
  x86_64_sha256 = "b61825f242e93f86b309eeb2be9181cf941782bfd94a167a3a1dfbaf910397ff"
  sha256 Hardware::CPU.arm? ? arm64_sha256 : x86_64_sha256
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "memoria"
  end

  test do
    assert_match "memoria 0.9.0", shell_output("#{bin}/memoria --version")
  end
end
