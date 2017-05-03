// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Drive API (drive/v3)
// Description:
//   Manages files in Drive including uploading, downloading, searching,
//   detecting changes, and updating sharing permissions.
// Documentation:
//   https://developers.google.com/drive/

#import "GTLRDriveObjects.h"

// ----------------------------------------------------------------------------
//
//   GTLRDrive_About
//

@implementation GTLRDrive_About
@dynamic appInstalled, exportFormats, folderColorPalette, importFormats, kind,
         maxImportSizes, maxUploadSize, storageQuota, user;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"folderColorPalette" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_AboutExportFormats
//

@implementation GTLRDrive_AboutExportFormats

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_AboutImportFormats
//

@implementation GTLRDrive_AboutImportFormats

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_AboutMaxImportSizes
//

@implementation GTLRDrive_AboutMaxImportSizes

+ (Class)classForAdditionalProperties {
  return [NSNumber class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_AboutStorageQuota
//

@implementation GTLRDrive_AboutStorageQuota
@dynamic limit, usage, usageInDrive, usageInDriveTrash;
@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_Change
//

@implementation GTLRDrive_Change
@dynamic file, fileId, kind, removed, time;
@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_ChangeList
//

@implementation GTLRDrive_ChangeList
@dynamic changes, kind, newStartPageToken, nextPageToken;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"changes" : [GTLRDrive_Change class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"changes";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_Channel
//

@implementation GTLRDrive_Channel
@dynamic address, expiration, identifier, kind, params, payload, resourceId,
         resourceUri, token, type;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_ChannelParams
//

@implementation GTLRDrive_ChannelParams

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_Comment
//

@implementation GTLRDrive_Comment
@dynamic anchor, author, content, createdTime, deleted, htmlContent, identifier,
         kind, modifiedTime, quotedFileContent, replies, resolved;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"replies" : [GTLRDrive_Reply class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_CommentQuotedFileContent
//

@implementation GTLRDrive_CommentQuotedFileContent
@dynamic mimeType, value;
@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_CommentList
//

@implementation GTLRDrive_CommentList
@dynamic comments, kind, nextPageToken;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"comments" : [GTLRDrive_Comment class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"comments";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_File
//

@implementation GTLRDrive_File
@dynamic appProperties, capabilities, contentHints, createdTime,
         descriptionProperty, explicitlyTrashed, fileExtension, folderColorRgb,
         fullFileExtension, headRevisionId, iconLink, identifier,
         imageMediaMetadata, isAppAuthorized, kind, lastModifyingUser,
         md5Checksum, mimeType, modifiedByMe, modifiedByMeTime, modifiedTime,
         name, originalFilename, ownedByMe, owners, parents, permissions,
         properties, quotaBytesUsed, shared, sharedWithMeTime, sharingUser,
         size, spaces, starred, thumbnailLink, trashed, version,
         videoMediaMetadata, viewedByMe, viewedByMeTime, viewersCanCopyContent,
         webContentLink, webViewLink, writersCanShare;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  NSDictionary<NSString *, NSString *> *map = @{
    @"descriptionProperty" : @"description",
    @"identifier" : @"id"
  };
  return map;
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"owners" : [GTLRDrive_User class],
    @"parents" : [NSString class],
    @"permissions" : [GTLRDrive_Permission class],
    @"spaces" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_FileAppProperties
//

@implementation GTLRDrive_FileAppProperties

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_FileCapabilities
//

@implementation GTLRDrive_FileCapabilities
@dynamic canComment, canCopy, canEdit, canReadRevisions, canShare;
@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_FileContentHints
//

@implementation GTLRDrive_FileContentHints
@dynamic indexableText, thumbnail;
@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_FileImageMediaMetadata
//

@implementation GTLRDrive_FileImageMediaMetadata
@dynamic aperture, cameraMake, cameraModel, colorSpace, exposureBias,
         exposureMode, exposureTime, flashUsed, focalLength, height, isoSpeed,
         lens, location, maxApertureValue, meteringMode, rotation, sensor,
         subjectDistance, time, whiteBalance, width;
@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_FileProperties
//

@implementation GTLRDrive_FileProperties

+ (Class)classForAdditionalProperties {
  return [NSString class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_FileVideoMediaMetadata
//

@implementation GTLRDrive_FileVideoMediaMetadata
@dynamic durationMillis, height, width;
@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_FileContentHintsThumbnail
//

@implementation GTLRDrive_FileContentHintsThumbnail
@dynamic image, mimeType;
@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_FileImageMediaMetadataLocation
//

@implementation GTLRDrive_FileImageMediaMetadataLocation
@dynamic altitude, latitude, longitude;
@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_FileList
//

@implementation GTLRDrive_FileList
@dynamic files, kind, nextPageToken;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"files" : [GTLRDrive_File class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"files";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_GeneratedIds
//

@implementation GTLRDrive_GeneratedIds
@dynamic ids, kind, space;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"ids" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_Permission
//

@implementation GTLRDrive_Permission
@dynamic allowFileDiscovery, displayName, domain, emailAddress, expirationTime,
         identifier, kind, photoLink, role, type;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_PermissionList
//

@implementation GTLRDrive_PermissionList
@dynamic kind, permissions;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"permissions" : [GTLRDrive_Permission class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_Reply
//

@implementation GTLRDrive_Reply
@dynamic action, author, content, createdTime, deleted, htmlContent, identifier,
         kind, modifiedTime;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_ReplyList
//

@implementation GTLRDrive_ReplyList
@dynamic kind, nextPageToken, replies;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"replies" : [GTLRDrive_Reply class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"replies";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_Revision
//

@implementation GTLRDrive_Revision
@dynamic identifier, keepForever, kind, lastModifyingUser, md5Checksum,
         mimeType, modifiedTime, originalFilename, publishAuto, published,
         publishedOutsideDomain, size;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_RevisionList
//

@implementation GTLRDrive_RevisionList
@dynamic kind, nextPageToken, revisions;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"revisions" : [GTLRDrive_Revision class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"revisions";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_StartPageToken
//

@implementation GTLRDrive_StartPageToken
@dynamic kind, startPageToken;
@end


// ----------------------------------------------------------------------------
//
//   GTLRDrive_User
//

@implementation GTLRDrive_User
@dynamic displayName, emailAddress, kind, me, permissionId, photoLink;
@end
