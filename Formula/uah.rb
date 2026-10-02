class Uah < Formula
  desc "Terminal coding agent that works like Codex, built on unreal-agent"
  homepage "https://github.com/viktordanov/uah"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.4/uah-1.7.4-aarch64-apple-darwin.tar.gz"
      sha256 "f2b61df282aef276eb4749cfde2aa0c413ee4dc1a85ad87154aa84757bee0b1e"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.4/uah-1.7.4-x86_64-apple-darwin.tar.gz"
      sha256 "b2b5ae8ea4aee69f32a7696c8ca726ab9377976051f0e236248e262133b429d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.4/uah-1.7.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4057cf2fe2621f7d2577d3f3f755e1c042e625dd76b0ba8dc9e654aa1373648a"
    end
    on_intel do
      url "https://github.com/viktordanov/uah/releases/download/v1.7.4/uah-1.7.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b538d034fcf25c91ca0d272d20c2247c355ac0bc6f22a291c9f733cc35a7ccfc"
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
