class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.5.3/uah-1.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "1323b00d16cb3df4dde93e45c85ecd6729aec23df695a82d322e7e76d88d9f0c"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.5.3/uah-1.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "5cbd58998d0a2e744eb9c9a34b0f77de5a104de29afe1d798fe53109f15b2af8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.5.3/uah-1.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7fe51f396b8d081364bbab25cabb5b3bda9cc41a2f6c9dded8f8b9c48e413b78"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.5.3/uah-1.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "48fe641b1fcd968719925b42d82d7d52095545a785163b9a8cb8b8cfc9459fc9"
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
