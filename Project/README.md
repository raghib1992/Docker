Nodejs Project

Install node js
downloadnode js from link



Install dependencies
npm install 

start server
npm start


# To connect app and db
# without container
edit app (node.js file)
const client = redis.createClient({
    host: 'https://myredisserver.com'
})
# with container
edit app (node.js file)
const client = redis.createClient({
    host: 'redis-server'
})