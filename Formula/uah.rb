class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.5.0/uah-1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "de12c85aaecd22c355f4ea1323fd42c4ea36d2b3cc059f1eb4ea70173cbdfd91"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.5.0/uah-1.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "9462ed1281fa102c1d5313de2121278908bab40467fb4f9f7a7c21fad125832e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.5.0/uah-1.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86a234550e42fae2d9a21e8665f88a4ead9f0ca854b05c7d219b7faacfe49ccd"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.5.0/uah-1.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "123d27bd1cef7bae4cbb4627c96bb3793483522d24130ca80ec73e500d7f9667"
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
