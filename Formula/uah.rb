class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.1/uah-1.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "bf59af2cbee29eea274326a5f799830da82b4dc537cf1f64563ec8c6a778b00d"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.1/uah-1.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "f49c53eb4d5607874067d63e085e9bc13996a0edbef61e7da35c7ae8c1d3715d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.1/uah-1.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "07b50dbcb8950ca7177aeeb10c862deff8b5d77efad8c5b48e396f82dd469c44"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.1/uah-1.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "649af0fc9a4b7dba874ef5e761568dee210bf0c579bb062dc53c9f6bd60a8fee"
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
