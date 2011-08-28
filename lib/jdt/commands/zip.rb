require 'thor'
require 'zip/zip'
require 'zip/zipfilesystem'

module Jdt

  class CLI < Thor
    include Thor::Actions

    desc "zip [name][path]", "creates a zip file with the specified name form the data found in the specified path"

    def zip (name, path)
      if (Dir.exists?(path))
        if (name.end_with?(".zip"))
          zip_file = "#{path}/../#{name}"
        else
          zip_file = "#{path}/../#{name}.zip"
        end
        if (File.exists?(zip_file))
          say "The zip file still exists, choose another name."
        else
          Zip::ZipFile.open(zip_file, Zip::ZipFile::CREATE) { |zos|
            create_zip_help(zos, path, "")
          }
        end
      else
        say "Please select an existing path"
      end
    end

    desc "create_zip_help [zos] [path] [dir]", "help method for a recursive run through the directory tree;
                                needs the variable for the ZipFile, the current path and
                                the directory structure in the zip file (first call = \"\")"

    def zip_help (zos, path, dir)
      Dir.chdir(path) do
        Dir.glob("*").each do |file|
          if (File.directory?(file))
            if (dir.eql?(""))
              zos.mkdir("#{file}")
              create_zip_help(zos, File.absolute_path(file), "#{file}")
            else
              zos.mkdir("#{dir}/#{file}")
              create_zip_help(zos, File.absolute_path(file), "#{dir}/#{file}")
            end
          else
            if (dir.eql?(""))
              zos.add("#{file}", File.absolute_path(file))
            else
              zos.add("#{dir}/#{file}", File.absolute_path(file))
            end
          end
        end
      end
    end
  end

end
