class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.2/uah-1.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "461dd13f0158528c43f6f11d08eddb9bcb0d3be715a92d58324edc25e202037f"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.2/uah-1.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "a08610a31038cf12c6089d86a33dc4fe87c154d63d0f60e5cc9b9bc356348ae6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.2/uah-1.8.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a983e9f8f1897401ea08af282a91f51ab10300bbc9ec5741a867d9eda89576f2"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.2/uah-1.8.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a10291bb7672b60585b6042fb95aa95ca04424e54d92474b15fcb1509050aaf"
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
