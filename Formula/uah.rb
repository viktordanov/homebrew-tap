class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uagent-harness"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.1.0/uah-1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "b2b4160a5a3a7ec443dfae80714f90fd682c1293d9994b423d55641fe3cee96a"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.1.0/uah-1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "7ca9b29aa742a187c450cf1b89c13e0ad6f092d59c5cf169faf17f589f91a5cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.1.0/uah-1.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b5a48cb89ea9e3c3aa88a43d4d9087332c5f0bddbe55b2ea50150d572ed7bd6"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.1.0/uah-1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cfe1a95387fb2481fb9cc86a6a19c924e73599150166a9c75b8fad381acc0c90"
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
