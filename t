<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
    <link rel="shortcut icon" href="network.png">
    <link rel="icon" type="image/png" href="network.png" />
    <link rel="apple-touch-icon" href="network.png">
    <title>NetCV.CN</title>
    <meta property="og:site_name" content="NetCV.CN" />
    <meta property="og:image" content="https://netcv.cn/network.png" />
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
    <script type="text/javascript">
        marked.setOptions({
            gfm: true,
            breaks: true
        })
    </script>
    <style type="text/css">
        * {
            padding: 0;margin: 0;list-style: none;
            font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #606c71;    
        }
        body {background-color: #eee;}
        .container {padding: 20px;max-width: 1024px;margin: 0 auto;}
        .container li {margin: 10px 0;background-color: #fff;padding: 10px 15px;box-shadow: 0 0 3px rgb(2, 2, 2, 0.1);}
        .title {font-weight: bold;font-size: 22px;margin: 5px 0;color: #159957;}
        .title:hover {cursor: pointer;}
        .author {line-height: 16px;padding: 8px 0;color: #ccc;}
        .author .avatar {float: left;margin: -4px 10px 0 0;}
        .author .avatar img {border-radius: 50%;}
        .author .ops {float: right;text-align: right;color: #159957;font-size: 12px;}
        .author .ops a {color: #159957;text-decoration: none;font-size: 12px;display: inline-block;margin-right: 3px;}
        .author .ops .reply {color: #159957;text-decoration: none;font-size: 12px;margin: 0 0 0 10px;}

        .content {line-height: 1.6;font-size: 14px;word-break: break-word;margin-top: 10px;}
        .content code {background: #eee;padding: 0 3px;display: inline-block;margin: 0 2px;color: #159957;font-size: 12px;line-height: 1.6;}
        .content pre code {display: block;}
        .content p {margin-bottom: 16px;}
        .content>:last-child,.content blockquote>:last-child {margin-bottom: 0;}
        .content img {max-width: 100%;max-height: 360px;}
        .content h1 {font-size: 22px;color: #159957;}
        .content h2 {font-size: 18px;border-bottom: 1px solid #eee;line-height: 32px;padding: 5px 0;margin: 10px 0;}
        .content blockquote {padding: 2px 10px;margin: 10px 0;color: #222;background: #f8f8f8;border-left: 3px solid #159957;}

        .loadding {max-width: 1024px;margin: 5px auto;position: relative;overflow: hidden;}
        .loadding {background-color: #fff;padding: 10px 0;box-shadow: 0 0 3px rgb(2, 2, 2, 0.1);}
        .loadding .bg {
            position: absolute;
            background-color: #fff;
            opacity: 0.4;
            animation: loadding 5s infinite ease-out;
            height: 46px;
            width: 48px;
            box-shadow: 0 0 10px #fff;
            top: 15px;
        }
        .loadding .avatarArea, .loadding .titleArea,.loadding .contentArea {background-color: #eee;margin: 5px 15px;height: 12px;}

        @keyframes loadding {
            0% {left: 0;}
            100% {left: 100%;}
        }

        @media screen and (max-width: 820px){
            .container {padding: 10px;max-width: 100%;}
            .loadding {margin: 0 10px;}
            .title {font-size: 18px;}
            .content {display: none;}
        }
    </style>
</head>
<body>
    <div class="container"></div>
    <div class="loadding">
        <div class="bg"></div>
        <div class="avatarArea"></div>
        <div class="titleArea"></div>
        <div class="contentArea"></div>
    </div>
    <script type="text/javascript">
        const RAW_DATA_KEY = 'raw-data'
        const RAW_DATA_ETAG_KEY = 'issues-etag'
        const RAW_DATA_VALID_SECONDS = 60
        const DEF_AVATAR_DATA = 'data:image/png;base64,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'
        const DEF_IMAGE_ERROR = 'data:image/png;base64,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'
        let loaddingBox = document.querySelector('.loadding')
        
        function main()  {
            // issue id
            let issueInfo = location.hash 
            if(issueInfo) {
                console.log(ok)

            }
            
        }

        //// 获取数据
        function fetchRawData() {
            fetch(new Request('https://api.github.com/repos/opencodesp/netcv.cn/issues', {
                method: 'GET',
                headers: {
                    'If-None-Match': localStorage.getItem(RAW_DATA_ETAG_KEY)
                }
            })).
            then(resp => {
                let etdg = resp.headers.get('etag')
                console.log(RAW_DATA_ETAG_KEY + ': ' + etdg)
                localStorage.setItem(RAW_DATA_ETAG_KEY, etdg)
                return resp.json()
            }).
            then(json => {
                localStorage.setItem('raw-data', JSON.stringify({
                    uptime: new Date().getTime(),
                    rawData: json
                }))
                renderByRawData(json)
            }).
            catch(e => onFetchError(e))
        }

        //// 获取数据出错回调
        function onFetchError(e) {
            // Render Cahce
            let rawData = localStorage.getItem(RAW_DATA_KEY)
            if(rawData) {
                renderByRawData(JSON.parse(rawData).rawData)
                return
            }
            // Show Reload Tips
            showTips(e.message)
        }

        //// 用给定数据渲染界面
        function renderByRawData(json) {
            // Close Tips
            closeTips()
            // Render UI
            renderIssues(json)
        }

        //// 渲染命令
        function renderIssues(json) {
            let container = document.querySelector('.container')
            let ul = document.createElement('ul')
            container.appendChild(ul)
            for(let i in json) {

                let avatarImg = document.createElement('img')
                avatarImg.src = json[i].user.avatar_url
                avatarImg.alt = json[i].user.login
                avatarImg.width = 22
                avatarImg.height = 22
                avatarImg.setAttribute('onerror', 'ensureAvatar(this)')

                let avatarLink = document.createElement('a')
                avatarLink.href = 'https://github.com/' + json[i].user.login
                avatarLink.title = json[i].user.login
                avatarLink.className = 'avatar'
                avatarLink.appendChild(avatarImg)

                let reply = document.createElement('a')
                reply.className = 'reply'
                reply.innerHTML = '评论' + json[i].comments
                reply.href = json[i].html_url

                let ops = document.createElement('div')
                ops.className = 'ops'
                for (let j in json[i].labels) {
                    let label = json[i].labels[j]
                    let labelLink = document.createElement('a')
                    labelLink.href = 'https://github.com/opencodesp/netcv.cn/labels/' + label.name
                    labelLink.innerHTML = '#' + label.name
                    ops.appendChild(labelLink)
                }
                ops.appendChild(reply)

                let author = document.createElement('div')
                author.appendChild(avatarLink)
                author.className = 'author'
                let createTime = new Date(Date.parse(json[i].created_at))
                author.innerHTML += createTime.getFullYear() + '/' + createTime.getMonth() + '/' + createTime.getDay() + ' ' + createTime.getHours() + ':' + createTime.getMinutes()
                author.appendChild(ops)

                let content = document.createElement('div')
                content.className = 'content'
                content.innerHTML = marked(json[i].body)

                let title = document.createElement('div')
                title.className = 'title'
                title.innerHTML += json[i].title
                title.setAttribute('onclick', "showContent(this)")


                let li = document.createElement('li')

                li.appendChild(title)
                li.appendChild(author)
                li.appendChild(content)

                ul.appendChild(li)
            }
            onRenderOver()
        }

        //// 尽量放大图片
        function viewImage(img) {
            img.style.maxHeight = 'none'
            img.onclick = function() {
                noViewImage(img)
            }
        }

        //// 尽量缩写图片
        function noViewImage(img) {
            img.style.maxHeight = '360px'
            img.onclick = function() {
                viewImage(img)
            }
        }

        //// 数据渲染完毕回调
        function onRenderOver() {
            document.querySelectorAll('.content img').forEach(img => {
                img.onclick = function () {
                    viewImage(img)
                }
                img.onerror = function () {
                    img.src = DEF_IMAGE_ERROR
                }
            })
        }

        //// 显示提示框
        function showTips(text) {
            loaddingBox.innerHTML = ''
            let tipsText = document.createElement('div')
            tipsText.className = 'tips'
            tipsText.innerHTML = text
            loaddingBox.appendChild(tipsText)
        }

        //// 关闭提示框
        function closeTips() {
            // Close Loadding Box
            loaddingBox.style.display = 'none'
        }

        //// 展示博客内容
        function showContent(title) {
            title.parentNode.querySelector('.content').style.display = 'block'
            title.onclick = function() {
                hideContent(title)
            }
        }
        //// 隐藏博客内容
        function hideContent(title) {
            title.parentNode.querySelector('.content').style.display = 'none'
            title.onclick = function() {
                showContent(title)
            }
        }

        //// 博主头像显示检测
        function ensureAvatar(img) {
            img.src = DEF_AVATAR_DATA
        }

        // 执行入口函数
        main()
    </script>
</body>
</html>