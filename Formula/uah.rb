class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.1/uah-1.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "119fc5083138d3344f8f776ab4405c51d020db1fd0dc093b5be90ac722c19c00"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.1/uah-1.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "f8f6e87fde0ae9c13bc3713ba83582e97145b661ea281a7752f14785bad46541"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.1/uah-1.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0ccb928aa24a987dc776563619a89f69b52e67eb636737668af25e721414c1d3"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.1/uah-1.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d00032cf37f29985d79505bd07d4783e242736cae5cf86c3e1bee5d76a090cf"
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
