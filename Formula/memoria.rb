class Memoria < Formula
  desc "Keeps project documentation connected to the code it explains"
  homepage "https://github.com/viktordanov/homebrew-tap"
  archive_arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
  url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.2.0/" \
      "memoria-v0.2.0-#{archive_arch}-apple-darwin.tar.gz"
  arm64_sha256 = "01ac9bad62db5fa786795c89521e5127e812bea3f3d044572bc92afbfb330890"
  x86_64_sha256 = "f4a73d1eede3ffd184c0d80c7c4415ebcf4e3c0ee7470a323e96884cbf3a4354"
  sha256 Hardware::CPU.arm? ? arm64_sha256 : x86_64_sha256
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "memoria"
  end

  test do
    assert_match "memoria 0.2.0", shell_output("#{bin}/memoria --version")
  end
end
