class Memoria < Formula
  desc "Keeps project documentation connected to the code it explains"
  homepage "https://github.com/viktordanov/homebrew-tap"
  archive_arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
  url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.5.0/" \
      "memoria-v0.5.0-#{archive_arch}-apple-darwin.tar.gz"
  arm64_sha256 = "7ef20c9bb92bfffa606ffd3535e43a72bdeaae2b7502fb0d210ac8c8af1c2060"
  x86_64_sha256 = "dc362610708eb272f15395b99814e9be3b00381b9d96a437f1e0075dd15fd73e"
  sha256 Hardware::CPU.arm? ? arm64_sha256 : x86_64_sha256
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "memoria"
  end

  test do
    assert_match "memoria 0.5.0", shell_output("#{bin}/memoria --version")
  end
end
