class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.16.0/uah-1.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "01e65266a42058516bfb18cee0ee671d237935a04ea6062dee1753988dee7532"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.16.0/uah-1.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "b12c17590654e4094ddcffaeb2d45e66894876446dcdc993620a52421fa87ae7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.16.0/uah-1.16.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7ee2c0df76c0764b0b0d3d91263f67faaf72d7ae6a092497839af60eb4f9b9ce"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.16.0/uah-1.16.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "021c2aaa9f3589d8ae6c842edd0d3a8565108fc2aa3c76666d4f5b0470d2ea9d"
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
