class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.0/uah-1.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "5a625011be0e6a0680033f80b0e61b6674ca76c4b25f38730a31e923835fa82c"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.0/uah-1.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "2cd28e4abaedeb5a9b5eb8652b09b0e865b62ef75246d429df8f35557043f3b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.0/uah-1.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd67c1ccb26444a9860bfae9959ac2bab2e29efdbe1f5cbb7f7b8a4667131c4c"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.0/uah-1.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9808fd9e5736990e27f610bc7ff00fbaff0abcbab4035197fbbc0be813fb9c3e"
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
