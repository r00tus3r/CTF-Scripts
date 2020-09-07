.class public Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;
.super Lcom/badlogic/gdx/maps/objects/TextureMapObject;
.source "TiledMapTileMapObject.java"


# instance fields
.field private flipHorizontally:Z

.field private flipVertically:Z

.field private tile:Lcom/badlogic/gdx/maps/tiled/TiledMapTile;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMapTile;ZZ)V
    .locals 1

    .line 37
    invoke-direct {p0}, Lcom/badlogic/gdx/maps/objects/TextureMapObject;-><init>()V

    .line 38
    iput-boolean p2, p0, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->flipHorizontally:Z

    .line 39
    iput-boolean p3, p0, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->flipVertically:Z

    .line 40
    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->tile:Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    .line 42
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-interface {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 43
    invoke-virtual {v0, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->flip(ZZ)V

    .line 44
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->setTextureRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    return-void
.end method


# virtual methods
.method public getTile()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->tile:Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    return-object v0
.end method

.method public isFlipHorizontally()Z
    .locals 1

    .line 48
    iget-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->flipHorizontally:Z

    return v0
.end method

.method public isFlipVertically()Z
    .locals 1

    .line 56
    iget-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->flipVertically:Z

    return v0
.end method

.method public setFlipHorizontally(Z)V
    .locals 0

    .line 52
    iput-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->flipHorizontally:Z

    return-void
.end method

.method public setFlipVertically(Z)V
    .locals 0

    .line 60
    iput-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->flipVertically:Z

    return-void
.end method

.method public setTile(Lcom/badlogic/gdx/maps/tiled/TiledMapTile;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->tile:Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    return-void
.end method
