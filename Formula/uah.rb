class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.3/uah-1.8.3-aarch64-apple-darwin.tar.gz"
      sha256 "e93d6f666f86ca519df3b23c381369b84721c89f0adbac0d44854addf4b10161"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.3/uah-1.8.3-x86_64-apple-darwin.tar.gz"
      sha256 "f9caf264d06528657c8a43fa45867df9b9f49d838f97dd8976637dbcf523220c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.3/uah-1.8.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e537585a8a08322b3e8096cd381f3fd1d5e630b1909c639679c9d3da0d78e81"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.3/uah-1.8.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f598a3b19b6eca4638aa7cb0f41a97ff09b13048dfee0945488584565bbd83c"
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
