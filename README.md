Sample ruby scripts
====
### fibonacci
Computes the n<sup>th</sup> Fibonacci number in O(log n) time using matrix formula

http://en.wikipedia.org/wiki/Fibonacci_number#Matrix_form

### mp3
Computes total duration of mp3 files in a given directory.

### PKP

Simple DSL to find PKP connections. Kraków is a default station and so are current time and date.

Examples:

```ruby
Pkp.find do
  from 'Chrzanów'
  to 'Krzeszowice'
  after '12:55'
  date '14.11.14'
end

Pkp.find 'Krynica', 'Muszyna'

Pkp.find do
  to('Poznań').after('10:00')
end

Pkp.from_gdansk_glowny_to_sopot do
  after '14:05'     # block is optional
end
```
