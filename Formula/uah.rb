class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.6.1/uah-1.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "962155bf4d55400d70d446ad40a9884b665a0ce4c8473744b896325b6fcf5cb2"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.6.1/uah-1.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "befe4c1a91e9349896da3b88af1fb04eaf6ca8d7e754e037c8c5d05746766b41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.6.1/uah-1.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8874ba30aed38bf72f6a317fb50af342bc6e323d6e2cbdf3891192e2c6ec3b57"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.6.1/uah-1.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7b3cef585d033d1458ad615d9f7bf4955669d85dc2a5b8ba9658e4f3c8f1c7e"
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
