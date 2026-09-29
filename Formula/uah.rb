class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uagent-harness"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.3.0/uah-1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "f5f8b10901f1d4c09224fe435b39fc36daa8d5d3d9744f77e4a33d8ab38e5ff4"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.3.0/uah-1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "c5b11b418b2e1974d6e69ecc467780f64c08753b53fa9b46c67b16766b76c88e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.3.0/uah-1.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0951557fec104afea2891e85e501fe0449f9389861f5a0491d3b9f034eb79fe7"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.3.0/uah-1.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efea94f7bfb650dc1336dacbd20dfac16239eaac9cb45385190623028cbf955a"
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
