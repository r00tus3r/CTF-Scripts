.class public Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;
.super Lcom/brashmonkey/spriter/Loader;
.source "LibGdxLoader.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/brashmonkey/spriter/Loader<",
        "Lcom/badlogic/gdx/graphics/g2d/Sprite;",
        ">;",
        "Lcom/badlogic/gdx/utils/Disposable;"
    }
.end annotation


# static fields
.field public static standardAtlasHeight:I = 0x800

.field public static standardAtlasWidth:I = 0x800


# instance fields
.field private atlasHeight:I

.field private atlasWidth:I

.field private pack:Z

.field private packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

.field private pixmaps:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/brashmonkey/spriter/FileReference;",
            "Lcom/badlogic/gdx/graphics/Pixmap;",
            ">;"
        }
    .end annotation
.end field

.field private pixmapsToDispose:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/badlogic/gdx/graphics/Pixmap;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Data;)V
    .locals 1

    const/4 v0, 0x1

    .line 34
    invoke-direct {p0, p1, v0}, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;-><init>(Lcom/brashmonkey/spriter/Data;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Data;II)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lcom/brashmonkey/spriter/Loader;-><init>(Lcom/brashmonkey/spriter/Data;)V

    const/4 p1, 0x1

    .line 44
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pack:Z

    .line 45
    iput p2, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->atlasWidth:I

    .line 46
    iput p3, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->atlasHeight:I

    .line 47
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pixmaps:Ljava/util/HashMap;

    .line 48
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pixmapsToDispose:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Data;Z)V
    .locals 2

    .line 38
    sget v0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->standardAtlasWidth:I

    sget v1, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->standardAtlasHeight:I

    invoke-direct {p0, p1, v0, v1}, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;-><init>(Lcom/brashmonkey/spriter/Data;II)V

    .line 39
    iput-boolean p2, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pack:Z

    return-void
.end method

