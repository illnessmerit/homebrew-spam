# frozen_string_literal: true

# This class represents a Homebrew formula for the spam project.
class Spam < Formula
  url 'https://github.com/8ta4/spam/releases/download/v0.1.3/spam.tar.gz'
  sha256 'ebd70f64170c66be9cb8ea3938f521566e4e815f7f15f39098a0cba77313f705'
  depends_on 'node'
  depends_on 'temporal'
  def install
    libexec.install Dir['*']
    (bin / 'spam').write <<~SHELL
      #!/bin/bash
      exec "#{Formula['node'].opt_bin}/node" "#{libexec}/target/main.js" "$@"
    SHELL
  end
end
