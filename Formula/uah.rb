class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.10.0/uah-1.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "8bf53cfef584b88badf8d853fdd9771bbc9aba679f4bbad81a8d97f221b4467d"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.10.0/uah-1.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "9de5bf3ee9740619cc23d1f85f9cf8cfce51c4ae9252ea218f4b940849593d4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.10.0/uah-1.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "55a0aa68d2c335deb1d32bcd49a23428922a726fb6820993ac3d2971598e8ccf"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.10.0/uah-1.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59aa894ea6ab51c4b00a3142caa6fc75c153a0b7792656eae5c90d16623c47e3"
    end
  end

  def install
    bin.install "uah"
    generate_completions_from_executable(bin/"uah", "completion")
  end

  def caveats
    <<~EOS
      uah signs in with your ChatGPT login through the Codex CLI: run `codex login`.
      On Linux, the sandbox needs bubblewrap (bwrap) from your distribution.
      `uah doctor` checks the setup.
    EOS
  end

  test do
    assert_match "uah version v#{version}", shell_output("#{bin}/uah --version")
  end
end
