class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uagent-harness"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.0.2/uah-1.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "64112b7e11a2f057702b10574be690c27bc9b9a13297ac11f91528e358fe6730"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.0.2/uah-1.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "594249c1a549e13944b25dc28968224c27d6cb200ce3360adb417a5aa0434c2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.0.2/uah-1.0.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "50ed0104fb1e82b90ca7f299d9d028be2c88ef31e3f06a85df70316c5fca5d4a"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.0.2/uah-1.0.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "617ab6d196cb4c2bd03e1d492ae1bf9969b71ea3bf7cb845661514eaffdea2de"
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
