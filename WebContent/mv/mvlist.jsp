<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <div id="search-box">
    <paper-input no-label-float id="search-input" label="검색어를 입력해주세요." value="{{searchQuery}}" on-keyup="checkSearchKey"></paper-input>
    <paper-fab mini id="search-button" icon="search" on-tap="search"></paper-fab>
</div>
<iframe fixed id="video" src="https://www.youtube.com/embed/{{currentData.id}}" frameborder="0" allowfullscreen></iframe>

    
    
    <script>
    app.search = function() {

        app.videos = [];

        if (app.searchQuery === '') {

            fetch('https://www.googleapis.com/youtube/v3/videos?chart=mostPopular&key=' + Secure.youtubeKey + '&part=snippet&maxResults=10', {
                headers : {
                    "Content-type" : "application/json"
                }
            }).then(function(response) {
                return response.json();
                // This returns a promise
            }).then(function(responseObject) {
                if (responseObject.error === undefined) {
                    responseObject.items.forEach(function(itemInfo, i) {
                        if (itemInfo.kind === 'youtube#video') {
                            app.push('videos', {
                                id : itemInfo.id,
                                title : itemInfo.snippet.title.length > 48 ? itemInfo.snippet.title.substring(0, 46) + '...' : itemInfo.snippet.title,
                                description : itemInfo.snippet.description,
                                channelTitle : itemInfo.snippet.channelTitle,
                                handle : itemInfo.id,
                                thumbnail : itemInfo.snippet.thumbnails.medium.url
                            });
                        }
                    });
                }
            }).catch(function(err) {
                // An error occured parsing Json
            });
        } else {
            fetch('https://www.googleapis.com/youtube/v3/search?q=' + app.searchQuery + '&key=' + Secure.youtubeKey + '&part=snippet&maxResults=10', {
                headers : {
                    "Content-type" : "application/json"
                }
            }).then(function(response) {
                return response.json();
                // This returns a promise
            }).then(function(responseObject) {
                if (responseObject.error === undefined) {
                    responseObject.items.forEach(function(itemInfo, i) {
                        if (itemInfo.id.kind === 'youtube#video') {
                            app.push('videos', {
                                id : itemInfo.id.videoId,
                                title : itemInfo.snippet.title.length > 48 ? itemInfo.snippet.title.substring(0, 46) + '...' : itemInfo.snippet.title,
                                description : itemInfo.snippet.description,
                                channelTitle : itemInfo.snippet.channelTitle,
                                handle : itemInfo.id.videoId,
                                thumbnail : itemInfo.snippet.thumbnails.medium.url
                            });
                        }
                    });
                }
            }).catch(function(err) {
                // An error occured parsing Json
            });
        }
    };

    app.search();
    app.checkSearchKey = function(e) {
        if (e.keyCode === 13) {
            app.search();
        }
    };
</script>