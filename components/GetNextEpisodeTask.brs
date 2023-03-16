sub init()
    m.top.functionName = "getNextEpisodeTask"
end sub

sub getNextEpisodeTask()
    m.nextEpisodeData = api_API().shows.getepisodes(m.top.showID, {
        UserId: get_setting("active_user"),
        StartItemId: m.top.videoID,
        Limit: 2
    })

    m.top.nextEpisodeData = m.nextEpisodeData
    print "m.nextEpisodeData = "m.nextEpisodeData
    if m.nextEpisodeData.TotalRecordCount > 1
        getEpisodeImageTask()
    end if
end sub

sub getEpisodeImageTask()
    m.image = api_API().items.getimages(m.nextEpisodeData.Items[1].Id)
    print "m.image = " m.image
    m.top.imageArray = m.image
end sub
