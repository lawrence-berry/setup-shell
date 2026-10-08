require 'open3'
require 'tmpdir'

RSpec.describe 'install.sh' do
  root = File.expand_path('..', __dir__)
  INSTALL = "#{root}/install.sh"

  around { |ex| Dir.mktmpdir { |home| @home = home; ex.run } }

  def install(shell)
    out, status = Open3.capture2e({ 'HOME' => @home, 'SHELL' => shell }, INSTALL)
    expect(status).to be_success, out
    out
  end

  def rc(name)
    File.join(@home, name)
  end

  it 'writes only to .zshrc for a zsh user' do
    install('/bin/zsh')
    expect(File.read(rc('.zshrc'))).to include("#{root}/aliases")
    expect(File).not_to exist(rc('.bashrc'))
  end

  it 'falls back to .bashrc for any other shell' do
    install('/bin/bash')
    expect(File.read(rc('.bashrc'))).to include("#{root}/aliases")
    expect(File).not_to exist(rc('.zshrc'))
  end

  it 'adds the line only once when run twice' do
    2.times { install('/bin/zsh') }
    expect(File.read(rc('.zshrc')).scan('# setup-shell').size).to eq(1)
  end

  it 'replaces an outdated setup-shell line and keeps the rest of the file' do
    File.write(rc('.zshrc'), "export KEEP=1\n. /old/path/essentials.sh  # setup-shell\n")
    install('/bin/zsh')
    contents = File.read(rc('.zshrc'))
    expect(contents).to include('export KEEP=1')
    expect(contents).not_to include('/old/path')
    expect(contents.scan('# setup-shell').size).to eq(1)
  end

  { '/bin/zsh' => '.zshrc', '/bin/bash' => '.bashrc' }.each do |shell, file|
    it "loads every alias file in #{File.basename(shell)}" do
      install(shell)
      out, = Open3.capture2e(shell, '-c', ". '#{rc(file)}'; alias be cdutil")
      expect(out).to include('bundle exec').and include('Projects/util')
    end
  end
end
