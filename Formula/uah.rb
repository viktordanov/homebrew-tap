class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.14/uah-1.9.14-aarch64-apple-darwin.tar.gz"
      sha256 "1a6146ecb8152893120ddd9b60f2d9fc2ed6182072086ca2342cbacda9fa08c0"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.14/uah-1.9.14-x86_64-apple-darwin.tar.gz"
      sha256 "714a20e9d572a47dd199f8f8f56eaf096ef406ab7aa9470a8c47afc81de525d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.14/uah-1.9.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8288b0462d7adc203359f6264fb7eb476cce8cda9d12865971c11e90b18553cd"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.14/uah-1.9.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46680fe623f33994e18c3365df8f8e056e7979d3693d43f1b0e6b8954a36e42c"
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
