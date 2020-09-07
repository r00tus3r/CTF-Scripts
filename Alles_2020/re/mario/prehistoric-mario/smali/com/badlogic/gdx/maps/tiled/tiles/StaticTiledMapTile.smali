.class public Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;
.super Ljava/lang/Object;
.source "StaticTiledMapTile.java"

# interfaces
.implements Lcom/badlogic/gdx/maps/tiled/TiledMapTile;


# instance fields
.field private blendMode:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

.field private id:I

.field private objects:Lcom/badlogic/gdx/maps/MapObjects;

.field private offsetX:F

.field private offsetY:F

.field private properties:Lcom/badlogic/gdx/maps/MapProperties;

.field private textureRegion:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 1

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    sget-object v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;->ALPHA:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->blendMode:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    .line 111
    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->textureRegion:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;)V
    .locals 2

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    sget-object v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;->ALPHA:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->blendMode:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    .line 118
    iget-object v0, p1, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->properties:Lcom/badlogic/gdx/maps/MapProperties;

    if-eqz v0, :cond_0

    .line 119
    invoke-virtual {p0}, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v0

    iget-object v1, p1, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->properties:Lcom/badlogic/gdx/maps/MapProperties;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/maps/MapProperties;->putAll(Lcom/badlogic/gdx/maps/MapProperties;)V

    .line 121
    :cond_0
    iget-object v0, p1, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->objects:Lcom/badlogic/gdx/maps/MapObjects;

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->objects:Lcom/badlogic/gdx/maps/MapObjects;

    .line 122
    iget-object v0, p1, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->textureRegion:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->textureRegion:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    .line 123
    iget p1, p1, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->id:I

    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->id:I

    return-void
.end method


# virtual methods
.method public getBlendMode()Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->blendMode:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .line 43
    iget v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->id:I

    return v0
.end method

.method public getObjects()Lcom/badlogic/gdx/maps/MapObjects;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->objects:Lcom/badlogic/gdx/maps/MapObjects;

    if-nez v0, :cond_0

    .line 72
    new-instance v0, Lcom/badlogic/gdx/maps/MapObjects;

    invoke-direct {v0}, Lcom/badlogic/gdx/maps/MapObjects;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->objects:Lcom/badlogic/gdx/maps/MapObjects;

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->objects:Lcom/badlogic/gdx/maps/MapObjects;

    return-object v0
.end method

.method public getOffsetX()F
    .locals 1

    .line 89
    iget v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->offsetX:F

    return v0
.end method

.method public getOffsetY()F
    .locals 1

    .line 99
    iget v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->offsetY:F

    return v0
.end method

.method public getProperties()Lcom/badlogic/gdx/maps/MapProperties;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->properties:Lcom/badlogic/gdx/maps/MapProperties;

    if-nez v0, :cond_0

    .line 64
    new-instance v0, Lcom/badlogic/gdx/maps/MapProperties;

    invoke-direct {v0}, Lcom/badlogic/gdx/maps/MapProperties;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->properties:Lcom/badlogic/gdx/maps/MapProperties;

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->properties:Lcom/badlogic/gdx/maps/MapProperties;

    return-object v0
.end method

.method public getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->textureRegion:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    return-object v0
.end method

.method public setBlendMode(Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;)V
    .locals 0

    .line 58
    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->blendMode:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    return-void
.end method

.method public setId(I)V
    .locals 0

    .line 48
    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->id:I

    return-void
.end method

.method public setOffsetX(F)V
    .locals 0

    .line 94
    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->offsetX:F

    return-void
.end method

.method public setOffsetY(F)V
    .locals 0

    .line 104
    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->offsetY:F

    return-void
.end method

.method public setTextureRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 0

    .line 84
    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;->textureRegion:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    return-void
.end method
