class Golf
  def self.method_missing s, a
    k=[]
    case s.to_s[-1]
    when ?1
      a.reduce :*
    when ?2
      a.split.sort_by{|i| i[1] }*' '
    when ?3
      h1 1..a
    when ?4
      a.map { |i| i.
        sub(/(man.*)/,'hat(\1)').
        sub(/(dog.*)\)/,'\1(bone))').
        sub 'cat','dead'
      }
    when ?5
      a.size.times { |i| k += a.each_cons(i+1).to_a }
      k
    when ?6
      f="fizz"
      b="buzz"
      (1..a).map { |s|  s%3 > 0 ? s%5 > 0 ? s : b  : s%15>0 ? f : f+b }
    when ?7
      *r=0
      l,x=a
      m=l
      a.map {|a|
       x ? x=$_ : (m+=1) == a ? r[-1]=[l,a]*'-' : r<<l=m=a
      }
      r
    when ?8
      *i=0,1
      a.times { i << i[-1]+i[-2] }
      i[1..-2]
    when ?9
      b = open(a).map {|e| e.chomp.split ', '}
      g = z b
      while (c,d = g.minmax_by {|e,s| s.size})[0][1].size*2 < b.size
        b.select {|e,| e==c[0]}.map &:shift
        b -= [k]
        g = z b
      end
      d[0]
    when ?z
      a.group_by {|e,| e}
    end
  end
end
