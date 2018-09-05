namespace :clear_tmp, :environment do
  FileUtils.rm( File.join(Rails.root, 'tmp', 'storage'))
end
