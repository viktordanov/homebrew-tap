class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.14.0/uah-1.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "938fd04f6e7d5336ef38f7ddb6be765ce4343b5748cb1808c506eddea53fd3f4"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.14.0/uah-1.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "0fb61e139ed66ab7ffd4534813caedb779e599e808436ecbbe7f53c2fa65bef3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.14.0/uah-1.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37177628f33f703a08aadddf6e93aff8040c316941dcd98360c842987e7966c7"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.14.0/uah-1.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03a7904a0064c032355a9f9b8c9019720c317100fea94266f884f7c7a9400865"
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
