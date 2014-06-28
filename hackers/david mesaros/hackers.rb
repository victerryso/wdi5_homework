require 'fileutils'

hackers = "Wendy Quek,BIll Searle,David Mesaros,Rosalind Skinner,Larlyn Tanasap,Daisy Smith,Xaun Lopez,Rich Field,Tommy Mitchell,Victerry So,Fai Weiner,Allen Hsu,Amy Neumann,Rira Choi,Yuko Sugiyama".split(',')

hackers.each do |hacker|
	folder_name = hacker.gsub(' ','_').downcase
  FileUtils.mkdir folder_name
  FileUtils.chdir folder_name do
    FileUtils.touch '.gitkeep'
  end
end