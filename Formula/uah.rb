class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.16.2/uah-1.16.2-aarch64-apple-darwin.tar.gz"
      sha256 "ee22287f026ad416cd29c5b171b96ae3de9da9afbd8bb73d24ab55122c491923"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.16.2/uah-1.16.2-x86_64-apple-darwin.tar.gz"
      sha256 "00485429675646e89077f564a213331f803129c452a3f7cb2937ac0648b86d04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.16.2/uah-1.16.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a10c568ffd1eb639130f13e7fad140598489bc826ca352c192a8f9f3ee47fdd6"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.16.2/uah-1.16.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3fe61237bcb541f279783cf99cf21af5d28a68cffd7f742507bc3f337cd8d1b"
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
