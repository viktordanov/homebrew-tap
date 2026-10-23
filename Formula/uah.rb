class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.14.2/uah-1.14.2-aarch64-apple-darwin.tar.gz"
      sha256 "0b4c1dcbb2927495933f39791b4c29beebf6e816d2d6847d40abead26ca4810d"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.14.2/uah-1.14.2-x86_64-apple-darwin.tar.gz"
      sha256 "b49573b668d3af37d38c0aac9642d67cfba22b3fe004efe98ddb084e6f738282"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.14.2/uah-1.14.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bae0e12d87253c1ed5cd6f80fb1c7fee149a3909160a3ea91c850ca68644cca1"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.14.2/uah-1.14.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "37957dab473e283e5aa0f6575f18afd32f10c6cee657715a08afb8d66826f3d0"
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
