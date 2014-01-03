require 'pathname'

class Symlink
  def self.all
    Dir['**/*.symlink'].map { |path| new(path) }
  end

  attr_reader :source_pathname

  def initialize(source_path)
    @source_pathname = Pathname.new(source_path).realpath
  end

  def create
    print "#{source_pathname} -> #{destination_pathname} "

    if destination_pathname.exist?
      if destination_pathname.symlink?
        puts '[OK - symlink exists]'
      else
        puts '[FAILED - file exists]'
      end
    else
      destination_pathname.make_symlink(source_pathname)
      puts '[OK - symlink created]'
    end
  end

private

  def destination_pathname
    home_pathname + destination_filename
  end

  def home_pathname
    Pathname.new(ENV['HOME'])
  end

  def destination_filename
    '.' + @source_pathname.basename('.*').to_s
  end
end

puts 'Creating symlinks'
Symlink.all.each(&:create)
