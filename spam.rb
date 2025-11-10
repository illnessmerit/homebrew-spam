# frozen_string_literal: true

# This class represents a Homebrew formula for the spam project.
class Spam < Formula
  url 'https://github.com/8ta4/spam/releases/download/v0.1.1/spam.tar.gz'
  sha256 'c43c39d344494ad07778bd2fdbb4820b95dea1dd185d7383c020f9073c7fbea3'
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
