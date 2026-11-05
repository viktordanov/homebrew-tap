class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.16.1/uah-1.16.1-aarch64-apple-darwin.tar.gz"
      sha256 "4b22faffd4aa6da9e6cf67caddc5f2151a029474a3cdb02391436bbcf93f43c3"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.16.1/uah-1.16.1-x86_64-apple-darwin.tar.gz"
      sha256 "c1f171a8878bf4f9bb53966b8024c8be9c73c46c4d2b332a3eb6ee7e8d3ca575"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.16.1/uah-1.16.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e683a2d78b67eeb1b9eb51a95ec981e6b7d2b5755c32ccc3822e5990d3b20774"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.16.1/uah-1.16.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f511c4301fb798ddcfcaa2c666e638654a1f0aa78c2f2d0b9164a12d53f7437d"
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
