namespace :static do
  desc 'Generate static site in ./out/ directory'
  task generate: :environment do
    Dir.mkdir 'out' unless File.exist? 'out'
    Dir.chdir 'out' do
      `wget -rkpEmnH http://localhost:3000/`
    end

    `rsync -ruv --exclude=.svn/ public/ out/`
  end

  desc 'Run tiny HTTP server from ./out/ directory'
  task server: :environment do
    Dir.chdir 'out' do
      puts 'Started HTTP server at http://localhost:8000/. Press CTRL+C to exit.'
      `python -m SimpleHTTPServer`
    end
  end
end
