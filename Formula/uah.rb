class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.14.1/uah-1.14.1-aarch64-apple-darwin.tar.gz"
      sha256 "8c19655c0feb12fca632bf09e834d5df423ff3ee1f5a73c7de2d08f70b257315"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.14.1/uah-1.14.1-x86_64-apple-darwin.tar.gz"
      sha256 "1a0a46e3a84189a55c3044d235a10cbafed24251bb96a818bddd91dd6f88b6a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.14.1/uah-1.14.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b40f9a9410a484510027cacee24fce3828c167fac3c769e4766acc1fc8f7223"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.14.1/uah-1.14.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "16349ed02febc3a1609ee0c444bc202cd0db32fceba95473ed8219f3585e5c2c"
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
