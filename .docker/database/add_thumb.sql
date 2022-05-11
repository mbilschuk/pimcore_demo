USE `pimcore`;

INSERT INTO `translations_admin` (`key`, `type`, `language`, `text`, `creationDate`, `modificationDate`)
VALUES
    ('areabrick.drop.name', 'simple', 'en', 'Drop image (SHA 256)', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
    ('areabrick.videogallery.name', 'simple', 'en', 'Gallery (Video)', UNIX_TIMESTAMP(), UNIX_TIMESTAMP());


INSERT INTO `settings_store` (`id`, `scope`, `data`, `type`)
VALUES
    ('rotate180', 'pimcore_image_thumbnails', '{"items":[{"method":"rotate","arguments":{"angle":180}}],"medias":[],"name":"rotate180","description":"","group":"","format":"SOURCE","quality":85,"highResolution":0,"preserveColor":false,"preserveMetaData":false,"rasterizeSVG":false,"downloadable":false,"modificationDate":1651676691,"creationDate":1651675682,"preserveAnimation":false}', 'string'),
    ('grayscale', 'pimcore_image_thumbnails', '{"items":[{"method":"grayscale","arguments":[]}],"medias":[],"name":"grayscale","description":"","group":"","format":"SOURCE","quality":85,"highResolution":0,"preserveColor":false,"preserveMetaData":false,"rasterizeSVG":false,"downloadable":false,"modificationDate":1651676600,"creationDate":1651676591,"preserveAnimation":false}', 'string'),
    ('width640', 'pimcore_video_thumbnails', '{"items":[{"method":"scaleByWidth","arguments":{"width":640}}],"medias":[],"name":"width640","description":"","group":"","videoBitrate":450,"audioBitrate":128,"modificationDate":1651690480,"creationDate":1651677229}', 'string');