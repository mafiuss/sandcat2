Koa = require 'koa'
app = new Koa()


app.use (ctx, next) ->
  start = Date.now()
  await next()
  ms = Date.now() - start
  ctx.set 'X-Response-Time', "#{ms}ms"

app.use (ctx, next) ->
  start = Date.now()
  await next()
  ms = Date.now() - start
  console.log "#{ctx.method} #{ctx.url} = #{ms}"

app.use (ctx, next) ->
  ctx.body = 'Hello World'


app.listen 3000
