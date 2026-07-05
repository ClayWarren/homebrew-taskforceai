# typed: false
# frozen_string_literal: true

cask 'taskforceai' do
  version '0.5.5'

  on_arm do
    url "https://taskforceai.chat/api/download/desktop/macos-arm64/#{version}",
        verified: 'taskforceai.chat/'
    sha256 'd8631ff9537cb13bf44aac23b928d05c1c9b8d1befeac0e363e96678a0111e44'
  end

  on_intel do
    url "https://taskforceai.chat/api/download/desktop/macos-x64/#{version}",
        verified: 'taskforceai.chat/'
    sha256 'c6aadc8ec3cdb1e220b555bac89a3b7cf46283435dd067839dec356cb76286f9'
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
