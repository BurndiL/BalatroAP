

-- this saves a file (without compressing it -> debug purposes)
function save_file(_file, _data)
    NFS.write(_file,_data)
end

-- this loads a file (wihtout uncompressing it -> debug purposes)
function load_file(_file)
    local file_data = NFS.getInfo(_file)
    if file_data ~= nil then
        local file_string = NFS.read(_file)
        if file_string ~= '' then
            return file_string
        end
    end
end

-- debug

function copy_uncompressed(_file)
    local file_data = NFS.getInfo(_file)
    if file_data ~= nil then
        local file_string = NFS.read(_file)
        if file_string ~= '' then
            local success = nil
            success, file_string = pcall(love.data.decompress, 'string', 'deflate', file_string)
            NFS.write(_file .. ".txt", file_string)
        end
    end
end

function tableContains(table, value)
    for i = 1, #table do
        if (table[i] == value) then
            return true
        end
    end
    return false
end
