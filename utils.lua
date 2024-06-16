

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

function tbl_contains(list, value)
    for _, v in pairs(list) do
        if v == value then
            return true
        end
    end
    return false
end
