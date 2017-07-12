# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)
  return [] if intervals.empty?

  intervals = intervals.sort_by { |interval| interval.start }

  merged = []
  current = nil
  
  intervals.each do |interval|
    if !current
      current = interval
    elsif current.end >= interval.start
      current = Interval.new(current.start, [current.end, interval.end].max)
    else
      merged << current
      current = interval
    end
  end

  merged << current

  merged    
end