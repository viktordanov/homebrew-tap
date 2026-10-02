class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.1/uah-1.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "f1677acf799b7371ffe8653ae24bea0fc002c088bc5ae801fffacec0ce4d42d5"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.1/uah-1.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "d290a59f84ff73d4f8ed5f50d16b161a07908d601dacff4f9f12249d2601ce83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.1/uah-1.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58c11373452e4956262d2576b68513abba52a6e309f4a413178e3a089cb1eaa7"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.1/uah-1.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ad625fa01add66491073d3731256185c2d08ef4dbd4c760aad562991aab8107"
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
