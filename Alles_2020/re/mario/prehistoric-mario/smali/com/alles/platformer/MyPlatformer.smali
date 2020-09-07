.class public Lcom/alles/platformer/MyPlatformer;
.super Lcom/badlogic/gdx/ApplicationAdapter;
.source "MyPlatformer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alles/platformer/MyPlatformer$Koala;
    }
.end annotation


# static fields
.field private static final GRAVITY:F = -1.5f

.field public static absoluteBatch:Lcom/badlogic/gdx/graphics/g2d/Batch;


# instance fields
.field private camera:Lcom/badlogic/gdx/graphics/OrthographicCamera;

.field controller:Lcom/alles/platformer/Controller;

.field private croutch:Lcom/badlogic/gdx/graphics/g2d/Animation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/graphics/g2d/Animation<",
            "Lcom/badlogic/gdx/graphics/g2d/TextureRegion;",
            ">;"
        }
    .end annotation
.end field

.field private croutchStand:Lcom/badlogic/gdx/graphics/g2d/Animation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/graphics/g2d/Animation<",
            "Lcom/badlogic/gdx/graphics/g2d/TextureRegion;",
            ">;"
        }
    .end annotation
.end field

.field private debug:Z

.field private debugLabel:Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

.field private debugRenderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

.field private debugStage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

.field font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

.field private jump:Lcom/badlogic/gdx/graphics/g2d/Animation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/graphics/g2d/Animation<",
            "Lcom/badlogic/gdx/graphics/g2d/TextureRegion;",
            ">;"
        }
    .end annotation
.end field

.field private koala:Lcom/alles/platformer/MyPlatformer$Koala;

.field private koalaTexture:Lcom/badlogic/gdx/graphics/Texture;

.field private map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

.field private questionMarkTileMapping:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private rectPool:Lcom/badlogic/gdx/utils/Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Pool<",
            "Lcom/badlogic/gdx/math/Rectangle;",
            ">;"
        }
    .end annotation
.end field

.field private renderer:Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;

.field private stand:Lcom/badlogic/gdx/graphics/g2d/Animation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/graphics/g2d/Animation<",
            "Lcom/badlogic/gdx/graphics/g2d/TextureRegion;",
            ">;"
        }
    .end annotation
.end field

.field private tiles:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/math/Rectangle;",
            ">;"
        }
    .end annotation
.end field

.field private walk:Lcom/badlogic/gdx/graphics/g2d/Animation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/graphics/g2d/Animation<",
            "Lcom/badlogic/gdx/graphics/g2d/TextureRegion;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Lcom/badlogic/gdx/ApplicationAdapter;-><init>()V

    .line 98
    new-instance v0, Lcom/alles/platformer/MyPlatformer$1;

    invoke-direct {v0, p0}, Lcom/alles/platformer/MyPlatformer$1;-><init>(Lcom/alles/platformer/MyPlatformer;)V

    iput-object v0, p0, Lcom/alles/platformer/MyPlatformer;->rectPool:Lcom/badlogic/gdx/utils/Pool;

    .line 104
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/alles/platformer/MyPlatformer;->tiles:Lcom/badlogic/gdx/utils/Array;

    const/4 v0, 0x0

    .line 108
    iput-boolean v0, p0, Lcom/alles/platformer/MyPlatformer;->debug:Z

    return-void
.end method

