.class public Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;
.super Lcom/badlogic/gdx/maps/MapLayer;
.source "TiledMapImageLayer.java"


# instance fields
.field private region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

.field private x:F

.field private y:F


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FF)V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/badlogic/gdx/maps/MapLayer;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    .line 31
    iput p2, p0, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->x:F

    .line 32
    iput p3, p0, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->y:F

    return-void
.end method


# virtual methods
.method public getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    return-object v0
.end method

.method public getX()F
    .locals 1

    .line 44
    iget v0, p0, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->x:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 52
    iget v0, p0, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->y:F

    return v0
.end method

.method public setTextureRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 0

    .line 40
    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    return-void
.end method

.method public setX(F)V
    .locals 0

    .line 48
    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->x:F

    return-void
.end method

.method public setY(F)V
    .locals 0

    .line 56
    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->y:F

    return-void
.end method
