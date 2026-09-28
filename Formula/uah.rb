class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uagent-harness"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.1.1/uah-1.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "4fa7228c47a91f2176d31ab79739c3c27d20812cd413505e347e92994900986f"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.1.1/uah-1.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "a258e5001f99368a71f4d64cb7338b3f2af1a95124b596d817a1d1891377e0d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.1.1/uah-1.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f7e2df4460cd1678709b4f22a3ef3d0f74e3e8b4d5833125c05fe6f4f16a02ec"
    end
    on_intel do
      url "https://github.com/viktordanov/uagent-harness/releases/download/v1.1.1/uah-1.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e61db59985f081a1363f7885f919c22315a75f9cb49912a5860ffda47e5fde1"
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
