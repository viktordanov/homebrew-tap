class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.3/uah-1.7.3-aarch64-apple-darwin.tar.gz"
      sha256 "95f37ed2954c3dd347e4c16510e4d5fb9aa251450c8b74a74fedb8ac4e57599d"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.3/uah-1.7.3-x86_64-apple-darwin.tar.gz"
      sha256 "e2459f25230f158861a4e526cf50c81bb4e4a123ecb5b26862026d40cf00c953"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.3/uah-1.7.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "faf6a54551190d32cbb67200f9831e68bc39cf1078139983319ba8d3c2028946"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.3/uah-1.7.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "916de1837823933f8f31e614eb45d83d584a88bfced2ee73015c977dfbd1d5ea"
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
