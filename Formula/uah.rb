class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.6/uah-1.9.6-aarch64-apple-darwin.tar.gz"
      sha256 "1d9869a06f2fb377b618046de74c02fdbd64f401de455caa265ac8d9c6e02ff1"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.6/uah-1.9.6-x86_64-apple-darwin.tar.gz"
      sha256 "485abddba1644559f8e443acd8c6bd7a1c2593b6c58f7951b0bce6c1a52edba0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.6/uah-1.9.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0816aeeef54201b0bb00513d53cebcafef60700ccd9821828466a507ea49ae8"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.6/uah-1.9.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc10237770ec1fdbb182e29121e5ea34de57c2bf985fc6612e7d363b3cbe2702"
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
