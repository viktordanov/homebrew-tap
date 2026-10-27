class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.15.0/uah-1.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "38b04b88ae6b3df0d60ad30c1c916f70ae96151acbd7b70ec57f70fc0e5f4575"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.15.0/uah-1.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "a7e8a787ab6a244208ee7f00cb94aca90653f7a9efa3c5d6bbf82ff6d8bb6fc7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.15.0/uah-1.15.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "676482c2c51a908cb32e123759a75ec7027902357bcd10281cf27e01c4334bba"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.15.0/uah-1.15.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4dfc1dd627e6ff8dbf0ffe74f9da4875b2b4d73d6cb6bed8d5e3b89cdf067c91"
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
