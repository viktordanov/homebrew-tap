class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.0/uah-1.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "cd35b5fcb826d8297202c8dff8829bdf54a9b6698ab27f339deab361dbe0acd9"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.0/uah-1.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "0dc0531f748497bb0025e2c4a51844034524119362daa54d3e6fa7832fcf9835"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.0/uah-1.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "18951b9a1beefd9450d41e4613c1165d3c240542a32670357ed321f791a549a1"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.0/uah-1.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43069268a9f5601cb769f3455b22870ae6168462d99ed3ddd142732f9d69638e"
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
