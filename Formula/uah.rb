class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.11.0/uah-1.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "a5ab1451bd5b279955b1df9dd71c397ae8b56315a36c2a10527624d32eb91d6a"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.11.0/uah-1.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "5b12ed8f38de04079a87ae8514d9539fc345cecc55566b78725b18a4c05bf08e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.11.0/uah-1.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d6584a5e196eb2cf2089763ee826d7e966e9b599523ff067dd2b1d608d8c288c"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.11.0/uah-1.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f783cf55acca321210852911fbc86eece6ffab5a1b495a6f8df71fda4712711c"
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
