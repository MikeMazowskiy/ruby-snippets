require 'http'
require 'benchmark'
require 'concurrent-ruby'

class Threads

  def call
    Benchmark.bm do |x|
      x.report("Seq: ") { seq }
      x.report("Threads: ") { threads }
    end
  end

  private

  def seq
    HTTP.get("https://techcrunch.com/wp-json/wp/v2/posts?per_page=100&context=embed").parse
    HTTP.get("https://api.coinbase.com/v2/currencies").parse
    HTTP.get("https://api.nasa.gov/neo/rest/v1/neo/browse?api_key=DEMO_KEY").parse
    HTTP.get("https://rickandmortyapi.com/api/character/108").parse
    HTTP.get("https://open.er-api.com/v6/latest/USD").parse
  end

  def threads
    threads = [
      Thread.new { HTTP.get("https://techcrunch.com/wp-json/wp/v2/posts?per_page=100&context=embed").parse },
      Thread.new { HTTP.get("https://api.coinbase.com/v2/currencies").parse },
      Thread.new { HTTP.get("https://api.nasa.gov/neo/rest/v1/neo/browse?api_key=DEMO_KEY").parse },
      Thread.new { HTTP.get("https://rickandmortyapi.com/api/character/108").parse },
      Thread.new { HTTP.get("https://open.er-api.com/v6/latest/USD").parse }
    ]
    threads.each(&:join)
  end
end

Threads.new.call