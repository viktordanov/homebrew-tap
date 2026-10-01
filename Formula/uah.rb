class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.6.0/uah-1.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "e287d749ddeee9bdc3a4d764fe0ef99a54f93e999b3e34d90ee839728546b3bb"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.6.0/uah-1.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "8ca4df67543a41e5ed30ebe03115dea05b0f51c3ffdd0d5ecb1c87d75bd6cee0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.6.0/uah-1.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "44816f11ab5230914380e10ea97b6b8f7f37c63c6265babe3f3ab650c4d9bb1a"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.6.0/uah-1.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79d52cea6ef9502e75068827efbe9559cb0fe702921f89b91bd659f104767669"
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
