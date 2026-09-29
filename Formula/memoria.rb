class Memoria < Formula
  desc "Keeps project documentation connected to the code it explains"
  homepage "https://github.com/viktordanov/homebrew-tap"
  archive_arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
  url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.7.0/" \
      "memoria-v0.7.0-#{archive_arch}-apple-darwin.tar.gz"
  arm64_sha256 = "de4d7af49cbae66bd516bfbe4f4071bb3c6a02d872e69a6091344c5f80bab7a6"
  x86_64_sha256 = "93478fda271d20ad827a154f1dd507d21ffcd322702140cb5e859374ecdc07e6"
  sha256 Hardware::CPU.arm? ? arm64_sha256 : x86_64_sha256
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "memoria"
  end

  test do
    assert_match "memoria 0.7.0", shell_output("#{bin}/memoria --version")
  end
end
