class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.7/uah-1.9.7-aarch64-apple-darwin.tar.gz"
      sha256 "ba4244559c7bdd6644ca631d9cb9a42733d83214814fa0c8851e0fc570d1a67a"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.7/uah-1.9.7-x86_64-apple-darwin.tar.gz"
      sha256 "4d0dc54731a339c619bfa4740f5dc6d0b9298a9b4104b3d95537ae51139e1664"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.7/uah-1.9.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da5a1bf451e15db9cbafc87540598241280ae91bc1f34bd0fad4e309469ea007"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.7/uah-1.9.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "900b78017a66b3a4c23c64ec7189ffe1e529e4365e36ebb40f94ce3b5e684437"
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
