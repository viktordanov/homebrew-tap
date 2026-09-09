class Memoria < Formula
  desc "Keeps project documentation connected to the code it explains"
  homepage "https://github.com/viktordanov/homebrew-tap"
  archive_arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
  url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.3.0/" \
      "memoria-v0.3.0-#{archive_arch}-apple-darwin.tar.gz"
  arm64_sha256 = "e4e2eb6776cfe64af8ad4a83d175332a2148846b910ae5cfa79a15e6b1cdad61"
  x86_64_sha256 = "16c0cda3e92952f9d266fd61dccfc78efd16b55966e42ae66d7f02b85582323f"
  sha256 Hardware::CPU.arm? ? arm64_sha256 : x86_64_sha256
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "memoria"
  end

  test do
    assert_match "memoria 0.3.0", shell_output("#{bin}/memoria --version")
  end
end
