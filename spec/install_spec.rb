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

  # Fakes `uname -s` so both platforms can be tested on either.
  def faked_uname(os)
    bin = File.join(@home, 'bin')
    Dir.mkdir(bin) unless Dir.exist?(bin)
    File.write("#{bin}/uname", "#!/bin/sh\necho #{os}\n")
    File.chmod(0o755, "#{bin}/uname")
    { 'PATH' => "#{bin}:#{ENV['PATH']}" }
  end

  def rc(name)
    File.join(@home, name)
  end

  it 'writes only to .zshrc for a zsh user' do
    install('/bin/zsh')
    expect(File.read(rc('.zshrc'))).to include("#{root}/load.sh")
    expect(File).not_to exist(rc('.bashrc'))
  end

  it 'falls back to .bashrc for any other shell' do
    install('/bin/bash')
    expect(File.read(rc('.bashrc'))).to include("#{root}/load.sh")
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

    it "picks the right exporthistory for #{File.basename(shell)}" do
      install(shell)
      out, = Open3.capture2e(shell, '-c', ". '#{rc(file)}'; alias exporthistory")
      expect(out).to include(shell.end_with?('zsh') ? 'fc -W' : 'history -w')
    end

    it "decodes URLs with urldecode in #{File.basename(shell)}" do
      install(shell)
      # Aliases only expand from a script file, and bash needs expand_aliases outside an interactive shell.
      script = File.join(@home, 'urldecode.sh')
      File.write(script, "[ -n \"$BASH_VERSION\" ] && shopt -s expand_aliases\n. '#{rc(file)}'\necho 'a%20b+c%2Fd' | urldecode\n")
      out, = Open3.capture2e(shell, script)
      expect(out).to eq("a b c/d\n")
    end
  end

  it 'loads only the aliases for the current platform' do
    install('/bin/bash')
    out, = Open3.capture2e(faked_uname('Linux'), '/bin/bash', '-c', ". '#{rc('.bashrc')}'; alias sagi; alias freespace")
    expect(out).to include('apt-get install')
    expect(out).not_to include('diskutil')

    install('/bin/zsh')
    out, = Open3.capture2e(faked_uname('Darwin'), '/bin/zsh', '-c', ". '#{rc('.zshrc')}'; alias sagi; alias freespace")
    expect(out).to include('diskutil')
    expect(out).not_to include('apt-get')
  end
end
