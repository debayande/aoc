#!/usr/bin/env lua

--
-- Advent of Code, 2020
-- Solution to the puzzle posed on Day #2
--

local passwordfile, correct_password_count = {}, 0

for line in io.lines() do
  passwordfile[#passwordfile + 1] = line
end

-- Part I

for i = 1, #passwordfile do
  -- FIXME: figure out how to split long lines in Lua.
  for min_count, max_count, character, password in string.gmatch(passwordfile[i], "(%d+)-(%d+) (%a): (%a+)") do
    _, actual_count = string.gsub(password, character, "")
    if tonumber(min_count) <= actual_count and actual_count <= tonumber(max_count) then
      correct_password_count = correct_password_count + 1
    end
  end
end

print(correct_password_count)

-- Part II

correct_password_count = 0

for i = 1, #passwordfile do
  local match_count = 0
  -- FIXME: figure out how to split long lines in Lua.
  for start_offset, end_offset, character, password in string.gmatch(passwordfile[i], "(%d+)-(%d+) (%a): (%a+)") do
    if string.char(string.byte(password, tonumber(start_offset))) == character then
      match_count = match_count + 1
    end

    if string.char(string.byte(password, tonumber(end_offset))) == character then
      match_count = match_count + 1
    end

    if match_count == 1 then
      correct_password_count = correct_password_count + 1
    end
  end
end

print(correct_password_count)
