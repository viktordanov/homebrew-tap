class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uagent-harness"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.2.0/uah-1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "f1fa8f50d7ae5c1342249c08629b80520cfdfb3ed137f62ff1aec113234acacf"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.2.0/uah-1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "2221ab7f3deb9d32bd75b2c9103a83f7440297ccc1a414f6e68878bdabf18534"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.2.0/uah-1.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a61affbf686d066cd18480b435b4cb1aa62f4dda8518bf92eb8434af49b22eff"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.2.0/uah-1.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ff502f44495a0ab1180aed1c36afe048054613f3f91605b8898ca8dbfcb74ae"
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
