class Memoria < Formula
  desc "Keeps project documentation connected to the code it explains"
  homepage "https://github.com/viktordanov/homebrew-tap"
  version "0.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.1.0/memoria-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "36bd0935cb75b121a314c75e18c585e0344766e27a03d2a06604aaf30171ff6e"
  end

  on_intel do
    url "https://github.com/viktordanov/homebrew-tap/releases/download/memoria-v0.1.0/memoria-v0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "f0f6dfb471f0863e0f7d4a7504e1f58e9e9a333a31a5f8a67d45ad1c5f1bbacd"
  end

  depends_on macos: :ventura

  def install
    bin.install "memoria"
  end

  test do
    assert_match "memoria 0.1.0", shell_output("#{bin}/memoria --version")
  end
end
