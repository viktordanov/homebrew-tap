class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.17.0/uah-1.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "bcf89c22c67d91b85940f4bbc024ec30caff3709e790b7e28fededcd18966ad7"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.17.0/uah-1.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "b3446752883dacb4c2e75973426abc37e57fd1877a0fc4ef97fa3befbfcb707e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.17.0/uah-1.17.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17e8974099d230f939cf8b9aa18d245834ef42caec4b0c2c10aa0cb731b87fa1"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.17.0/uah-1.17.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87007ede4dfaabc416385a45e812afdbe7e267ba23b00e2376efaffb014930ac"
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
