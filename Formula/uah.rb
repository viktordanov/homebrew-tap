class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.12/uah-1.9.12-aarch64-apple-darwin.tar.gz"
      sha256 "bf783f85dd231576246a4e7092068ab33f8b88a0f094323ba210945776550a94"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.12/uah-1.9.12-x86_64-apple-darwin.tar.gz"
      sha256 "03f5be0bd51bef721c46581414f52560d33ba515a4b41bee6fc84b1c2ceec32b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.12/uah-1.9.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2fa75da149fe0eb4c7ae7611180ee3aa289c59165be4c2d512f651363350d077"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.12/uah-1.9.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bc1ea66586aa2e94bd230c7509b3254b6d267ee0ea2df4672b5e0564dfcd152"
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
