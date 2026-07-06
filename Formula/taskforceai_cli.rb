# typed: false
# frozen_string_literal: true

class TaskforceaiCli < Formula
  desc 'Command-line interface for TaskForceAI'
  homepage 'https://taskforceai.chat'
  version "0.11.12"
  license 'MIT'

  on_macos do
    on_arm do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.12/taskforceai-cli-darwin-arm64.tar.gz"
      sha256 "cd1cd9bef5806bacdcabec4776f3d406fb2a410a3f25e582e5c65fc150b6bf07"
    end
    on_intel do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.12/taskforceai-cli-darwin-amd64.tar.gz"
      sha256 "d2d9dd0f8baac2ef8009bb1eaabb4be870557b8516f9752eba5abcaae5c1d279"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.12/taskforceai-cli-linux-arm64.tar.gz"
      sha256 "9b409683c7a12411e979448c232912c10cce4daf34c60cb7255a5db4a1e31a7c"
    end
    on_intel do
      url "https://github.com/ClayWarren/taskforceai-open/releases/download/v0.11.12/taskforceai-cli-linux-amd64.tar.gz"
      sha256 "ad1c906f5b32ce9ac0084859f655c37ac4d1d20eaab138daa5e2f60385f2b0e3"
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
