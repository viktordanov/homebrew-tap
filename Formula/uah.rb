class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.4/uah-1.8.4-aarch64-apple-darwin.tar.gz"
      sha256 "4423fca45e51c2b40887941138d61f9f61a0f16a966015dc3a22e837396bbafe"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.4/uah-1.8.4-x86_64-apple-darwin.tar.gz"
      sha256 "28dd7afab5c01fdec93edd9e67a733b2f9ea044610a38434bb0b0f55d099ac9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.4/uah-1.8.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6d3256341258011c95684a70247a81dc11f4b1c810b3b4d1991d6e621bbc8c6"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.4/uah-1.8.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c2fe2347242565deee9fa3ec028c3521ae512c23bc1ae0fa0dc46e053085e19b"
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
