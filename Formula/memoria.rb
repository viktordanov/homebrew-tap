class Memoria < Formula
  desc "Keeps project documentation connected to the code it explains"
  homepage "https://github.com/viktordanov/homebrew-tap"
  archive_arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
  url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.1.0/" \
      "memoria-v0.1.0-#{archive_arch}-apple-darwin.tar.gz"
  version "0.1.0"
  arm64_sha256 = "36bd0935cb75b121a314c75e18c585e0344766e27a03d2a06604aaf30171ff6e"
  x86_64_sha256 = "f0f6dfb471f0863e0f7d4a7504e1f58e9e9a333a31a5f8a67d45ad1c5f1bbacd"
  sha256 Hardware::CPU.arm? ? arm64_sha256 : x86_64_sha256
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "memoria"
  end

  test do
    assert_match "memoria 0.1.0", shell_output("#{bin}/memoria --version")
  end
end
