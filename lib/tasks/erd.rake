desc 'Generating Entity Relationship Diagram'
task :erd do
  system 'erd --inheritance --filetype=pdf --direct --attributes=foreign_keys,content'
end
