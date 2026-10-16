class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.13.1/uah-1.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "8c970ca09caf9f48138e0a4f7d2aadb753e09807e4422dffe1742006bfacc9f8"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.13.1/uah-1.13.1-x86_64-apple-darwin.tar.gz"
      sha256 "312dd2308c40094513b7a681ad332e8f99cf305e8a4de8fa29971d2a1e8d23e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.13.1/uah-1.13.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8d469a3602d797124b52bc9cc2212d26916eea46a79803de364f46b3370ad13"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.13.1/uah-1.13.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41fcfb837610d13ea1ab12a8053110278935bdc1683cf927d6fac79da4dcd874"
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
