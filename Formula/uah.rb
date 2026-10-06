class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.10/uah-1.9.10-aarch64-apple-darwin.tar.gz"
      sha256 "63c285235eb0f4d9e0a778b5302aa9cbccf361541fc295d9afca9affcd1e82b9"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.10/uah-1.9.10-x86_64-apple-darwin.tar.gz"
      sha256 "cfe7fa69347e233455b02cbdb7ee446fccf28ca94009d7163ea1c728ee7bf273"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.10/uah-1.9.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "010f8035324e7719933a34af9d53847389c235b0d29db588b92f0568b312c7f5"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.10/uah-1.9.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b604fd290d636a195fe978a3577cc2de8bf595159c3ff84ebc370e250a4502f"
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
