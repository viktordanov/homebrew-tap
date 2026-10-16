class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.13.0/uah-1.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "905ed15103624192de1264b1e2a9c56d6cbcdcc97b990b20f655852f7d10f4ba"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.13.0/uah-1.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "a4cca2046c6246266b687c4e3a9228b9710a5f2ab886cdb598dffbee8bacb865"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.13.0/uah-1.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c62102d1e23d5484142d184ffa4f601334e1561c16457427044c33dfc7964fe"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.13.0/uah-1.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d93aedc7e4fd90676e901a62512360bc504cb3adb71105af61b778dc09bdbcf"
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
