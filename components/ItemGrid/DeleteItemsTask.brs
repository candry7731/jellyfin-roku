sub init()
    m.top.functionName = "setDeleteStatus"
end sub

sub setDeleteStatus()

    task = m.top.deleteTask

    if task = "Delete"
        MarkItemDelete(m.top.itemId)
    end if

end sub
