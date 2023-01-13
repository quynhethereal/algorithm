# https://leetcode.com/problems/jump-game/

# Approach 1: Traverse the given num backwards and move the destination 

def can_jump(nums)
    return true if nums.size == 0

    reverse_range = *(0..nums.size - 1).to_a.reverse

    goal = nums.size - 1


    reverse_range.each do |index|
        if nums[index] + index >= goal
            goal = index
        end
    end


    unless goal == 0
        return false
    end

    return true 
end


# Approach 2: Traverse the given num forward and save the maximum jump steps at the previous iteration

def can_jump(nums)
    maximum_jump = 0

    nums.each_with_index do |num, index|
        maximum_jump = [num + index, maximum_jump].max

        p maximum_jump
    end

    return maximum_jump > nums.size - 1
end


nums = [2,3,1,1,4]

# nums = [1,0,0]

p can_jump(nums)
