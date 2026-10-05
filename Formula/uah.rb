class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.4/uah-1.9.4-aarch64-apple-darwin.tar.gz"
      sha256 "336a21b1596e7b7a46c2a65776600efdc0b50c4980c03e1b291dac247e70d7df"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.4/uah-1.9.4-x86_64-apple-darwin.tar.gz"
      sha256 "db86c9c0d81aa5f0c5ef362c2b8087e0a3ffd0faa97cd0c4ba98701919552b0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.4/uah-1.9.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "455ba2651c486fcaa8962e37bc25140a87d5299fa84fdfb717cbf37a9a51a041"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.4/uah-1.9.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "39e4fab39025d401231df5ca77c01b1f427b4d23f9e4f3d6a87aa502cf72bdfc"
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