.method private disposeNonPackedTextures()V
    .locals 2

    .line 88
    iget-object v0, p0, Lcom/brashmonkey/spriter/Loader;->resources:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 89
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v1

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Texture;->dispose()V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method protected createSprite(Lcom/brashmonkey/spriter/FileReference;Lcom/badlogic/gdx/graphics/Pixmap;)V
    .locals 5

    .line 113
    new-instance v0, Lcom/badlogic/gdx/graphics/Texture;

    invoke-direct {v0, p2}, Lcom/badlogic/gdx/graphics/Texture;-><init>(Lcom/badlogic/gdx/graphics/Pixmap;)V

    .line 114
    sget-object v1, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Linear:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    sget-object v2, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Linear:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/Texture;->setFilter(Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;)V

    .line 115
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->data:Lcom/brashmonkey/spriter/Data;

    iget v2, p1, Lcom/brashmonkey/spriter/FileReference;->folder:I

    iget v3, p1, Lcom/brashmonkey/spriter/FileReference;->file:I

    invoke-virtual {v1, v2, v3}, Lcom/brashmonkey/spriter/Data;->getFile(II)Lcom/brashmonkey/spriter/File;

    move-result-object v1

    iget-object v1, v1, Lcom/brashmonkey/spriter/File;->size:Lcom/brashmonkey/spriter/Dimension;

    iget v1, v1, Lcom/brashmonkey/spriter/Dimension;->width:F

    float-to-int v1, v1

    .line 116
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->data:Lcom/brashmonkey/spriter/Data;

    iget v3, p1, Lcom/brashmonkey/spriter/FileReference;->folder:I

    iget v4, p1, Lcom/brashmonkey/spriter/FileReference;->file:I

    invoke-virtual {v2, v3, v4}, Lcom/brashmonkey/spriter/Data;->getFile(II)Lcom/brashmonkey/spriter/File;

    move-result-object v2

    iget-object v2, v2, Lcom/brashmonkey/spriter/File;->size:Lcom/brashmonkey/spriter/Dimension;

    iget v2, v2, Lcom/brashmonkey/spriter/Dimension;->height:F

    float-to-int v2, v2

    .line 117
    new-instance v3, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-direct {v3, v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/Texture;II)V

    .line 118
    iget-object v0, p0, Lcom/brashmonkey/spriter/Loader;->resources:Ljava/util/HashMap;

    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    invoke-direct {v1, v3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pixmapsToDispose:Ljava/util/HashMap;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public dispose()V
    .locals 1

    .line 94
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pack:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->dispose()V

    goto :goto_0

    .line 95
    :cond_0
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->disposeNonPackedTextures()V

    .line 96
    :goto_0
    invoke-super {p0}, Lcom/brashmonkey/spriter/Loader;->dispose()V

    return-void
.end method

.method protected disposePixmaps()V
    .locals 7

    .line 123
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pixmapsToDispose:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    new-array v0, v0, [Lcom/badlogic/gdx/graphics/Pixmap;

    .line 124
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pixmapsToDispose:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 125
    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 127
    :goto_1
    :try_start_0
    iget-object v5, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pixmapsToDispose:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 128
    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/Pixmap;->dispose()V

    .line 129
    iget-object v5, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pixmapsToDispose:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/badlogic/gdx/utils/GdxRuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 132
    :catch_0
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v5, "Pixmap was already disposed!"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 135
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pixmapsToDispose:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void
.end method

.method protected finishLoading()V
    .locals 5

    .line 100
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->resources:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 101
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/FileReference;

    .line 102
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pixmaps:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/Pixmap;

    .line 103
    iget-object v3, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pixmapsToDispose:Ljava/util/HashMap;

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    invoke-virtual {p0, v1, v2}, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->createSprite(Lcom/brashmonkey/spriter/FileReference;Lcom/badlogic/gdx/graphics/Pixmap;)V

    .line 106
    iget-object v3, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    if-eqz v3, :cond_0

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->data:Lcom/brashmonkey/spriter/Data;

    invoke-virtual {v4, v1}, Lcom/brashmonkey/spriter/Data;->getFile(Lcom/brashmonkey/spriter/FileReference;)Lcom/brashmonkey/spriter/File;

    move-result-object v1

    iget-object v1, v1, Lcom/brashmonkey/spriter/File;->name:Ljava/lang/String;

    invoke-virtual {v3, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->pack(Ljava/lang/String;Lcom/badlogic/gdx/graphics/Pixmap;)Lcom/badlogic/gdx/math/Rectangle;

    goto :goto_0

    .line 108
    :cond_1
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pack:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->generatePackedSprites()V

    .line 109
    :cond_2
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->disposePixmaps()V

    return-void
.end method

.method protected generatePackedSprites()V
    .locals 6

    .line 75
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    if-nez v0, :cond_0

    return-void

    .line 76
    :cond_0
    sget-object v1, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Linear:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    sget-object v2, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Linear:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;->generateTextureAtlas(Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Z)Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    move-result-object v0

    .line 77
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->resources:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 78
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->disposeNonPackedTextures()V

    .line 79
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/brashmonkey/spriter/FileReference;

    .line 80
    iget-object v3, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->data:Lcom/brashmonkey/spriter/Data;

    invoke-virtual {v3, v2}, Lcom/brashmonkey/spriter/Data;->getFile(Lcom/brashmonkey/spriter/FileReference;)Lcom/brashmonkey/spriter/File;

    move-result-object v3

    iget-object v3, v3, Lcom/brashmonkey/spriter/File;->name:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;->findRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    move-result-object v3

    .line 81
    iget-object v4, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->data:Lcom/brashmonkey/spriter/Data;

    invoke-virtual {v4, v2}, Lcom/brashmonkey/spriter/Data;->getFile(Lcom/brashmonkey/spriter/FileReference;)Lcom/brashmonkey/spriter/File;

    move-result-object v4

    iget-object v4, v4, Lcom/brashmonkey/spriter/File;->size:Lcom/brashmonkey/spriter/Dimension;

    iget v4, v4, Lcom/brashmonkey/spriter/Dimension;->width:F

    float-to-int v4, v4

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setRegionWidth(I)V

    .line 82
    iget-object v4, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->data:Lcom/brashmonkey/spriter/Data;

    invoke-virtual {v4, v2}, Lcom/brashmonkey/spriter/Data;->getFile(Lcom/brashmonkey/spriter/FileReference;)Lcom/brashmonkey/spriter/File;

    move-result-object v4

    iget-object v4, v4, Lcom/brashmonkey/spriter/File;->size:Lcom/brashmonkey/spriter/Dimension;

    iget v4, v4, Lcom/brashmonkey/spriter/Dimension;->height:F

    float-to-int v4, v4

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setRegionHeight(I)V

    .line 83
    iget-object v4, p0, Lcom/brashmonkey/spriter/Loader;->resources:Ljava/util/HashMap;

    new-instance v5, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    invoke-direct {v5, v3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    invoke-virtual {v4, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected loadResource(Lcom/brashmonkey/spriter/FileReference;)Lcom/badlogic/gdx/graphics/g2d/Sprite;
    .locals 8

    .line 55
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->data:Lcom/brashmonkey/spriter/Data;

    invoke-virtual {v1, p1}, Lcom/brashmonkey/spriter/Data;->getFile(Lcom/brashmonkey/spriter/FileReference;)Lcom/brashmonkey/spriter/File;

    move-result-object v1

    iget-object v1, v1, Lcom/brashmonkey/spriter/File;->name:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/brashmonkey/spriter/Loader;->root:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 58
    sget-object v1, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader$1;->$SwitchMap$com$badlogic$gdx$Application$ApplicationType:[I

    sget-object v2, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {v2}, Lcom/badlogic/gdx/Application;->getType()Lcom/badlogic/gdx/Application$ApplicationType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/badlogic/gdx/Application$ApplicationType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 60
    sget-object v1, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/Files;->internal(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v1

    goto :goto_0

    .line 59
    :cond_0
    sget-object v1, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/Files;->absolute(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v1

    .line 63
    :goto_0
    invoke-virtual {v1}, Lcom/badlogic/gdx/files/FileHandle;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 64
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pack:Z

    if-eqz v0, :cond_1

    .line 65
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    iget v3, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->atlasWidth:I

    iget v4, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->atlasHeight:I

    sget-object v5, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    const/4 v6, 0x2

    const/4 v7, 0x1

    move-object v2, v0

    invoke-direct/range {v2 .. v7}, Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;-><init>(IILcom/badlogic/gdx/graphics/Pixmap$Format;IZ)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->packer:Lcom/badlogic/gdx/graphics/g2d/PixmapPacker;

    .line 66
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/graphics/Pixmap;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/Pixmap;-><init>(Lcom/badlogic/gdx/files/FileHandle;)V

    .line 67
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->pixmaps:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x0

    return-object p1

    .line 63
    :cond_2
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not find file handle "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "! Please check your paths."

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected bridge synthetic loadResource(Lcom/brashmonkey/spriter/FileReference;)Ljava/lang/Object;
    .locals 0

    .line 23
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->loadResource(Lcom/brashmonkey/spriter/FileReference;)Lcom/badlogic/gdx/graphics/g2d/Sprite;

    move-result-object p1

    return-object p1
.end method
