class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.5/uah-1.7.5-aarch64-apple-darwin.tar.gz"
      sha256 "6a68c98cf443136a8455d6c7b31b2b428e0a1e3fc2b59a678992d60dc2e429c2"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.5/uah-1.7.5-x86_64-apple-darwin.tar.gz"
      sha256 "dd6f46203bd65ee283fff46710732308e9a40137a8818b72fd17ffd2862b9cd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.5/uah-1.7.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2eca637749c2ddc79ff1836184c6cc3e0f2338c212a4094dec6dfc5a4089e8c1"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.5/uah-1.7.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "658a75edb624f3f2a9318f0b2591936e049e82a73c0b19674ad5dc646369b7cd"
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
