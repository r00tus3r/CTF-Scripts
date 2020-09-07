.class public Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;
.super Ljava/lang/Object;
.source "TextureProvider.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FileTextureProvider"
.end annotation


# instance fields
.field private magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

.field private minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

.field private uWrap:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

.field private useMipMaps:Z

.field private vWrap:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    sget-object v0, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Linear:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    .line 37
    sget-object v0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->Repeat:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->vWrap:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->uWrap:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    const/4 v0, 0x0

    .line 38
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->useMipMaps:Z

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureWrap;Lcom/badlogic/gdx/graphics/Texture$TextureWrap;Z)V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    .line 44
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    .line 45
    iput-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->uWrap:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    .line 46
    iput-object p4, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->vWrap:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    .line 47
    iput-boolean p5, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->useMipMaps:Z

    return-void
.end method


# virtual methods
.method public load(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/Texture;
    .locals 2

    .line 52
    new-instance v0, Lcom/badlogic/gdx/graphics/Texture;

    sget-object v1, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    invoke-interface {v1, p1}, Lcom/badlogic/gdx/Files;->internal(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p1

    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->useMipMaps:Z

    invoke-direct {v0, p1, v1}, Lcom/badlogic/gdx/graphics/Texture;-><init>(Lcom/badlogic/gdx/files/FileHandle;Z)V

    .line 53
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/graphics/Texture;->setFilter(Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;)V

    .line 54
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->uWrap:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;->vWrap:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/graphics/Texture;->setWrap(Lcom/badlogic/gdx/graphics/Texture$TextureWrap;Lcom/badlogic/gdx/graphics/Texture$TextureWrap;)V

    return-object v0
.end method
