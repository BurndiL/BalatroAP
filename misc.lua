-- fix turning '0' into 'o'
local zeroWasInput = false

local text_input_keyRef = G.FUNCS.text_input_key
function G.FUNCS.text_input_key(args)
    if args.key == '0' then
        zeroWasInput = true
    end

    local text_input_key = text_input_keyRef(args)
    zeroWasInput = false

    return text_input_key

end

local modify_text_inputRef = MODIFY_TEXT_INPUT
function MODIFY_TEXT_INPUT(args)

    if zeroWasInput then
        args.letter = '0'
    end

    local modify_text_input = modify_text_inputRef(args)

    return modify_text_input

end

-- prevent achievements from being unlocked
local unlock_achievementRef = unlock_achievement
function unlock_achievement(achievement_name)
    if isAPProfileLoaded() then
        return
    end
    return unlock_achievementRef(achievement_name)
end

function split_text_to_lines(text, max_word)
    local lines = {}
    local count = 0
    max_word = max_word or 4
    for word in text:gmatch("%S+") do
        if count % max_word == 0 then
            lines[#lines + 1] = ""
        end
        count = count + 1
        lines[#lines] = lines[#lines] .. " " .. word
    end

    return lines
end