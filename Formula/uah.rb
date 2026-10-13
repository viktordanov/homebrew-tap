class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.12.0/uah-1.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "17788b3288e8a76af86450d924dc8655e268ff88d87db2c431d100cd28735216"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.12.0/uah-1.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "2cb641788d0a69748d9cac03263e66df2a90bf5734bad8bbdd10d7ecc5f67d16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.12.0/uah-1.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b47803ad6d6d1d0fd34dd3817c2c6919167b538f6309f3333a7441f4de05e785"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.12.0/uah-1.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d10667def6a10121b1e0735dcbf1f405f1c9bd1c0a24f9ca83c5ea85d75088b3"
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
