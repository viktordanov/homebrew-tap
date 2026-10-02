class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.2/uah-1.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "4947088a3a781d8275f666312eb7d53af25164603e1749ca598a0dd90dd287ff"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.2/uah-1.7.2-x86_64-apple-darwin.tar.gz"
      sha256 "f8041be278765e29ff851500dcf33e7ddde55dce872e1f7c75a3647d881122e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.2/uah-1.7.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "593a3f6787ed7d5e171bf1d56287798af4e178ec26424622f0164faa06f30a7c"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.2/uah-1.7.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "522db928717bde37c91c0b63a0aa8e4aee06dfdee03d894f2b20179709283ca4"
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
