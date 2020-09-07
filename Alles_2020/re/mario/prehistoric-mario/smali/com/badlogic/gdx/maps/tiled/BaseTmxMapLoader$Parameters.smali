.class public Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;
.super Lcom/badlogic/gdx/assets/AssetLoaderParameters;
.source "BaseTmxMapLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Parameters"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/AssetLoaderParameters<",
        "Lcom/badlogic/gdx/maps/tiled/TiledMap;",
        ">;"
    }
.end annotation


# instance fields
.field public convertObjectToTileSpace:Z

.field public flipY:Z

.field public generateMipMaps:Z

.field public textureMagFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

.field public textureMinFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 37
    invoke-direct {p0}, Lcom/badlogic/gdx/assets/AssetLoaderParameters;-><init>()V

    const/4 v0, 0x0

    .line 39
    iput-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;->generateMipMaps:Z

    .line 41
    sget-object v1, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Nearest:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iput-object v1, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;->textureMinFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    .line 43
    sget-object v1, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Nearest:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iput-object v1, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;->textureMagFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    .line 45
    iput-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;->convertObjectToTileSpace:Z

    const/4 v0, 0x1

    .line 48
    iput-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;->flipY:Z

    return-void
.end method
