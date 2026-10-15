class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.12.2/uah-1.12.2-aarch64-apple-darwin.tar.gz"
      sha256 "3de37acdd5e941f4a5a4a3c64f4fa983d2f73fa96d969f041417cd6cf7e41cd0"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.12.2/uah-1.12.2-x86_64-apple-darwin.tar.gz"
      sha256 "e74f89405e04c17c90ae0ad829c6f68ffd439e94d244fa02322bc00a6dcc347c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.12.2/uah-1.12.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e63b71554e9e04b0b5976454b2c04f224584a1fa06a018c45ca883a1fe7e40c"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.12.2/uah-1.12.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e86bea9b553368de6f3590a0eabf41712438a3a93c89b6d88ebcd440b39b3ff"
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
