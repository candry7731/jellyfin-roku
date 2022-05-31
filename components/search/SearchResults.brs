sub init()
    m.top.optionsAvailable = false
    m.searchSpinner = m.top.findnode("searchSpinner")
    m.searchSelect = m.top.findnode("searchSelect")
    m.searchTask = CreateObject("roSGNode", "SearchTask")

    'set label text
    m.searchHelpText = m.top.findNode("SearchHelpText")
    m.searchHelpText.text = tr("You can search for Titles, People, Live TV Channels and more")

end sub

sub searchMedias()
    query = m.top.searchAlpha

    'if search task is running and user selectes another letter stop the search and load the next letter

    m.searchTask.control = "stop"
    if query <> invalid and query <> ""
        m.searchSpinner.visible = true
    end if
    m.searchTask.observeField("results", "loadResults")
    m.searchTask.query = query
    m.searchTask.control = "RUN"

end sub

sub loadResults()
    m.searchTask.unobserveField("results")

    m.searchSpinner.visible = false
    m.searchSelect.itemdata = m.searchTask.results
    m.searchSelect.query = m.top.SearchAlpha
    m.searchHelpText.visible = false
    m.searchAlphabox = m.top.findnode("searchResults")
    m.searchAlphabox.translation = "[470, 85]"
end sub

function onKeyEvent(key as string, press as boolean) as boolean

    m.searchAlphabox = m.top.findNode("search_Key")

    if key = "left" and m.searchSelect.isinFocusChain() and (m.searchSelect.currFocusColumn = -1 or m.searchSelect.currFocusColumn = 0)
        m.searchAlphabox.setFocus(true)
        return true
    else if key = "right"
        m.searchSelect.setFocus(true)
        return true
    end if
    return false

end function
