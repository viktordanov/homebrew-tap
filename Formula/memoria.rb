class Memoria < Formula
  desc "Keeps project documentation connected to the code it explains"
  homepage "https://github.com/viktordanov/homebrew-tap"
  archive_arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
  url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.9.2/" \
      "memoria-v0.9.2-#{archive_arch}-apple-darwin.tar.gz"
  arm64_sha256 = "5bdbf2919a76f9e823c5c947c954f7378f47b71e729b1dcc7a4e08b98aee183c"
  x86_64_sha256 = "209e9321cb79f039c3b1ddab485b39e9b46240b50e6e675dac45da2a10b3f729"
  sha256 Hardware::CPU.arm? ? arm64_sha256 : x86_64_sha256
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "memoria"
  end

  test do
    assert_match "memoria 0.9.2", shell_output("#{bin}/memoria --version")
  end
end
