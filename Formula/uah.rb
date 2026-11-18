class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.17.2/uah-1.17.2-aarch64-apple-darwin.tar.gz"
      sha256 "902910de64b115b6adf4acc4231f2d20513743906526585ecbe72aadc7bf1d26"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.17.2/uah-1.17.2-x86_64-apple-darwin.tar.gz"
      sha256 "2e534cd6eb1b18448940a4f49870e9547254ccf8cb3e35f630dfe46379a13d0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.17.2/uah-1.17.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "70361246d3c027355aadf39ae1677fbf19226eb131c3fa11eb24b4595fff52d0"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.17.2/uah-1.17.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0e74dba6f3d9cef5ec0065ec1fa1da4c91a70ff50c17829a60e9ae55b1c3cf1"
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
