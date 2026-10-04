class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.2/uah-1.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "0841f36535cae895fd98789f130a2c242c17fa4f6031a41441b87ad48d730da3"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.2/uah-1.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "ca9bb1346cc3e9e01b01d040ae2f6283ff404bd7c35b829a4711164100a1ddaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.2/uah-1.9.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1636f9d28b67cb8a0da3ac5bb4016220b060d36d7f942bdf460775b348fd6a5"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.2/uah-1.9.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcc23592b1f9797a3956307795cdc320962b7bfe0fe1969e541ca44ff8d06c15"
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
