In the past we have stored `_id` and `id` fields in each document. This has been somewhat confusing!

I think we did that because the mongo ObjectIds were considered too long and ugly for the front-end and for users.

Instead of doing that again, if we don’t want to use ObjectIds, we have other options.

We can actually set `_id` to anything we want, as long as it is unique!

1. We can set `_id` to an incrementing number: 1, 2, 3, … This is good to look at, but not good for sharding. Only suitable for small collections which we don’t want to shard (< 10,000).

2. We can set `_id` to a shorter random id like `J5m9g~0J`, e.g. using [nanoid](https://github.com/ai/nanoid) This is sharding-friendly, and we can use their collision probability [calculator](https://alex7kom.github.io/nano-nanoid-cc/) to select a length that is suitable for our collection.

   (An alternative is [dylang/shortid](https://github.com/dylang/shortid) but nanoid appears to be better. There are [collision concerns](https://github.com/ai/nanoid/issues/8) and [prediction concerns](https://github.com/dylang/shortid/issues/70) with shortid.)

   (We can use `-` instead of `~` if we prefer.  But either way, we should [avoid](https://github.com/dylang/shortid/issues/96) using nanoids that have one of those symbols at the end!  Probably simpler to just reduce the alphabet to alphanumerics.)

By default, mongo uses ObjectId to generate long _ids because they are guaranteed to be unique even in the worst-case scenarios. But in situations when we know the number of documents created will be low we can opt for short _ids.

## See Also

I wrote a more comprehensive review of `_id` options in [this StackOverflow answer](https://stackoverflow.com/a/49147847/99777).
