

-- this saves a file (without compressing it -> debug purposes)
function save_file(_file, _data)
    love.filesystem.write(_file,_data)
end

-- this loads a file (wihtout uncompressing it -> debug purposes)
function load_file(_file)
    local file_data = love.filesystem.getInfo(_file)
    if file_data ~= nil then
        local file_string = love.filesystem.read(_file)
        if file_string ~= '' then
            return file_string
        end
    end
end