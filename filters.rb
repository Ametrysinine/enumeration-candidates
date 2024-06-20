# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  found = nil
  @candidates.each {|c| found = c if c[:id] == id }
  return found
end
  
def experienced?(candidate)
  candidate[:years_of_experience] >= 2
end

  
def github_points?(candidate)
  candidate[:github_points] >= 100
end

def languages?(candidate)
  candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
end

def applied_in_time?(candidate)
  candidate[:date_applied] > 15.days.ago.to_date
end

def age?(candidate)
  candidate[:age] >= 18
end

def qualified_candidates(candidates)
    # Your code Here
  qualified_candidates = candidates.select do |candidate|
    experienced?(candidate) &&
    github_points?(candidate) &&
    languages?(candidate) &&
    applied_in_time?(candidate) &&
    age?(candidate)
  end
end

def ordered_by_qualifications(candidates)
  worst_candidates = candidates.sort_by { |candidate| [candidate[:years_of_experience], candidate[:github_points]]}
  best_candidates = worst_candidates.reverse()
  return best_candidates
end