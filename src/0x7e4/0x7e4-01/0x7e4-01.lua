#!/usr/bin/env lua

--
-- Advent of Code, 2020
-- Solution to the puzzle posed on Day #1
--

local dataset, target = {}, 2020

for line in io.lines() do
  dataset[#dataset + 1] = tonumber(line)
end

table.sort(dataset)

-- Part I

local low, high = 1, #dataset

while low < high do
  acc = dataset[low] + dataset[high]

  if acc < target then
    low = low + 1
  elseif acc > target then
    high = high - 1
  else break end
end

if acc == target then
  print(dataset[low] * dataset[high])
else
  print("Error: no pair found that adds up to " .. target .. "!")
end

-- Part II

for i = 1, #dataset do
  first_candidate, early_return, high, low = table.remove(dataset, i), false, #dataset, 1
  local local_target = target - first_candidate

  while low < high do
    acc = dataset[low] + dataset[high]

    if acc < local_target then
      low = low + 1
    elseif acc > local_target then
      high = high - 1
    else
      early_return = true
      break
    end
  end

  if early_return == false then
    table.insert(dataset, i, first_candidate)
  else break end
end

if first_candidate + acc == target then
  print(first_candidate * dataset[low] * dataset[high])
else
  print("Error: no triple found that adds up to " .. target .. "!")
end
