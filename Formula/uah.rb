class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.8/uah-1.9.8-aarch64-apple-darwin.tar.gz"
      sha256 "bc9410f24308c6a66dadef79e2db2c764afd432c74795e4695a6824fc7423c38"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.8/uah-1.9.8-x86_64-apple-darwin.tar.gz"
      sha256 "ede9705a20ed5390044550946dea65d64c7a2f18d504aff632a4f7ad55482b04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.8/uah-1.9.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8fb09609446c2e08c4d48fbd05a9d40253d10c77f75231639550621ba7ff2fa1"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.8/uah-1.9.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f34965601f99202ded4be58b1cb229ae7771b9d5eccb6dfe5293eced47c5c1e"
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
