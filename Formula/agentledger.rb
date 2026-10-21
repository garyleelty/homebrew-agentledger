class Agentledger < Formula
  desc "Local-first cost ledger for AI coding agents — tokens and dollars from their own local logs"
  homepage "https://github.com/garyleelty/agentledger"
  url "https://github.com/garyleelty/agentledger/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "d189fd04f93d0828045d0e88b14a749b1f4361f54e1ec4a265e119c2b54d73a9"
  license "MIT"
  head "https://github.com/garyleelty/agentledger.git", branch: "main"

  depends_on "node"

  def install
    # The tool is plain Node with no build step, so the whole program is the
    # entry point plus the three modules it imports. Homebrew wants the
    # program in libexec and symlinks in bin; the entry point finds its
    # siblings through `new URL('../package.json', import.meta.url)`, so the
    # layout has to keep package.json one level above bin/.
    libexec.install "package.json"
    libexec.install "bin"
    libexec.install "src"
    bin.install_symlink libexec/"bin/agentledger.js" => "agentledger"
    bin.install_symlink libexec/"bin/agentledger.js" => "aledger"
  end

  test do
    assert_match "agentledger", shell_output("#{bin}/agentledger --help")
    # The version comes from package.json, so this also proves the libexec
    # layout is right: a broken layout prints 0.0.0-unknown.
    assert_equal "0.5.0", shell_output("#{bin}/agentledger --version").strip
  end
end
