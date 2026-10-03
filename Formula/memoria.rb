class Memoria < Formula
  desc "Keeps project documentation connected to the code it explains"
  homepage "https://github.com/viktordanov/homebrew-tap"
  archive_arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
  url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.8.0/" \
      "memoria-v0.8.0-#{archive_arch}-apple-darwin.tar.gz"
  arm64_sha256 = "02946bc7fe12c1ecbd50dc0613bbc476e0914d69c677807f18dfbaaee0bea65b"
  x86_64_sha256 = "268486e93c1546feb2501a1e7c4809f7710790cf4fe07ae9887082b943806f23"
  sha256 Hardware::CPU.arm? ? arm64_sha256 : x86_64_sha256
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "memoria"
  end

  test do
    assert_match "memoria 0.8.0", shell_output("#{bin}/memoria --version")
  end
end
