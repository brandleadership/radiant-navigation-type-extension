namespace :radiant do
  namespace :extensions do
    namespace :navigation_type do
      
      desc "Runs the migration of the Navigation Type extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          NavigationTypeExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          NavigationTypeExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Navigation Type to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[NavigationTypeExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(NavigationTypeExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
