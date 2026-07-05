# typed: false
# frozen_string_literal: true

class TaskforceaiCli < Formula
  desc 'Command-line interface for TaskForceAI'
  homepage 'https://taskforceai.chat'
  version "0.11.11"
  license 'MIT'

  on_macos do
    on_arm do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.11/taskforceai-cli-darwin-arm64.tar.gz"
      sha256 "6621481d4aa3aabe2d666cbf4f033f4394c91ba547e07c2860cf4654803b07a5"
    end
    on_intel do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.11/taskforceai-cli-darwin-amd64.tar.gz"
      sha256 "97c5dad96c6c4342f9c3989ae2809a35cd235082ff2fa51f42d312968aa48665"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.11/taskforceai-cli-linux-arm64.tar.gz"
      sha256 "a5a35745e0922328680761b64a0dfff36bce0d7a1d163b1d18c3e856e7da2ae2"
    end
    on_intel do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.11/taskforceai-cli-linux-amd64.tar.gz"
      sha256 "49e4ab3e5269a88f317c138a0ea6a3a151af6aa3a76fa3d038bc4c40d3d36552"
    end
  end

  def install
    if OS.mac?
      suffix = Hardware::CPU.arm? ? "darwin-arm64" : "darwin-amd64"
    elsif OS.linux?
      suffix = Hardware::CPU.arm? ? "linux-arm64" : "linux-amd64"
    else
      odie "Unsupported platform"
    end

    bin.install "taskforceai-#{suffix}" => "taskforceai"
    bin.install "taskforceai-app-server-#{suffix}" => "taskforceai-app-server"
  end

  test do
    assert_match 'Usage:', shell_output("#{bin}/taskforceai --help")
  end
end
