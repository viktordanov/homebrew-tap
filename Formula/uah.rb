class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.17.1/uah-1.17.1-aarch64-apple-darwin.tar.gz"
      sha256 "c9b4ca584bfd6751c8da67b2394b5205d92efa71631071564c1cfa441025f760"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.17.1/uah-1.17.1-x86_64-apple-darwin.tar.gz"
      sha256 "668ce84636e01eaa73a3ed3eb3710f54b2c8b72db5227a1b8557b8d64467a798"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.17.1/uah-1.17.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2a1a819f4c45461ff560f7401b47003f5495e7070820eaefbf663ff661d81af"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.17.1/uah-1.17.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73f10bef848a9f81b1175cb2e18d0b662edd1c58af4f9b2f29e558a73a2da7f4"
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
