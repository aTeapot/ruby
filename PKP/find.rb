require './search'
require 'net/http'
require 'nokogiri'

module Pkp
  class << self
    def find(from = nil, to = nil, &block)
      search = Search.new
      search.from(from) if from
      search.to(to) if to
      search.instance_eval(&block) if block_given?

      url_parts =  search.compile
      html = Net::HTTP.get(*url_parts)
      date = get_date(html)
      puts date.join(" ")
      date
    end

    def method_missing(name, *args, &block)
      match = name.to_s.match(/^from_(\w+)_to_(\w+)/)
      if match
        from = match[1].gsub('_', ' ')
        to = match[2].gsub('_', ' ')
        find(from, to, &block)
      else
        super
      end
    end

    private

    # parse HTML
    def get_date(html)
      doc = Nokogiri::HTML(html)
      date = doc.css(".selected td[data-value]").first["data-value"]
      [date[0..-6], date[-5..-1]]
    end
  end
end
