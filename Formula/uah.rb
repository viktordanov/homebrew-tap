class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.5.2/uah-1.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "7526e684c104a7a85061d7f2bca0b452a69f02b31d53b0e9392ca9a9e0fd2176"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.5.2/uah-1.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "9c358245ba8980ff7fc78f6edd3fd31181dec5a6b79adcf33ad66e23f8b0d84f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.5.2/uah-1.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eec334d1c6723631a0eeba9aa279bed3f838dc213726d7c3d70bcfe47d0dcf53"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.5.2/uah-1.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "64ce0766a7b74bf76e29d39b2b9e45765b859aa61817639521bb108d8b61541d"
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
