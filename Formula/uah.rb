class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.11/uah-1.9.11-aarch64-apple-darwin.tar.gz"
      sha256 "da3d4cff243d5331a90cc1ea31213dc54e2d58ff41c9d805b102c0b2e7b7b1d7"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.11/uah-1.9.11-x86_64-apple-darwin.tar.gz"
      sha256 "2b7f80420a34018275340f36db50355b4125c4cb8dda224cf9270d1b80ccbf83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.11/uah-1.9.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1cb7d95b719570ac5873453256c25a96c6e3c438adc43c00bf5a35af8f53cc75"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.11/uah-1.9.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "01281c61dce8aa82975c05cd2b9e5a51ef2860cb55629f20fd6574c98dc45dc9"
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
