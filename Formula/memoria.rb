class Memoria < Formula
  desc "Keeps project documentation connected to the code it explains"
  homepage "https://github.com/viktordanov/homebrew-tap"
  archive_arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
  url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.6.0/" \
      "memoria-v0.6.0-#{archive_arch}-apple-darwin.tar.gz"
  arm64_sha256 = "a2cb6fd77a9cdd13a576882444e933fe01afdff0e42c0902aa32c63d89c83e5e"
  x86_64_sha256 = "6630d4dfc7499844dfd62f6aa3a2147d9793edfa4ae883d10272fc07a933d57d"
  sha256 Hardware::CPU.arm? ? arm64_sha256 : x86_64_sha256
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "memoria"
  end

  test do
    assert_match "memoria 0.6.0", shell_output("#{bin}/memoria --version")
  end
end
