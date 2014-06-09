# LinkThumbnailer API

[Ruby gem](https://github.com/gottfrois/link_thumbnailer) generating image thumbnails from a given URL. Rank them and give you back an object containing images and website informations. Works like Facebook link previewer.

Demo Application is [here](http://link-thumbnailer-demo.herokuapp.com/) !

## Features

- Dead simple.
- Support [OpenGraph](http://ogp.me/) protocol.
- Find and sort images that best represent what the page is about.
- Find and rate description that best represent what the page is about.
- Allow for custom class to sort the website descriptions yourself.
- Support image urls blacklisting (advertisements).
- Works with and without Rails.
- Fully customizable.
- Fully tested.

## Usage

`GET http://link-thumbnailer-api.herokuapp.com/api/thumbnails/new`

Note: API endpoint might change in the futur, this is the **BETA** version.

### Parameters

* `url` -- the url of the website your want to generate a thumbnail for

### Response

The API endpoint will respond in `JSON` with the following attributes:

* `url` -- `string` representing the final website's url (will follow redirections if any)
* `title` -- `string` representing the website's title
* `description` -- `string` representing the website's description
* `images`
	* `src` -- `string` representing the image url
	* `size` -- `array` representing the image size (width & height)
	* `type` -- `string` representing the image type


Example:

```
> curl http://link-thumbnailer-api.herokuapp.com/api/thumbnails/new\?url\=http://stackoverflow.com
	{"url":"http://stackoverflow.com","title":"Stack Overflow","description":"Q\u0026A for professional and enthusiast programmers","images":[{"src":"http://cdn.sstatic.net/stackoverflow/img/apple-touch-icon@2.png?v=fde65a5a78c6","size":[316,316],"type":"png"}]}
```

Visit [LinkThumbnailer github page](https://github.com/gottfrois/link_thumbnailer) for more information about LinkThumbnailer.