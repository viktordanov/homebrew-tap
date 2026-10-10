class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.13/uah-1.9.13-aarch64-apple-darwin.tar.gz"
      sha256 "cd5278869eedfd4e9c58b29525369d4418231b3e592ada3aab8b268deb1c7e55"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.13/uah-1.9.13-x86_64-apple-darwin.tar.gz"
      sha256 "07e5dace7e626b93a5ff7179e21ad6b37a6a7b6ae5512e99fb261fbf620e47d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.13/uah-1.9.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "92a08cedd559c203ec8bee93c456db1bab4fe6531ee114b618fa39e9db155e1f"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.13/uah-1.9.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ba0c9ef0a1795cf479120ea5b4d406e6847ee9e9549bb555c9eabbd0042440a"
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
