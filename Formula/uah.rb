class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.9/uah-1.9.9-aarch64-apple-darwin.tar.gz"
      sha256 "7c1daf7aa80b64285dc5b99486d92cfc6c3e785132081f2941fa91eb84be1da9"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.9/uah-1.9.9-x86_64-apple-darwin.tar.gz"
      sha256 "5eb5cf7e6af74ebec4932e0729eaa4b974566ac753fed8d8cff1a00d601c2374"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.9/uah-1.9.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "112e36ebd891d548c2b3ed7f1717321542af4cfd536342720f696543d74eeb6f"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.9.9/uah-1.9.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8fc802b93403ea2c29a15688d6fabe2e1bbb5cf31e6ffcee3385d3da30eaf3f"
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
