# typed: false
# frozen_string_literal: true

class TaskforceaiCli < Formula
  desc 'Command-line interface for TaskForceAI'
  homepage 'https://taskforceai.chat'
  version '0.11.8'
  license 'MIT'

  on_macos do
    on_arm do
      url 'https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.8/taskforceai-cli-darwin-arm64.tar.gz'
      sha256 '249e39646e1d01b44d5249b9a5b919298102852191c493fc9921b7e8cb079796'
    end
    on_intel do
      url 'https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.8/taskforceai-cli-darwin-amd64.tar.gz'
      sha256 '9d2420614abf98480af1bf9bc52abd214ae27e938af8abc93648fca9b3f9abed'
    end
  end

  on_linux do
    on_arm do
      url 'https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.8/taskforceai-cli-linux-arm64.tar.gz'
      sha256 '1b395c63d5fd1b804d97648a75dce592a4a1c3121c2f77539cdc0081b7aca5e5'
    end
    on_intel do
      url 'https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.8/taskforceai-cli-linux-amd64.tar.gz'
      sha256 '52d78673ffaf1cdbdf5b7152dab3093682c663b80453671f8df9d062cb2af552'
    end
  end

  def install
    if OS.mac?
      suffix = Hardware::CPU.arm? ? 'darwin-arm64' : 'darwin-amd64'
    elsif OS.linux?
      suffix = Hardware::CPU.arm? ? 'linux-arm64' : 'linux-amd64'
    else
      odie 'Unsupported platform'
    end

    bin.install "taskforceai-#{suffix}" => 'taskforceai'
    bin.install "taskforceai-app-server-#{suffix}" => 'taskforceai-app-server'
  end

  test do
    assert_match 'Usage:', shell_output("#{bin}/taskforceai --help")
  end
end
