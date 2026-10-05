class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.3/uah-1.9.3-aarch64-apple-darwin.tar.gz"
      sha256 "3cf36d284287eb149d28ac920e64737d5a03754774521974508b3b4d1cce6972"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.3/uah-1.9.3-x86_64-apple-darwin.tar.gz"
      sha256 "f04a7f95748080b0de0a9ea7bf8f2f81b2a40bed64b9568fc76fe0012a8f4c34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.3/uah-1.9.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e4b2bdec40f87558d0d21bc7af493c439381bfb79104eec3e13cd28dbe52e6eb"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.3/uah-1.9.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "397dbc47bd5a8106bed127bc200438309b90c2920fcb23c599faf892af26c614"
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
