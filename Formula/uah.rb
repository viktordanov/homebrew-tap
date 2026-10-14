class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.12.1/uah-1.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "61488955beb47b69fe80e280604f5bf9bad46744e8ba2e88bc073d6eb1ae40bf"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.12.1/uah-1.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "61d0a96b55b6ee5b815af324592f6e74e0ef737eeac0ca94d467cc3eecce70b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.12.1/uah-1.12.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ef3b03245ec4e84adbbb21a8431fb86f00d2645034cf65d2d8237d717598094a"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.12.1/uah-1.12.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac5140efa6b574938a385210f7faff7bed70e0aaface87818730d1d84c08cbf2"
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
