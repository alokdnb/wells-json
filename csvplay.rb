require 'csv'
require 'json'
require 'elasticsearch'

def parse
  transactions = Array.new

  CSV($stdin) { |csv_in|
    csv_in.each do |row|
      if row.size == 5
        hash = {
        date: row[ 0 ],
        amount: row[ 1 ],
        check: row[ 3 ],
        desc: row[ 4 ]
        }

        transactions << hash
      end
    end
  }
  transactions
end

es = Elasticsearch::Client.new host: '192.168.59.103', log: true

parse.each do |line|
  transaction = JSON.generate line
  es.index index: 'monthly', type: 'transaction', body: transaction
  puts 'Transaction indexed.'
end
