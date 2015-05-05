class Object
  def to_enumerable
    is_a?(Enumerable) ? self : [self]
  end

   def sum(&block)
     inject(0) { |memo, e|
       v = block ? block.call(e) : e
       v ? memo + v : memo
     }
   end

   def non_nil_count(&block)
     inject(0) { |memo, e|
       v = block ? block.call(e) : e
       v ? memo + 1 : memo
     }
   end

   def ave(&block)
     c = 0
     s = inject(0.0) { |memo, e|
       v = block ? block.call(e) : e
       if v
         c += 1
         memo + v
       else
         memo
       end
     }
     c == 0 ? nil : s.to_f / c.to_f
   end

   def min(&block)
     inject(Float::INFINITY) { |memo, e|
       v = block ? block.call(e) : e
       v ? memo.min(v) : memo
     }
   end

   def max(&block)
     inject(Float::INFINITY.negate) { |memo, e|
       v = block ? block.call(e) : e
       v ? memo.max(v) : memo
     }
   end

   def to_csv
     String.csv(to_a)
   end

   def to_strs
     collect { |e| e.to_s }
   end

   def to_lines
     collect { |e| "%s\n" % e.to_s }
   end

   def print_lines(prefix = nil, do_count = false)
     each_with_index do |e, i|
       printf("%s%s%s\n", prefix ? prefix : '', do_count ? ('[%03d] ' % [i]) : '', e.to_s)
     end
   end

   def count_satisfy
     c = 0
     each { |e| c += 1 if yield(e) }
     c
   end

   def all_satisfy? (&block)
     count_satisfy(&block) == size
   end

   def none_satisfy? (&block)
     count_satisfy(&block) == 0
   end

   def any_satisfy?
     each { |e| return true if yield(e) }
     false
   end



end
