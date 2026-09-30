class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uagent-harness"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.4.1/uah-1.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "8b902b770cc3025bc98ea72702721bf3c9d47f36b442db5a34d7e4e881a5fb04"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.4.1/uah-1.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "9d5860f5a9dbfcf0125ef538bd17853b58e2f1261267702d179cd3fe245c015e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.4.1/uah-1.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8befa01c8adc0cf35747ac010bfd910c7166620a8101635038fc6032eb95e37b"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.4.1/uah-1.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bcd79ab784a1275a406acdaabe78abb6dd0438913f6c07ae545068534c972e23"
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
