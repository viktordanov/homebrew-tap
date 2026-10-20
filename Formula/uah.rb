class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.13.2/uah-1.13.2-aarch64-apple-darwin.tar.gz"
      sha256 "246ad5d29120d05630e4d423557cda51d0fbdf6871c68b30af07db0b15030dd4"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.13.2/uah-1.13.2-x86_64-apple-darwin.tar.gz"
      sha256 "9d8bc87c3d9bf5438de69f1b124ccc5f702ffbeab30421ceea1cbc90e5fe4366"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.13.2/uah-1.13.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9532e2b74e6f65c83b81fd11b549a68673c854648e95e1615f90b63fc1347ab6"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.13.2/uah-1.13.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8ac7a3830704d179da13b201b2d19699fdf91ab5a2c336e03233c9260ebc39b"
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
