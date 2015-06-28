desc 'Run the program...'
task :run do
  sh 'ruby csvplay.rb < ./Monthly.csv'
end

desc 'Initialize/Run Docker ES Container'
task :run_es do
  sh 'docker run -d -p 9200:9200 -p 9300:9300 --name=es  elasticsearch'
end

desc 'Start Docker ES Container'
task :start_es do
  sh 'docker start es'
end

desc 'Stop Docker ES Container'
task :stop_es do
  sh 'docker stop es'
end

desc 'Kill Docker ES Container'
task :kill_es do
  sh 'docker kill es'
end

desc 'Check ES Health'
task :health do
  sh "curl '192.168.59.103:9200/_cat/health?v'"
end
