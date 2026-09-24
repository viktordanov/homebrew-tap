class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uagent-harness"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.0.1/uah-1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "6ff61e98110dc4b14038de8af0b44559dc02f088217e736ce410881fa253cf4c"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.0.1/uah-1.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "0c67ddf52f46fa521f332e4113ce28664bda99ca039493e69249ff1af0ec3931"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.0.1/uah-1.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "07a05056cd5c9e283d09efef450b88d026c277dbef49d1598d3f00508a6102fe"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.0.1/uah-1.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d10dd54dff5bb322262a8ab5b22b51cc70418ae822d1419f2b328ad5fa3e772"
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
