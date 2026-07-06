# typed: false
# frozen_string_literal: true

cask 'taskforceai' do
  version '0.5.7'

  on_arm do
    url "https://taskforceai.chat/api/download/desktop/macos-arm64/#{version}",
        verified: 'taskforceai.chat/'
    sha256 'abf8676ace1521553bc255dfe27100e819cbd920bdfdc789deaabd20fe1608ee'
  end

  on_intel do
    url "https://taskforceai.chat/api/download/desktop/macos-x64/#{version}",
        verified: 'taskforceai.chat/'
    sha256 '854843cda47f5ca27592007dd1b6547c765befbc51b47362fe8057b000c0673f'
  end

  name 'TaskForceAI'
  desc 'Desktop application for TaskForceAI'
  homepage 'https://taskforceai.chat/'

  auto_updates true

  app 'TaskForceAI.app'

  uninstall quit: 'com.taskforceai.desktop'

  zap trash: [
    '~/Library/Application Support/com.taskforceai.desktop',
    '~/Library/Caches/com.taskforceai.desktop',
    '~/Library/Preferences/com.taskforceai.desktop.plist',
    '~/Library/Saved Application State/com.taskforceai.desktop.savedState',
    '~/Library/WebKit/com.taskforceai.desktop'
  ]
end
