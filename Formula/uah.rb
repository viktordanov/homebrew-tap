class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.5/uah-1.9.5-aarch64-apple-darwin.tar.gz"
      sha256 "72897ce153398fb2a968d5e86d074d2993ae54169946b5f826fcb631fc0035fa"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.5/uah-1.9.5-x86_64-apple-darwin.tar.gz"
      sha256 "7cc5511b5cbd31d3fd94311813956e68ec969da74d00170d78c7910950b79516"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.5/uah-1.9.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b12ff6c1d349cac593963998dc12138a20411023966858a93418762ee1b0477"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.5/uah-1.9.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "97b68d59b831190de65994fec467ab9b7f806dfb64df8466fa1690f9b73f9dd9"
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
