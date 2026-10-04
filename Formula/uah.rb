class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.5/uah-1.8.5-aarch64-apple-darwin.tar.gz"
      sha256 "39554b060a38e7e389f2c6678649f41f8975a86d5a2134de4b4cacc5aa026d24"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.5/uah-1.8.5-x86_64-apple-darwin.tar.gz"
      sha256 "37582b79c8061925d7011185c549cdafbbe9595135e4a36067063a12a2f216d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.5/uah-1.8.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d5e3af0c1363aea63e378122c01bd75d5d59061ca072b2449040027a48343329"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.8.5/uah-1.8.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d7d4675d4a67ece697baddee02cd828311bdcae873e93bab3825f33df2de0eb"
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
