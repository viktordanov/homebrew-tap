class Memoria < Formula
  desc "Keeps project documentation connected to the code it explains"
  homepage "https://github.com/viktordanov/homebrew-tap"
  archive_arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
  url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.9.1/" \
      "memoria-v0.9.1-#{archive_arch}-apple-darwin.tar.gz"
  arm64_sha256 = "4105bc15180711295f4f21c253306b28f6fe7e068e6d65da95d989ced985b4c5"
  x86_64_sha256 = "f71ad58cdf2290aeefbd58a01719886f5b2d34e38df2063297ad5226b4db71db"
  sha256 Hardware::CPU.arm? ? arm64_sha256 : x86_64_sha256
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "memoria"
  end

  test do
    assert_match "memoria 0.9.1", shell_output("#{bin}/memoria --version")
  end
end
