class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.0/uah-1.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "cf9f25da40f56fc1196fbacbe615de4c601f3e560965d45f74f1af4a3834e81c"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.0/uah-1.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "0196e712de25c7e1dafb6fce1fbe7ae326022c89a03320130659ed2cbf50ff13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.0/uah-1.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "175193876269c1e5d5b2493229f6a9184911316ecb36010b551ca446fb3e3723"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.0/uah-1.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "64e22d2a0daecd9e2579bf4d5748ed6ac29b4366a7b7a9d06bd13bf050155e17"
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
