# typed: false
# frozen_string_literal: true

class TaskforceaiCli < Formula
  desc 'Command-line interface for TaskForceAI'
  homepage 'https://taskforceai.chat'
  version "0.11.10"
  license 'MIT'

  on_macos do
    on_arm do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.10/taskforceai-cli-darwin-arm64.tar.gz"
      sha256 "3821a09442d704c9d8509948f2003366f2544d87ab5a4f897c69e6c07162c420"
    end
    on_intel do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.10/taskforceai-cli-darwin-amd64.tar.gz"
      sha256 "5248ae4ef9105b0148f785f32034544083e11174f24a04c8a209ea3cf2cf43b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.10/taskforceai-cli-linux-arm64.tar.gz"
      sha256 "1ba9cf9d60e854161abb2579ebf5231c4b82e6f693bf3b23f157c6076e70c34b"
    end
    on_intel do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.10/taskforceai-cli-linux-amd64.tar.gz"
      sha256 "72771999eec83c4bb60271855f95bee5273a1804395e98d070141eee9d6ab92d"
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
