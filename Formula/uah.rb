class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uagent-harness"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.4.0/uah-1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "5674b0a64b8c3c250af1ab0f579bc2733da463d98c36ce283374519d115f729e"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.4.0/uah-1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "e70a9990145ae502c34e5a54798a2549da3f1c73ea8d659ef8f7c34de8c92009"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.4.0/uah-1.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7781ffb294fe68397371c8715e90f83d7e2aef7ed3fd32bb742955f30b90fb1f"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.4.0/uah-1.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e04944873459bdd654e2e97dd53ddf98d13a63e9f58e1a288d81272e5f3798ca"
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
