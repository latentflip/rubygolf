class Golf
  class << self
    def hole1 n
      n.inject :*
    end
    def hole2 s 
      s.split.sort_by{|w| w[1]}.join ' '
    end
    def hole3 n 
      hole1 (1..n)
    end
    def hole4 a 
      a.map {|t|
        /(.*)\((.*)\)/ =~ t
        r = $~
        case r[1]
        when "man"
          "hat(#{r[0]})"
        when "dog"
          "dog(#{r[2]}(bone))"
        when "cat"
          "dead(#{r[2]})"
        else
          r
        end
      }
    end
    def hole5 a 
      r = []
      e=a.size
      (1..e).map { |i|
        s = []
        (0..e-1).map { |j|
          s << a[j,i].sort
        }
        r += s
      }
      r.uniq!
    end
    def hole6 a 
      f="fizz"
      b="buzz"
      (1..a).map {|i| i%3 > 0 ? i%5 > 0 ? i : b : i%15>0 ? f : f+b}
    end
    def hole8 n 
      i=[0,1]
      n.times { i << i[-1]+i[-2] }
      i[1..-2]
    end
    def hole9 f 
      v = open(f).map {|e| e.chomp.split ', '}
      l = lambda {|_| _.group_by {|e| e[0]}}
      g = l.call v
      while (a = g.max_by {|e,s| s.size})[1].size < v.size/2.0
        r = g.min_by {|e,s| s.size}[0]
        v.select {|e| e[0]==r}.map &:shift
        v.reject! &:empty?
        g = l.call v
      end
      a[0]
    end
  end
end