.method public static bytesToHex([B)Ljava/lang/String;
    .locals 5

    .line 302
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 303
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    add-int/lit16 v3, v3, 0x100

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 304
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private checkFlag()V
    .locals 13

    const-string v0, "tileSet.png"

    const-string v1, "map_flag.tmx"

    const-string v2, "RC4"

    const/16 v3, 0xb

    .line 221
    new-array v3, v3, [B

    fill-array-data v3, :array_0

    .line 223
    iget-object v4, p0, Lcom/alles/platformer/MyPlatformer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v4}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v4

    const-string v5, "questionmarks"

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/maps/MapLayers;->get(Ljava/lang/String;)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_0
    const/16 v8, 0x64

    if-ge v6, v8, :cond_4

    move v9, v7

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v8, :cond_3

    .line 228
    invoke-virtual {v4, v6, v7}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getCell(II)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v10

    if-eqz v10, :cond_2

    .line 229
    invoke-virtual {v10}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getTile()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v11

    invoke-interface {v11}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v11

    const-string v12, "questionmarkType"

    invoke-virtual {v11, v12}, Lcom/badlogic/gdx/maps/MapProperties;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_0

    goto :goto_2

    .line 232
    :cond_0
    invoke-virtual {v10}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getTile()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v10

    invoke-interface {v10}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v10

    invoke-virtual {v10, v12}, Lcom/badlogic/gdx/maps/MapProperties;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/16 v11, 0x539

    if-ne v10, v11, :cond_1

    goto :goto_2

    :cond_1
    int-to-byte v10, v10

    .line 236
    aput-byte v10, v3, v9

    add-int/lit8 v9, v9, 0x1

    :cond_2
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_3
    add-int/lit8 v6, v6, 0x1

    move v7, v9

    goto :goto_0

    :cond_4
    const/4 v4, 0x0

    :try_start_0
    const-string v6, "SHA-256"

    .line 245
    invoke-static {v6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v6
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v6

    .line 247
    invoke-virtual {v6}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    move-object v6, v4

    .line 250
    :goto_3
    invoke-virtual {v6, v3}, Ljava/security/MessageDigest;->update([B)V

    const-string v7, "P4ssw0rdS4lt"

    .line 251
    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/security/MessageDigest;->update([B)V

    .line 252
    invoke-virtual {v6}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v8

    .line 254
    invoke-static {v8}, Lcom/alles/platformer/MyPlatformer;->toHex([B)Ljava/lang/String;

    move-result-object v8

    const-string v9, "024800ace2ec394e6af68baa46e81dfbea93f0f6730610560c66ee9748d91420"

    .line 255
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 257
    :try_start_1
    invoke-virtual {v6, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 258
    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/security/MessageDigest;->update([B)V

    .line 259
    invoke-virtual {v6, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 260
    invoke-virtual {v6}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    .line 261
    sget-object v6, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    const-string v7, "flag_enc"

    invoke-interface {v6, v7}, Lcom/badlogic/gdx/Files;->internal(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v6

    invoke-virtual {v6}, Lcom/badlogic/gdx/files/FileHandle;->readString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/badlogic/gdx/utils/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object v6

    .line 266
    new-instance v7, Ljavax/crypto/spec/SecretKeySpec;

    array-length v8, v3

    invoke-direct {v7, v3, v5, v8, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BIILjava/lang/String;)V

    .line 268
    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v2

    const/4 v3, 0x2

    .line 273
    invoke-virtual {v2}, Ljavax/crypto/Cipher;->getParameters()Ljava/security/AlgorithmParameters;

    move-result-object v8

    invoke-virtual {v2, v3, v7, v8}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/AlgorithmParameters;)V

    .line 274
    invoke-virtual {v2, v6}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v2

    .line 276
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v2}, Ljava/lang/String;-><init>([B)V

    .line 278
    sget-object v2, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    invoke-interface {v2, v1}, Lcom/badlogic/gdx/Files;->local(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v2

    .line 279
    invoke-virtual {v2, v3, v5}, Lcom/badlogic/gdx/files/FileHandle;->writeString(Ljava/lang/String;Z)V

    .line 281
    sget-object v3, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    invoke-interface {v3, v0}, Lcom/badlogic/gdx/Files;->local(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v3

    const-string v6, "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T5/+BQOY8/xvJtwPAAADAFBMVEUAAAAZGRkXPDQoJygnOzw6OjoNUisGWzUaSDcVWjUDbjgpSD0qUj44RD4kZzwOcUUZf2QsTEAsVkA0S0M1WEc+WlAtZ0EvcUI5Yks+YVAweEMyfFpBOz5SHmlVIm1oN3VIR0dIWElBW1NWWEtYV1lcWmFDZktHaFhSYE9ZZVROb2BSbGJZd2lmV01qXFVxXFdiXWBsYlloc119Y0t1ZFh6eVRqaWlqdWdlfXR8bGF0aXF6cmd6eXk5NokFV70MZb4pU50rW6EpY543dKQHUsERaMQlb8tHSY9JeqwSjDIjkjwmoz4BkkUTgmEFpEsnjEEmlEAyh0Q0mEYggWYnqEUns0o2p0c5t0o9slE7xUs91E1KlFdJsFB9ik5phHd8hG1win5itV5otWRLwlBiyl1owWF5yGx4xnJ712p94Ws9gKZNg69ujYB1jIJ8k4hpk7xxmsGKNBqmLBi9OyOVTR6cVCGxVRirVii1fxi2cjaIakyCaFuFdV+UbUWXcEaXd1iAbmGHdWiIfHWRfW6VfHOkdkSifHnCPiPDWSDLbzmOfICKniqOri25ihS4tROnuzqFl1SKgm2NgnmMl26Xg2yXhXWUmGSWl3aNsU2Oo3GHsW2NuXKSo2eQrHOesn2pgVi7hUq1iVimh2eii3ulkn20jGG4mHepq3ukvGWtvXC0vHuVyjK5zhSoyTiSxEiKyHGD126H2XGU13eF5XGa5Hq3zUKvxG+i8H7HmRvViTLapCT9lRHskSfspy7IjEjDjVLMkk/Xk0XYnVnRnXHap2vgnVDtolHgpmHF0xrc0STY5CLi7CbF3EfP40yFhISGk4qInJOWiYObkomXl5eMoZeTp52mjYaoj5WploOmm5OzjYixnIe1mJmllaKvo4qqopq2o4y7qJK7uYWnpqa0q6Wyq7G7squ2tra3wben74GT//+t///CrJXEvY7HspnUoYXVsojQs5zMq6XJrbDOvKbGvbLRvaXEvcTSwarayLHhx6vszbHMyszO///8/f0AAADTgYy9AAABAHRSTlP///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////8AU/cHJQAAAAlwSFlzAAALEwAACxMBAJqcGAAAIjhJREFUeF7tfQ10G9d55cah1wwHscoJC8nYTWrXUriuSdBIp7RhoXtsq9latuIYOAoQqqzqxD2p1zq0o1qJSivrYEg6qRTXzmo5Frdpmkqg+7O05KS2kzBglKRNUydrQ6IgZcFFfAQsKDNdY7FhQkNQlhb3fu89ADPgAATIgS0KvBLxBvMD8bvvvu/nzcPoXy00ONYIEG3DYo0A0TYs1ggQbcNijQDRNizWCBBtw+JyIWB6alps1YjLgoCzqrJPUYLqlHhfCy4DAjRFUdyqqqIJamJf9bCMgJMd7e0dp8WbtxCaW1G0eCKdTsQ1cKCeFfurhUUEdMg2SZJlm22n2PEW4WwQ5qez2WwmM4uXWFAJTopDVcIaAmyyJEmgQLLJ14hdbwkmVcUdz85m8shmMB5qGwaWEADT13t9Pp8XPMgbFnbeckYcqDPUoKKmc8J4jmzMXRsDVhDQLsn+HTt6gIBPZgNBfktGQhD2o9ONyCWDSi3RwAoCJJvf7/DBfKLALtkI4lA9YWo/NJBWFXFGNbCAgA7J4ZWaJK93vcMPBmxNcAX1d4avkf3pxfaDAWhAnFQFVkzAznZonkyGCwQLgR6/12uT5DZxuF6Yhv3BUvvneJNNu1Vx2tJYIQEdNpnGvI1+AEkKBAI9O3zwheKEesHE/rlcNjvHOMgmlFPivCWxMgI2cLsLkOwYA6AAjkCcUScEkfMkjfaT9XN4oe1crOpBsCICTouOL0Cy+wLEgKPOBLyG/CdmjH9zOdhPFOSIgmyoWgZWREC7sFsHREREA3trfQlA0qsW0x8G6n8OJoLZakOB1QTADYABu9QuTqkP3O5FAigSwBjIZtTqHOGKCOiDuSzo6SE5evy2VnFGnaDCAwrLBYTtHIyBhFJVVbAiAm5ulb1eh83IgCT3OJqkuuYB00FFM44AvQCA7FwaSXFVGeFKCJCbbIh5O/LJ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"

    .line 282
    invoke-static {v6}, Lcom/badlogic/gdx/utils/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v3, v6, v5}, Lcom/badlogic/gdx/files/FileHandle;->writeBytes([BZ)V

    .line 284
    new-instance v3, Lcom/badlogic/gdx/maps/tiled/TmxMapLoader;

    new-instance v5, Lcom/alles/platformer/LocalFileResolver;

    invoke-direct {v5}, Lcom/alles/platformer/LocalFileResolver;-><init>()V

    invoke-direct {v3, v5}, Lcom/badlogic/gdx/maps/tiled/TmxMapLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    const-string v5, ""

    .line 285
    invoke-virtual {v3, v5, v2, v4}, Lcom/badlogic/gdx/maps/tiled/TmxMapLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;)Lcom/badlogic/gdx/utils/Array;

    .line 287
    new-instance v5, Lcom/badlogic/gdx/assets/AssetManager;

    new-instance v6, Lcom/alles/platformer/LocalFileResolver;

    invoke-direct {v6}, Lcom/alles/platformer/LocalFileResolver;-><init>()V

    invoke-direct {v5, v6}, Lcom/badlogic/gdx/assets/AssetManager;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    .line 288
    const-class v6, Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v5, v0, v6}, Lcom/badlogic/gdx/assets/AssetManager;->load(Ljava/lang/String;Ljava/lang/Class;)V

    .line 289
    invoke-virtual {v5}, Lcom/badlogic/gdx/assets/AssetManager;->finishLoading()V

    .line 290
    invoke-virtual {v3, v5, v1, v2, v4}, Lcom/badlogic/gdx/maps/tiled/TmxMapLoader;->loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/tiled/TmxMapLoader$Parameters;)V

    .line 291
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->dispose()V

    .line 292
    invoke-virtual {v3, v4, v4, v4, v4}, Lcom/badlogic/gdx/maps/tiled/TmxMapLoader;->loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/tiled/TmxMapLoader$Parameters;)Lcom/badlogic/gdx/maps/tiled/TiledMap;

    move-result-object v0

    iput-object v0, p0, Lcom/alles/platformer/MyPlatformer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    .line 293
    new-instance v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;

    iget-object v1, p0, Lcom/alles/platformer/MyPlatformer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    const/high16 v2, 0x3d800000    # 0.0625f

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;F)V

    iput-object v0, p0, Lcom/alles/platformer/MyPlatformer;->renderer:Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    move-exception v0

    .line 295
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_5
    :goto_4
    return-void

    nop

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method private getQuestionmarkTiles(IIIILcom/badlogic/gdx/utils/Array;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/math/Rectangle;",
            ">;)V"
        }
    .end annotation

    .line 575
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v0

    const-string v1, "questionmarks"

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/maps/MapLayers;->get(Ljava/lang/String;)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    .line 576
    iget-object v1, p0, Lcom/alles/platformer/MyPlatformer;->rectPool:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v1, p5}, Lcom/badlogic/gdx/utils/Pool;->freeAll(Lcom/badlogic/gdx/utils/Array;)V

    .line 577
    invoke-virtual {p5}, Lcom/badlogic/gdx/utils/Array;->clear()V

    :goto_0
    if-gt p2, p4, :cond_2

    move v1, p1

    :goto_1
    if-gt v1, p3, :cond_1

    .line 580
    invoke-virtual {v0, v1, p2}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getCell(II)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 582
    iget-object v2, p0, Lcom/alles/platformer/MyPlatformer;->rectPool:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/math/Rectangle;

    int-to-float v3, v1

    int-to-float v4, p2

    const/high16 v5, 0x3f800000    # 1.0f

    .line 583
    invoke-virtual {v2, v3, v4, v5, v5}, Lcom/badlogic/gdx/math/Rectangle;->set(FFFF)Lcom/badlogic/gdx/math/Rectangle;

    .line 584
    invoke-virtual {p5, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private getTiles(IIIILcom/badlogic/gdx/utils/Array;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/math/Rectangle;",
            ">;)V"
        }
    .end annotation

    .line 551
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v0

    const-string v1, "walls"

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/maps/MapLayers;->get(Ljava/lang/String;)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    .line 552
    iget-object v1, p0, Lcom/alles/platformer/MyPlatformer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v1

    const-string v2, "questionmarks"

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/maps/MapLayers;->get(Ljava/lang/String;)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    .line 553
    iget-object v2, p0, Lcom/alles/platformer/MyPlatformer;->rectPool:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v2, p5}, Lcom/badlogic/gdx/utils/Pool;->freeAll(Lcom/badlogic/gdx/utils/Array;)V

    .line 554
    invoke-virtual {p5}, Lcom/badlogic/gdx/utils/Array;->clear()V

    :goto_0
    if-gt p2, p4, :cond_3

    move v2, p1

    :goto_1
    if-gt v2, p3, :cond_2

    .line 557
    invoke-virtual {v0, v2, p2}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getCell(II)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v3

    const/high16 v4, 0x3f800000    # 1.0f

    if-eqz v3, :cond_0

    .line 559
    iget-object v3, p0, Lcom/alles/platformer/MyPlatformer;->rectPool:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v3}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/math/Rectangle;

    int-to-float v5, v2

    int-to-float v6, p2

    .line 560
    invoke-virtual {v3, v5, v6, v4, v4}, Lcom/badlogic/gdx/math/Rectangle;->set(FFFF)Lcom/badlogic/gdx/math/Rectangle;

    .line 561
    invoke-virtual {p5, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 564
    :cond_0
    invoke-virtual {v1, v2, p2}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getCell(II)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 566
    iget-object v3, p0, Lcom/alles/platformer/MyPlatformer;->rectPool:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v3}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/math/Rectangle;

    int-to-float v5, v2

    int-to-float v6, p2

    .line 567
    invoke-virtual {v3, v5, v6, v4, v4}, Lcom/badlogic/gdx/math/Rectangle;->set(FFFF)Lcom/badlogic/gdx/math/Rectangle;

    .line 568
    invoke-virtual {p5, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method private isTouched(FF)Z
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x2

    if-ge v1, v2, :cond_1

    .line 542
    sget-object v2, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    invoke-interface {v2, v1}, Lcom/badlogic/gdx/Input;->getX(I)I

    move-result v2

    int-to-float v2, v2

    sget-object v3, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v3}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    .line 543
    sget-object v3, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    invoke-interface {v3, v1}, Lcom/badlogic/gdx/Input;->isTouched(I)Z

    move-result v3

    if-eqz v3, :cond_0

    cmpl-float v3, v2, p1

    if-ltz v3, :cond_0

    cmpg-float v2, v2, p2

    if-gtz v2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method private renderDebug()V
    .locals 14

    .line 627
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->debugRenderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    iget-object v1, p0, Lcom/alles/platformer/MyPlatformer;->camera:Lcom/badlogic/gdx/graphics/OrthographicCamera;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->combined:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->setProjectionMatrix(Lcom/badlogic/gdx/math/Matrix4;)V

    .line 628
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->debugRenderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->begin(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;)V

    .line 630
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->debugRenderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    sget-object v1, Lcom/badlogic/gdx/graphics/Color;->RED:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 631
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->debugRenderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    iget-object v1, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/high16 v2, 0x3ee00000    # 0.4375f

    add-float/2addr v1, v2

    iget-object v2, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v2, v2, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    sget v3, Lcom/alles/platformer/MyPlatformer$Koala;->WIDTH:F

    const/high16 v4, 0x3f300000    # 0.6875f

    sub-float/2addr v3, v4

    sget v4, Lcom/alles/platformer/MyPlatformer$Koala;->HEIGHT:F

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->rect(FFFF)V

    .line 633
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->debugRenderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    sget-object v1, Lcom/badlogic/gdx/graphics/Color;->YELLOW:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 634
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v0

    const-string v1, "walls"

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/maps/MapLayers;->get(Ljava/lang/String;)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 635
    :goto_0
    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getHeight()I

    move-result v3

    if-gt v2, v3, :cond_2

    const/4 v3, 0x0

    .line 636
    :goto_1
    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getWidth()I

    move-result v4

    if-gt v3, v4, :cond_1

    .line 637
    invoke-virtual {v0, v3, v2}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getCell(II)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 639
    iget-object v4, p0, Lcom/alles/platformer/MyPlatformer;->camera:Lcom/badlogic/gdx/graphics/OrthographicCamera;

    iget-object v5, v4, Lcom/badlogic/gdx/graphics/OrthographicCamera;->frustum:Lcom/badlogic/gdx/math/Frustum;

    int-to-float v4, v3

    const/high16 v6, 0x3f000000    # 0.5f

    add-float v7, v4, v6

    int-to-float v12, v2

    add-float v8, v12, v6

    const/4 v9, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    const/high16 v11, 0x3f800000    # 1.0f

    const/4 v13, 0x0

    move v6, v7

    move v7, v8

    move v8, v9

    move v9, v10

    move v10, v11

    move v11, v13

    invoke-virtual/range {v5 .. v11}, Lcom/badlogic/gdx/math/Frustum;->boundsInFrustum(FFFFFF)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 640
    iget-object v5, p0, Lcom/alles/platformer/MyPlatformer;->debugRenderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual {v5, v4, v12, v6, v6}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->rect(FFFF)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 644
    :cond_2
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->debugRenderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->end()V

    .line 646
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->debugLabel:Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v3, v3, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector2;->x:F

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v2, v1

    iget-object v1, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v3, 0x1

    aput-object v1, v2, v3

    const-string v1, "Pos: %f : %f"

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private renderKoala(F)V
    .locals 6

    .line 593
    sget-object p1, Lcom/alles/platformer/MyPlatformer$2;->$SwitchMap$com$alles$platformer$MyPlatformer$Koala$State:[I

    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->state:Lcom/alles/platformer/MyPlatformer$Koala$State;

    invoke-virtual {v0}, Lcom/alles/platformer/MyPlatformer$Koala$State;->ordinal()I

    move-result v0

    aget p1, p1, v0

    const/4 v0, 0x1

    if-eq p1, v0, :cond_4

    const/4 v0, 0x2

    if-eq p1, v0, :cond_3

    const/4 v0, 0x3

    if-eq p1, v0, :cond_2

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    :goto_0
    move-object v1, p1

    goto :goto_1

    .line 609
    :cond_0
    iget-object p1, p0, Lcom/alles/platformer/MyPlatformer;->croutchStand:Lcom/badlogic/gdx/graphics/g2d/Animation;

    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->stateTime:F

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/Animation;->getKeyFrame(F)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    goto :goto_0

    .line 605
    :cond_1
    iget-object p1, p0, Lcom/alles/platformer/MyPlatformer;->croutch:Lcom/badlogic/gdx/graphics/g2d/Animation;

    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->stateTime:F

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/Animation;->getKeyFrame(F)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    goto :goto_0

    .line 601
    :cond_2
    iget-object p1, p0, Lcom/alles/platformer/MyPlatformer;->jump:Lcom/badlogic/gdx/graphics/g2d/Animation;

    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->stateTime:F

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/Animation;->getKeyFrame(F)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    goto :goto_0

    .line 598
    :cond_3
    iget-object p1, p0, Lcom/alles/platformer/MyPlatformer;->walk:Lcom/badlogic/gdx/graphics/g2d/Animation;

    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->stateTime:F

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/Animation;->getKeyFrame(F)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    goto :goto_0

    .line 595
    :cond_4
    iget-object p1, p0, Lcom/alles/platformer/MyPlatformer;->stand:Lcom/badlogic/gdx/graphics/g2d/Animation;

    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->stateTime:F

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/Animation;->getKeyFrame(F)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    goto :goto_0

    .line 616
    :goto_1
    iget-object p1, p0, Lcom/alles/platformer/MyPlatformer;->renderer:Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;

    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->getBatch()Lcom/badlogic/gdx/graphics/g2d/Batch;

    move-result-object p1

    .line 617
    invoke-interface {p1}, Lcom/badlogic/gdx/graphics/g2d/Batch;->begin()V

    .line 618
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-boolean v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->facesRight:Z

    if-eqz v0, :cond_5

    .line 619
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v3, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    sget v4, Lcom/alles/platformer/MyPlatformer$Koala;->WIDTH:F

    sget v5, Lcom/alles/platformer/MyPlatformer$Koala;->HEIGHT:F

    move-object v0, p1

    invoke-interface/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFF)V

    goto :goto_2

    .line 621
    :cond_5
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    sget v2, Lcom/alles/platformer/MyPlatformer$Koala;->WIDTH:F

    add-float/2addr v2, v0

    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v3, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    sget v0, Lcom/alles/platformer/MyPlatformer$Koala;->WIDTH:F

    neg-float v4, v0

    sget v5, Lcom/alles/platformer/MyPlatformer$Koala;->HEIGHT:F

    move-object v0, p1

    invoke-interface/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFF)V

    .line 623
    :goto_2
    invoke-interface {p1}, Lcom/badlogic/gdx/graphics/g2d/Batch;->end()V

    return-void
.end method

.method public static toHex([B)Ljava/lang/String;
    .locals 4

    .line 216
    new-instance v0, Ljava/math/BigInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p0}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 217
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "%0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p0, p0

    shl-int/2addr p0, v1

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "x"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {p0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private updateKoala(F)V
    .locals 18

    move-object/from16 v6, p0

    const/4 v7, 0x0

    cmpl-float v0, p1, v7

    if-nez v0, :cond_0

    return-void

    :cond_0
    const v0, 0x3dcccccd    # 0.1f

    cmpl-float v1, p1, v0

    if-lez v1, :cond_1

    const v8, 0x3dcccccd    # 0.1f

    goto :goto_0

    :cond_1
    move/from16 v8, p1

    .line 313
    :goto_0
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget v1, v0, Lcom/alles/platformer/MyPlatformer$Koala;->stateTime:F

    add-float/2addr v1, v8

    iput v1, v0, Lcom/alles/platformer/MyPlatformer$Koala;->stateTime:F

    .line 315
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    const/high16 v1, -0x3d380000    # -100.0f

    const/high16 v9, 0x42c80000    # 100.0f

    const/high16 v10, 0x40400000    # 3.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_2

    .line 316
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, v10, v9}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 321
    :cond_2
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->controller:Lcom/alles/platformer/Controller;

    invoke-virtual {v0}, Lcom/alles/platformer/Controller;->isUpPressed()Z

    move-result v0

    const/4 v11, 0x0

    if-eqz v0, :cond_3

    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-boolean v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->grounded:Z

    if-eqz v0, :cond_3

    .line 322
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    sget v2, Lcom/alles/platformer/MyPlatformer$Koala;->JUMP_VELOCITY:F

    add-float/2addr v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 323
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    sget-object v1, Lcom/alles/platformer/MyPlatformer$Koala$State;->Jumping:Lcom/alles/platformer/MyPlatformer$Koala$State;

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer$Koala;->state:Lcom/alles/platformer/MyPlatformer$Koala$State;

    .line 324
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iput-boolean v11, v0, Lcom/alles/platformer/MyPlatformer$Koala;->grounded:Z

    .line 328
    :cond_3
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->controller:Lcom/alles/platformer/Controller;

    invoke-virtual {v0}, Lcom/alles/platformer/Controller;->isLeftPressed()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 329
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    sget v1, Lcom/alles/platformer/MyPlatformer$Koala;->MAX_VELOCITY:F

    neg-float v1, v1

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 330
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-boolean v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->grounded:Z

    if-eqz v0, :cond_4

    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    sget-object v1, Lcom/alles/platformer/MyPlatformer$Koala$State;->Walking:Lcom/alles/platformer/MyPlatformer$Koala$State;

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer$Koala;->state:Lcom/alles/platformer/MyPlatformer$Koala$State;

    .line 331
    :cond_4
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iput-boolean v11, v0, Lcom/alles/platformer/MyPlatformer$Koala;->facesRight:Z

    .line 335
    :cond_5
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->controller:Lcom/alles/platformer/Controller;

    invoke-virtual {v0}, Lcom/alles/platformer/Controller;->isLeftPressed()Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->controller:Lcom/alles/platformer/Controller;

    invoke-virtual {v0}, Lcom/alles/platformer/Controller;->isDownPressed()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 336
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    sget v1, Lcom/alles/platformer/MyPlatformer$Koala;->MAX_VELOCITY:F

    neg-float v1, v1

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 337
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-boolean v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->grounded:Z

    if-eqz v0, :cond_6

    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    sget-object v1, Lcom/alles/platformer/MyPlatformer$Koala$State;->Crouching:Lcom/alles/platformer/MyPlatformer$Koala$State;

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer$Koala;->state:Lcom/alles/platformer/MyPlatformer$Koala$State;

    .line 338
    :cond_6
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iput-boolean v11, v0, Lcom/alles/platformer/MyPlatformer$Koala;->facesRight:Z

    .line 342
    :cond_7
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->controller:Lcom/alles/platformer/Controller;

    invoke-virtual {v0}, Lcom/alles/platformer/Controller;->isRightPressed()Z

    move-result v0

    const/4 v12, 0x1

    if-eqz v0, :cond_9

    .line 343
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    sget v1, Lcom/alles/platformer/MyPlatformer$Koala;->MAX_VELOCITY:F

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 344
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-boolean v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->grounded:Z

    if-eqz v0, :cond_8

    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    sget-object v1, Lcom/alles/platformer/MyPlatformer$Koala$State;->Walking:Lcom/alles/platformer/MyPlatformer$Koala$State;

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer$Koala;->state:Lcom/alles/platformer/MyPlatformer$Koala$State;

    .line 345
    :cond_8
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iput-boolean v12, v0, Lcom/alles/platformer/MyPlatformer$Koala;->facesRight:Z

    .line 349
    :cond_9
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->controller:Lcom/alles/platformer/Controller;

    invoke-virtual {v0}, Lcom/alles/platformer/Controller;->isRightPressed()Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->controller:Lcom/alles/platformer/Controller;

    invoke-virtual {v0}, Lcom/alles/platformer/Controller;->isDownPressed()Z

    move-result v0

    if-nez v0, :cond_b

    :cond_a
    sget-object v0, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    const/16 v1, 0x20

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Input;->isKeyPressed(I)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 350
    :cond_b
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    sget v1, Lcom/alles/platformer/MyPlatformer$Koala;->MAX_VELOCITY:F

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 351
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-boolean v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->grounded:Z

    if-eqz v0, :cond_c

    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    sget-object v1, Lcom/alles/platformer/MyPlatformer$Koala$State;->Crouching:Lcom/alles/platformer/MyPlatformer$Koala$State;

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer$Koala;->state:Lcom/alles/platformer/MyPlatformer$Koala$State;

    .line 352
    :cond_c
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iput-boolean v12, v0, Lcom/alles/platformer/MyPlatformer$Koala;->facesRight:Z

    .line 356
    :cond_d
    iput-boolean v11, v6, Lcom/alles/platformer/MyPlatformer;->debug:Z

    .line 359
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    const/high16 v1, -0x40400000    # -1.5f

    invoke-virtual {v0, v7, v1}, Lcom/badlogic/gdx/math/Vector2;->add(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 362
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    sget v2, Lcom/alles/platformer/MyPlatformer$Koala;->MAX_VELOCITY:F

    neg-float v2, v2

    sget v3, Lcom/alles/platformer/MyPlatformer$Koala;->MAX_VELOCITY:F

    invoke-static {v1, v2, v3}, Lcom/badlogic/gdx/math/MathUtils;->clamp(FFF)F

    move-result v1

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 366
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    sget v2, Lcom/alles/platformer/MyPlatformer$Koala;->MAX_Y_VELOCITY:F

    neg-float v2, v2

    sget v3, Lcom/alles/platformer/MyPlatformer$Koala;->MAX_Y_VELOCITY:F

    invoke-static {v1, v2, v3}, Lcom/badlogic/gdx/math/MathUtils;->clamp(FFF)F

    move-result v1

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 370
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v13, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v13

    if-gez v0, :cond_f

    .line 371
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iput v7, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 372
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-boolean v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->grounded:Z

    if-eqz v0, :cond_f

    .line 374
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->controller:Lcom/alles/platformer/Controller;

    invoke-virtual {v0}, Lcom/alles/platformer/Controller;->isDownPressed()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 375
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    sget-object v1, Lcom/alles/platformer/MyPlatformer$Koala$State;->CrouchingStanding:Lcom/alles/platformer/MyPlatformer$Koala$State;

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer$Koala;->state:Lcom/alles/platformer/MyPlatformer$Koala$State;

    goto :goto_1

    .line 378
    :cond_e
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    sget-object v1, Lcom/alles/platformer/MyPlatformer$Koala$State;->Standing:Lcom/alles/platformer/MyPlatformer$Koala$State;

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer$Koala;->state:Lcom/alles/platformer/MyPlatformer$Koala$State;

    .line 384
    :cond_f
    :goto_1
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, v8}, Lcom/badlogic/gdx/math/Vector2;->scl(F)Lcom/badlogic/gdx/math/Vector2;

    .line 389
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->rectPool:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Lcom/badlogic/gdx/math/Rectangle;

    .line 391
    sget v0, Lcom/alles/platformer/MyPlatformer$Koala;->HEIGHT:F

    .line 392
    iget-object v1, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->state:Lcom/alles/platformer/MyPlatformer$Koala$State;

    sget-object v2, Lcom/alles/platformer/MyPlatformer$Koala$State;->Crouching:Lcom/alles/platformer/MyPlatformer$Koala$State;

    if-ne v1, v2, :cond_10

    const/high16 v1, 0x3f000000    # 0.5f

    sub-float/2addr v0, v1

    :cond_10
    move v15, v0

    .line 396
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/high16 v16, 0x3ee00000    # 0.4375f

    add-float v0, v0, v16

    iget-object v1, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    sget v2, Lcom/alles/platformer/MyPlatformer$Koala;->WIDTH:F

    const/high16 v17, 0x3f300000    # 0.6875f

    sub-float v2, v2, v17

    invoke-virtual {v14, v0, v1, v2, v15}, Lcom/badlogic/gdx/math/Rectangle;->set(FFFF)Lcom/badlogic/gdx/math/Rectangle;

    .line 398
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    cmpl-float v0, v0, v7

    if-lez v0, :cond_11

    .line 399
    iget v0, v14, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v1, v14, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v0, v1

    iget-object v1, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    goto :goto_2

    .line 401
    :cond_11
    iget v0, v14, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object v1, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    :goto_2
    add-float/2addr v0, v1

    float-to-int v0, v0

    move v3, v0

    .line 403
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    float-to-int v2, v0

    .line 404
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-float/2addr v0, v15

    float-to-int v4, v0

    .line 405
    iget-object v5, v6, Lcom/alles/platformer/MyPlatformer;->tiles:Lcom/badlogic/gdx/utils/Array;

    move-object/from16 v0, p0

    move v1, v3

    invoke-direct/range {v0 .. v5}, Lcom/alles/platformer/MyPlatformer;->getTiles(IIIILcom/badlogic/gdx/utils/Array;)V

    .line 406
    iget v0, v14, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object v1, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float/2addr v0, v1

    iput v0, v14, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 407
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->tiles:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/math/Rectangle;

    .line 408
    invoke-virtual {v14, v1}, Lcom/badlogic/gdx/math/Rectangle;->overlaps(Lcom/badlogic/gdx/math/Rectangle;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 409
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iput v7, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 413
    :cond_13
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float v0, v0, v16

    iput v0, v14, Lcom/badlogic/gdx/math/Rectangle;->x:F

    .line 417
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    cmpl-float v0, v0, v7

    if-lez v0, :cond_14

    .line 418
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-float/2addr v0, v15

    iget-object v1, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_3

    .line 420
    :cond_14
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v1, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    :goto_3
    add-float/2addr v0, v1

    float-to-int v0, v0

    move v5, v0

    .line 423
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float v0, v0, v16

    float-to-int v4, v0

    .line 424
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float v0, v0, v16

    sget v1, Lcom/alles/platformer/MyPlatformer$Koala;->WIDTH:F

    add-float/2addr v0, v1

    sub-float v0, v0, v17

    float-to-int v3, v0

    .line 428
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v0

    const-string v1, "walls"

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/maps/MapLayers;->get(Ljava/lang/String;)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    .line 429
    invoke-virtual {v0, v4, v5}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getCell(II)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 430
    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getTile()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v0

    invoke-interface {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getId()I

    move-result v0

    const/16 v1, 0x90

    if-ne v0, v1, :cond_15

    .line 433
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, v10, v9}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    return-void

    .line 444
    :cond_15
    iget-object v9, v6, Lcom/alles/platformer/MyPlatformer;->tiles:Lcom/badlogic/gdx/utils/Array;

    move-object/from16 v0, p0

    move v1, v4

    move v2, v5

    move v10, v3

    move/from16 v16, v4

    move v4, v5

    move/from16 v17, v5

    move-object v5, v9

    invoke-direct/range {v0 .. v5}, Lcom/alles/platformer/MyPlatformer;->getQuestionmarkTiles(IIIILcom/badlogic/gdx/utils/Array;)V

    .line 445
    iget v0, v14, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object v1, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-float/2addr v0, v1

    iput v0, v14, Lcom/badlogic/gdx/math/Rectangle;->y:F

    .line 447
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->tiles:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_16
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/math/Rectangle;

    .line 448
    invoke-virtual {v14, v1}, Lcom/badlogic/gdx/math/Rectangle;->overlaps(Lcom/badlogic/gdx/math/Rectangle;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 452
    iget-object v2, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v2, v2, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    cmpl-float v2, v2, v7

    if-lez v2, :cond_1d

    .line 453
    iget-object v2, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v2, v2, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v3, v1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr v3, v15

    iput v3, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 455
    iget-object v2, v6, Lcom/alles/platformer/MyPlatformer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v2}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v2

    const-string v3, "questionmarks"

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/maps/MapLayers;->get(Ljava/lang/String;)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    .line 456
    iget v3, v1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    float-to-int v3, v3

    iget v4, v1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    float-to-int v4, v4

    invoke-virtual {v2, v3, v4}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getCell(II)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v3

    .line 458
    invoke-virtual {v3}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getTile()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v4

    invoke-interface {v4}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v4

    const-string v5, "questionmarkType"

    .line 459
    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/maps/MapProperties;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_17

    goto :goto_4

    .line 462
    :cond_17
    invoke-virtual {v3}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getTile()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v0

    invoke-interface {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v0

    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/maps/MapProperties;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v4, 0x539

    if-ne v0, v4, :cond_18

    .line 465
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 467
    invoke-direct/range {p0 .. p0}, Lcom/alles/platformer/MyPlatformer;->checkFlag()V

    goto :goto_6

    :cond_18
    const/16 v4, 0x25

    const/16 v5, 0x61

    const/16 v9, 0x15

    if-nez v0, :cond_19

    const/16 v0, 0x15

    goto :goto_5

    :cond_19
    if-ne v0, v9, :cond_1a

    const/16 v0, 0x61

    goto :goto_5

    :cond_1a
    if-ne v0, v5, :cond_1b

    const/16 v0, 0x25

    goto :goto_5

    :cond_1b
    if-ne v0, v4, :cond_1c

    const/4 v0, 0x0

    .line 483
    :cond_1c
    :goto_5
    :try_start_0
    new-instance v4, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    invoke-direct {v4}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;-><init>()V

    .line 484
    iget-object v4, v6, Lcom/alles/platformer/MyPlatformer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v4}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getTileSets()Lcom/badlogic/gdx/maps/tiled/TiledMapTileSets;

    move-result-object v4

    iget-object v5, v6, Lcom/alles/platformer/MyPlatformer;->questionMarkTileMapping:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v4, v0}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileSets;->getTile(I)Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v0

    .line 485
    invoke-virtual {v3, v0}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->setTile(Lcom/badlogic/gdx/maps/tiled/TiledMapTile;)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    .line 486
    iget v0, v1, Lcom/badlogic/gdx/math/Rectangle;->x:F

    float-to-int v0, v0

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    float-to-int v1, v1

    invoke-virtual {v2, v0, v1, v3}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->setCell(IILcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :goto_6
    const/4 v11, 0x1

    goto :goto_7

    .line 495
    :cond_1d
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v2, v1

    iput v2, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 497
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iput-boolean v12, v0, Lcom/alles/platformer/MyPlatformer$Koala;->grounded:Z

    .line 499
    :goto_7
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iput v7, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    :cond_1e
    if-nez v11, :cond_21

    .line 505
    iget-object v5, v6, Lcom/alles/platformer/MyPlatformer;->tiles:Lcom/badlogic/gdx/utils/Array;

    move-object/from16 v0, p0

    move/from16 v1, v16

    move/from16 v2, v17

    move v3, v10

    move/from16 v4, v17

    invoke-direct/range {v0 .. v5}, Lcom/alles/platformer/MyPlatformer;->getTiles(IIIILcom/badlogic/gdx/utils/Array;)V

    .line 506
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->tiles:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/math/Rectangle;

    .line 507
    invoke-virtual {v14, v1}, Lcom/badlogic/gdx/math/Rectangle;->overlaps(Lcom/badlogic/gdx/math/Rectangle;)Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 511
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    cmpl-float v0, v0, v7

    if-lez v0, :cond_20

    .line 512
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sget v2, Lcom/alles/platformer/MyPlatformer$Koala;->HEIGHT:F

    sub-float/2addr v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    goto :goto_8

    .line 515
    :cond_20
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v1, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget v1, v1, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v2, v1

    iput v2, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 517
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iput-boolean v12, v0, Lcom/alles/platformer/MyPlatformer$Koala;->grounded:Z

    .line 519
    :goto_8
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iput v7, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 526
    :cond_21
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->rectPool:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v0, v14}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    .line 530
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector2;->add(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 531
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    div-float/2addr v13, v8

    invoke-virtual {v0, v13}, Lcom/badlogic/gdx/math/Vector2;->scl(F)Lcom/badlogic/gdx/math/Vector2;

    .line 535
    iget-object v0, v6, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v0, v0, Lcom/alles/platformer/MyPlatformer$Koala;->velocity:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    sget v2, Lcom/alles/platformer/MyPlatformer$Koala;->DAMPING:F

    mul-float v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    return-void
.end method


# virtual methods
.method public create()V
    .locals 17

    move-object/from16 v0, p0

    .line 116
    new-instance v1, Lcom/badlogic/gdx/graphics/Texture;

    const-string v2, "mort.png"

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/graphics/Texture;-><init>(Ljava/lang/String;)V

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer;->koalaTexture:Lcom/badlogic/gdx/graphics/Texture;

    .line 117
    iget-object v1, v0, Lcom/alles/platformer/MyPlatformer;->koalaTexture:Lcom/badlogic/gdx/graphics/Texture;

    const/16 v2, 0x15

    const/16 v3, 0x18

    invoke-static {v1, v3, v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->split(Lcom/badlogic/gdx/graphics/Texture;II)[[Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v1

    const/4 v3, 0x0

    aget-object v1, v1, v3

    .line 118
    new-instance v4, Lcom/badlogic/gdx/graphics/g2d/Animation;

    const/4 v5, 0x4

    new-array v6, v5, [Ljava/lang/Object;

    aget-object v7, v1, v3

    aput-object v7, v6, v3

    const/4 v7, 0x1

    aget-object v8, v1, v7

    aput-object v8, v6, v7

    const/4 v8, 0x2

    aget-object v9, v1, v8

    aput-object v9, v6, v8

    const/4 v9, 0x3

    aget-object v10, v1, v9

    aput-object v10, v6, v9

    const v10, 0x3e19999a    # 0.15f

    invoke-direct {v4, v10, v6}, Lcom/badlogic/gdx/graphics/g2d/Animation;-><init>(F[Ljava/lang/Object;)V

    iput-object v4, v0, Lcom/alles/platformer/MyPlatformer;->stand:Lcom/badlogic/gdx/graphics/g2d/Animation;

    .line 119
    new-instance v4, Lcom/badlogic/gdx/graphics/g2d/Animation;

    new-array v6, v7, [Ljava/lang/Object;

    const/16 v10, 0xe

    aget-object v10, v1, v10

    aput-object v10, v6, v3

    const/4 v10, 0x0

    invoke-direct {v4, v10, v6}, Lcom/badlogic/gdx/graphics/g2d/Animation;-><init>(F[Ljava/lang/Object;)V

    iput-object v4, v0, Lcom/alles/platformer/MyPlatformer;->jump:Lcom/badlogic/gdx/graphics/g2d/Animation;

    .line 120
    new-instance v4, Lcom/badlogic/gdx/graphics/g2d/Animation;

    const/4 v6, 0x6

    new-array v11, v6, [Ljava/lang/Object;

    aget-object v12, v1, v5

    aput-object v12, v11, v3

    const/4 v12, 0x5

    aget-object v13, v1, v12

    aput-object v13, v11, v7

    aget-object v13, v1, v6

    aput-object v13, v11, v8

    const/4 v13, 0x7

    aget-object v14, v1, v13

    aput-object v14, v11, v9

    const/16 v14, 0x8

    aget-object v15, v1, v14

    aput-object v15, v11, v5

    const/16 v15, 0x9

    aget-object v15, v1, v15

    aput-object v15, v11, v12

    const v15, 0x3da3d70a    # 0.08f

    invoke-direct {v4, v15, v11}, Lcom/badlogic/gdx/graphics/g2d/Animation;-><init>(F[Ljava/lang/Object;)V

    iput-object v4, v0, Lcom/alles/platformer/MyPlatformer;->walk:Lcom/badlogic/gdx/graphics/g2d/Animation;

    .line 121
    new-instance v4, Lcom/badlogic/gdx/graphics/g2d/Animation;

    new-array v11, v13, [Ljava/lang/Object;

    const/16 v13, 0x11

    aget-object v16, v1, v13

    aput-object v16, v11, v3

    const/16 v16, 0x12

    aget-object v16, v1, v16

    aput-object v16, v11, v7

    const/16 v16, 0x13

    aget-object v16, v1, v16

    aput-object v16, v11, v8

    const/16 v8, 0x14

    aget-object v8, v1, v8

    aput-object v8, v11, v9

    aget-object v8, v1, v2

    aput-object v8, v11, v5

    const/16 v5, 0x16

    aget-object v5, v1, v5

    aput-object v5, v11, v12

    const/16 v5, 0x17

    aget-object v5, v1, v5

    aput-object v5, v11, v6

    invoke-direct {v4, v15, v11}, Lcom/badlogic/gdx/graphics/g2d/Animation;-><init>(F[Ljava/lang/Object;)V

    iput-object v4, v0, Lcom/alles/platformer/MyPlatformer;->croutch:Lcom/badlogic/gdx/graphics/g2d/Animation;

    .line 122
    new-instance v4, Lcom/badlogic/gdx/graphics/g2d/Animation;

    new-array v5, v7, [Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    aget-object v6, v1, v13

    aput-object v6, v5, v3

    invoke-direct {v4, v10, v5}, Lcom/badlogic/gdx/graphics/g2d/Animation;-><init>(F[Ljava/lang/Object;)V

    iput-object v4, v0, Lcom/alles/platformer/MyPlatformer;->croutchStand:Lcom/badlogic/gdx/graphics/g2d/Animation;

    .line 124
    iget-object v4, v0, Lcom/alles/platformer/MyPlatformer;->walk:Lcom/badlogic/gdx/graphics/g2d/Animation;

    sget-object v5, Lcom/badlogic/gdx/graphics/g2d/Animation$PlayMode;->LOOP_PINGPONG:Lcom/badlogic/gdx/graphics/g2d/Animation$PlayMode;

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/graphics/g2d/Animation;->setPlayMode(Lcom/badlogic/gdx/graphics/g2d/Animation$PlayMode;)V

    .line 125
    iget-object v4, v0, Lcom/alles/platformer/MyPlatformer;->croutch:Lcom/badlogic/gdx/graphics/g2d/Animation;

    sget-object v5, Lcom/badlogic/gdx/graphics/g2d/Animation$PlayMode;->LOOP_PINGPONG:Lcom/badlogic/gdx/graphics/g2d/Animation$PlayMode;

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/graphics/g2d/Animation;->setPlayMode(Lcom/badlogic/gdx/graphics/g2d/Animation$PlayMode;)V

    .line 129
    aget-object v4, v1, v3

    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x3d800000    # 0.0625f

    mul-float v4, v4, v5

    sput v4, Lcom/alles/platformer/MyPlatformer$Koala;->WIDTH:F

    .line 130
    aget-object v1, v1, v3

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float v1, v1, v5

    sput v1, Lcom/alles/platformer/MyPlatformer$Koala;->HEIGHT:F

    .line 133
    new-instance v1, Lcom/badlogic/gdx/maps/tiled/TmxMapLoader;

    invoke-direct {v1}, Lcom/badlogic/gdx/maps/tiled/TmxMapLoader;-><init>()V

    const-string v4, "map.tmx"

    invoke-virtual {v1, v4}, Lcom/badlogic/gdx/maps/tiled/TmxMapLoader;->load(Ljava/lang/String;)Lcom/badlogic/gdx/maps/tiled/TiledMap;

    move-result-object v1

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    .line 136
    new-instance v1, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;

    iget-object v4, v0, Lcom/alles/platformer/MyPlatformer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-direct {v1, v4, v5}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;F)V

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer;->renderer:Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;

    .line 139
    new-instance v1, Lcom/badlogic/gdx/graphics/OrthographicCamera;

    invoke-direct {v1}, Lcom/badlogic/gdx/graphics/OrthographicCamera;-><init>()V

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer;->camera:Lcom/badlogic/gdx/graphics/OrthographicCamera;

    .line 140
    iget-object v1, v0, Lcom/alles/platformer/MyPlatformer;->camera:Lcom/badlogic/gdx/graphics/OrthographicCamera;

    const/high16 v4, 0x41f00000    # 30.0f

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-virtual {v1, v3, v4, v5}, Lcom/badlogic/gdx/graphics/OrthographicCamera;->setToOrtho(ZFF)V

    .line 141
    iget-object v1, v0, Lcom/alles/platformer/MyPlatformer;->camera:Lcom/badlogic/gdx/graphics/OrthographicCamera;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/OrthographicCamera;->update()V

    .line 144
    new-instance v1, Lcom/alles/platformer/MyPlatformer$Koala;

    invoke-direct {v1}, Lcom/alles/platformer/MyPlatformer$Koala;-><init>()V

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    .line 145
    iget-object v1, v0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v1, v1, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    const/high16 v4, 0x40400000    # 3.0f

    const/high16 v5, 0x42c80000    # 100.0f

    invoke-virtual {v1, v4, v5}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 148
    new-instance v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    invoke-direct {v1}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;-><init>()V

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer;->debugRenderer:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    .line 150
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    invoke-direct {v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;-><init>()V

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    .line 151
    iget-object v1, v0, Lcom/alles/platformer/MyPlatformer;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getData()Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    move-result-object v1

    const/high16 v4, 0x40000000    # 2.0f

    invoke-virtual {v1, v4}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->setScale(F)V

    .line 152
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;

    invoke-direct {v1}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;-><init>()V

    sput-object v1, Lcom/alles/platformer/MyPlatformer;->absoluteBatch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    .line 154
    new-instance v1, Lcom/badlogic/gdx/scenes/scene2d/Stage;

    new-instance v4, Lcom/badlogic/gdx/utils/viewport/ScreenViewport;

    invoke-direct {v4}, Lcom/badlogic/gdx/utils/viewport/ScreenViewport;-><init>()V

    invoke-direct {v1, v4}, Lcom/badlogic/gdx/scenes/scene2d/Stage;-><init>(Lcom/badlogic/gdx/utils/viewport/Viewport;)V

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer;->debugStage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    .line 156
    new-instance v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-direct {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;-><init>()V

    .line 158
    iget-object v4, v0, Lcom/alles/platformer/MyPlatformer;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    iput-object v4, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    .line 159
    sget-object v4, Lcom/badlogic/gdx/graphics/Color;->RED:Lcom/badlogic/gdx/graphics/Color;

    iput-object v4, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;->fontColor:Lcom/badlogic/gdx/graphics/Color;

    .line 161
    sget-object v4, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v4}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0xc

    .line 162
    sget-object v5, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v5}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0xc

    .line 164
    new-instance v5, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    const-string v6, "Jabba Dabba Duuu"

    invoke-direct {v5, v6, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;-><init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    iput-object v5, v0, Lcom/alles/platformer/MyPlatformer;->debugLabel:Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    .line 165
    iget-object v1, v0, Lcom/alles/platformer/MyPlatformer;->debugLabel:Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    sget-object v5, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v5}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v5

    int-to-float v5, v5

    int-to-float v4, v4

    invoke-virtual {v1, v5, v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setSize(FF)V

    .line 166
    iget-object v1, v0, Lcom/alles/platformer/MyPlatformer;->debugLabel:Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    const/high16 v4, 0x43fa0000    # 500.0f

    invoke-virtual {v1, v4, v10}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setPosition(FF)V

    .line 168
    iget-object v1, v0, Lcom/alles/platformer/MyPlatformer;->debugLabel:Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    invoke-virtual {v1, v14}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setAlignment(I)V

    .line 169
    iget-object v1, v0, Lcom/alles/platformer/MyPlatformer;->debugStage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    iget-object v4, v0, Lcom/alles/platformer/MyPlatformer;->debugLabel:Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    invoke-virtual {v1, v4}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 171
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer;->questionMarkTileMapping:Ljava/util/HashMap;

    .line 172
    iget-object v1, v0, Lcom/alles/platformer/MyPlatformer;->questionMarkTileMapping:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/16 v4, 0x80

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    iget-object v1, v0, Lcom/alles/platformer/MyPlatformer;->questionMarkTileMapping:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0xa0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    iget-object v1, v0, Lcom/alles/platformer/MyPlatformer;->questionMarkTileMapping:Ljava/util/HashMap;

    const/16 v2, 0x25

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0xb0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    iget-object v1, v0, Lcom/alles/platformer/MyPlatformer;->questionMarkTileMapping:Ljava/util/HashMap;

    const/16 v2, 0x61

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0xc0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    new-instance v1, Lcom/alles/platformer/Controller;

    invoke-direct {v1}, Lcom/alles/platformer/Controller;-><init>()V

    iput-object v1, v0, Lcom/alles/platformer/MyPlatformer;->controller:Lcom/alles/platformer/Controller;

    return-void
.end method

.method public dispose()V
    .locals 0

    return-void
.end method

.method public render()V
    .locals 3

    .line 183
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/high16 v1, 0x3f800000    # 1.0f

    const v2, 0x3f333333    # 0.7f

    invoke-interface {v0, v2, v2, v1, v1}, Lcom/badlogic/gdx/graphics/GL20;->glClearColor(FFFF)V

    .line 184
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v1, 0x4000

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glClear(I)V

    .line 187
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getDeltaTime()F

    move-result v0

    .line 190
    invoke-direct {p0, v0}, Lcom/alles/platformer/MyPlatformer;->updateKoala(F)V

    .line 193
    iget-object v1, p0, Lcom/alles/platformer/MyPlatformer;->camera:Lcom/badlogic/gdx/graphics/OrthographicCamera;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget-object v2, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v2, v2, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    iput v2, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    .line 194
    iget-object v1, p0, Lcom/alles/platformer/MyPlatformer;->camera:Lcom/badlogic/gdx/graphics/OrthographicCamera;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget-object v2, p0, Lcom/alles/platformer/MyPlatformer;->koala:Lcom/alles/platformer/MyPlatformer$Koala;

    iget-object v2, v2, Lcom/alles/platformer/MyPlatformer$Koala;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    iput v2, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 195
    iget-object v1, p0, Lcom/alles/platformer/MyPlatformer;->camera:Lcom/badlogic/gdx/graphics/OrthographicCamera;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/OrthographicCamera;->update()V

    .line 199
    iget-object v1, p0, Lcom/alles/platformer/MyPlatformer;->renderer:Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;

    iget-object v2, p0, Lcom/alles/platformer/MyPlatformer;->camera:Lcom/badlogic/gdx/graphics/OrthographicCamera;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->setView(Lcom/badlogic/gdx/graphics/OrthographicCamera;)V

    .line 200
    iget-object v1, p0, Lcom/alles/platformer/MyPlatformer;->renderer:Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;

    invoke-virtual {v1}, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->render()V

    .line 203
    invoke-direct {p0, v0}, Lcom/alles/platformer/MyPlatformer;->renderKoala(F)V

    .line 206
    iget-boolean v0, p0, Lcom/alles/platformer/MyPlatformer;->debug:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/alles/platformer/MyPlatformer;->renderDebug()V

    .line 208
    :cond_0
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->debugStage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->act()V

    .line 209
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->debugStage:Lcom/badlogic/gdx/scenes/scene2d/Stage;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->draw()V

    .line 211
    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {v0}, Lcom/badlogic/gdx/Application;->getType()Lcom/badlogic/gdx/Application$ApplicationType;

    move-result-object v0

    sget-object v1, Lcom/badlogic/gdx/Application$ApplicationType;->Android:Lcom/badlogic/gdx/Application$ApplicationType;

    if-ne v0, v1, :cond_1

    .line 212
    iget-object v0, p0, Lcom/alles/platformer/MyPlatformer;->controller:Lcom/alles/platformer/Controller;

    invoke-virtual {v0}, Lcom/alles/platformer/Controller;->draw()V

    :cond_1
    return-void
.end method
