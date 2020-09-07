.class public abstract Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;
.super Ljava/lang/Object;
.source "BatchTiledMapRenderer.java"

# interfaces
.implements Lcom/badlogic/gdx/maps/tiled/TiledMapRenderer;
.implements Lcom/badlogic/gdx/utils/Disposable;


# static fields
.field protected static final NUM_VERTICES:I = 0x14


# instance fields
.field protected batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

.field protected imageBounds:Lcom/badlogic/gdx/math/Rectangle;

.field protected map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

.field protected ownsBatch:Z

.field protected unitScale:F

.field protected vertices:[F

.field protected viewBounds:Lcom/badlogic/gdx/math/Rectangle;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    .line 97
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;F)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;F)V
    .locals 1

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->imageBounds:Lcom/badlogic/gdx/math/Rectangle;

    const/16 v0, 0x14

    .line 74
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->vertices:[F

    .line 101
    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    .line 102
    iput p2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->unitScale:F

    .line 103
    new-instance p1, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    .line 104
    new-instance p1, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;

    invoke-direct {p1}, Lcom/badlogic/gdx/graphics/g2d/SpriteBatch;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    const/4 p1, 0x1

    .line 105
    iput-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->ownsBatch:Z

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;FLcom/badlogic/gdx/graphics/g2d/Batch;)V
    .locals 1

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->imageBounds:Lcom/badlogic/gdx/math/Rectangle;

    const/16 v0, 0x14

    .line 74
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->vertices:[F

    .line 113
    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    .line 114
    iput p2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->unitScale:F

    .line 115
    new-instance p1, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    .line 116
    iput-object p3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    const/4 p1, 0x0

    .line 117
    iput-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->ownsBatch:Z

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/graphics/g2d/Batch;)V
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    .line 109
    invoke-direct {p0, p1, v0, p2}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;FLcom/badlogic/gdx/graphics/g2d/Batch;)V

    return-void
.end method


# virtual methods
.method protected beginRender()V
    .locals 1

    .line 248
    invoke-static {}, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->updateAnimationBaseTime()V

    .line 249
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/g2d/Batch;->begin()V

    return-void
.end method

.method public dispose()V
    .locals 1

    .line 259
    iget-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->ownsBatch:Z

    if-eqz v0, :cond_0

    .line 260
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/g2d/Batch;->dispose()V

    :cond_0
    return-void
.end method

.method protected endRender()V
    .locals 1

    .line 254
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/g2d/Batch;->end()V

    return-void
.end method

.method public getBatch()Lcom/badlogic/gdx/graphics/g2d/Batch;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    return-object v0
.end method

.method public getMap()Lcom/badlogic/gdx/maps/tiled/TiledMap;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    return-object v0
.end method

.method public getUnitScale()F
    .locals 1

    .line 85
    iget v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->unitScale:F

    return v0
.end method

.method public getViewBounds()Lcom/badlogic/gdx/math/Rectangle;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    return-object v0
.end method

.method public render()V
    .locals 2

    .line 138
    invoke-virtual {p0}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->beginRender()V

    .line 139
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/MapLayers;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/maps/MapLayer;

    .line 140
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->renderMapLayer(Lcom/badlogic/gdx/maps/MapLayer;)V

    goto :goto_0

    .line 142
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->endRender()V

    return-void
.end method

.method public render([I)V
    .locals 4

    .line 147
    invoke-virtual {p0}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->beginRender()V

    .line 148
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p1, v1

    .line 149
    iget-object v3, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v3}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/maps/MapLayers;->get(I)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object v2

    .line 150
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->renderMapLayer(Lcom/badlogic/gdx/maps/MapLayer;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 152
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->endRender()V

    return-void
.end method

.method public renderImageLayer(Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;)V
    .locals 12

    .line 189
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/g2d/Batch;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    .line 190
    iget v1, v0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v2, v0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, v0, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v0, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 193
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->getOpacity()F

    move-result v4

    mul-float v0, v0, v4

    .line 190
    invoke-static {v1, v2, v3, v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits(FFFF)F

    move-result v0

    .line 195
    iget-object v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->vertices:[F

    .line 197
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v2

    if-nez v2, :cond_0

    return-void

    .line 203
    :cond_0
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->getX()F

    move-result v3

    .line 204
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->getY()F

    move-result p1

    .line 205
    iget v4, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->unitScale:F

    mul-float v3, v3, v4

    mul-float p1, p1, v4

    .line 207
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->unitScale:F

    mul-float v4, v4, v5

    add-float/2addr v4, v3

    .line 208
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v5

    int-to-float v5, v5

    iget v6, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->unitScale:F

    mul-float v5, v5, v6

    add-float/2addr v5, p1

    .line 210
    iget-object v6, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->imageBounds:Lcom/badlogic/gdx/math/Rectangle;

    sub-float v7, v4, v3

    sub-float v8, v5, p1

    invoke-virtual {v6, v3, p1, v7, v8}, Lcom/badlogic/gdx/math/Rectangle;->set(FFFF)Lcom/badlogic/gdx/math/Rectangle;

    .line 212
    iget-object v6, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v7, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->imageBounds:Lcom/badlogic/gdx/math/Rectangle;

    invoke-virtual {v6, v7}, Lcom/badlogic/gdx/math/Rectangle;->contains(Lcom/badlogic/gdx/math/Rectangle;)Z

    move-result v6

    if-nez v6, :cond_1

    iget-object v6, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v7, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->imageBounds:Lcom/badlogic/gdx/math/Rectangle;

    invoke-virtual {v6, v7}, Lcom/badlogic/gdx/math/Rectangle;->overlaps(Lcom/badlogic/gdx/math/Rectangle;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 213
    :cond_1
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU()F

    move-result v6

    .line 214
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV2()F

    move-result v7

    .line 215
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU2()F

    move-result v8

    .line 216
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV()F

    move-result v9

    const/4 v10, 0x0

    .line 218
    aput v3, v1, v10

    const/4 v11, 0x1

    .line 219
    aput p1, v1, v11

    const/4 v11, 0x2

    .line 220
    aput v0, v1, v11

    const/4 v11, 0x3

    .line 221
    aput v6, v1, v11

    const/4 v11, 0x4

    .line 222
    aput v7, v1, v11

    const/4 v11, 0x5

    .line 224
    aput v3, v1, v11

    const/4 v3, 0x6

    .line 225
    aput v5, v1, v3

    const/4 v3, 0x7

    .line 226
    aput v0, v1, v3

    const/16 v3, 0x8

    .line 227
    aput v6, v1, v3

    const/16 v3, 0x9

    .line 228
    aput v9, v1, v3

    const/16 v3, 0xa

    .line 230
    aput v4, v1, v3

    const/16 v3, 0xb

    .line 231
    aput v5, v1, v3

    const/16 v3, 0xc

    .line 232
    aput v0, v1, v3

    const/16 v3, 0xd

    .line 233
    aput v8, v1, v3

    const/16 v3, 0xe

    .line 234
    aput v9, v1, v3

    const/16 v3, 0xf

    .line 236
    aput v4, v1, v3

    const/16 v3, 0x10

    .line 237
    aput p1, v1, v3

    const/16 p1, 0x11

    .line 238
    aput v0, v1, p1

    const/16 p1, 0x12

    .line 239
    aput v8, v1, p1

    const/16 p1, 0x13

    .line 240
    aput v7, v1, p1

    .line 242
    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v0

    const/16 v2, 0x14

    invoke-interface {p1, v0, v1, v10, v2}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    :cond_2
    return-void
.end method

.method protected renderMapLayer(Lcom/badlogic/gdx/maps/MapLayer;)V
    .locals 3

    .line 156
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/MapLayer;->isVisible()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 157
    :cond_0
    instance-of v0, p1, Lcom/badlogic/gdx/maps/MapGroupLayer;

    if-eqz v0, :cond_2

    .line 158
    check-cast p1, Lcom/badlogic/gdx/maps/MapGroupLayer;

    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/MapGroupLayer;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object p1

    const/4 v0, 0x0

    .line 159
    :goto_0
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/MapLayers;->size()I

    move-result v1

    if-ge v0, v1, :cond_5

    .line 160
    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/maps/MapLayers;->get(I)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object v1

    .line 161
    invoke-virtual {v1}, Lcom/badlogic/gdx/maps/MapLayer;->isVisible()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    .line 162
    :cond_1
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->renderMapLayer(Lcom/badlogic/gdx/maps/MapLayer;)V

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 165
    :cond_2
    instance-of v0, p1, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    if-eqz v0, :cond_3

    .line 166
    check-cast p1, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->renderTileLayer(Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;)V

    goto :goto_2

    .line 167
    :cond_3
    instance-of v0, p1, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;

    if-eqz v0, :cond_4

    .line 168
    check-cast p1, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->renderImageLayer(Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;)V

    goto :goto_2

    .line 170
    :cond_4
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->renderObjects(Lcom/badlogic/gdx/maps/MapLayer;)V

    :cond_5
    :goto_2
    return-void
.end method

.method public renderObject(Lcom/badlogic/gdx/maps/MapObject;)V
    .locals 0

    return-void
.end method

.method public renderObjects(Lcom/badlogic/gdx/maps/MapLayer;)V
    .locals 1

    .line 177
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/MapLayer;->getObjects()Lcom/badlogic/gdx/maps/MapObjects;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/MapObjects;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/maps/MapObject;

    .line 178
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->renderObject(Lcom/badlogic/gdx/maps/MapObject;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setMap(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    return-void
.end method

.method public setView(Lcom/badlogic/gdx/graphics/OrthographicCamera;)V
    .locals 6

    .line 122
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->combined:Lcom/badlogic/gdx/math/Matrix4;

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setProjectionMatrix(Lcom/badlogic/gdx/math/Matrix4;)V

    .line 123
    iget v0, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportWidth:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    mul-float v0, v0, v1

    .line 124
    iget v1, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportHeight:F

    iget v2, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    mul-float v1, v1, v2

    .line 125
    iget-object v2, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->up:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector3;->y:F

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    mul-float v2, v2, v0

    iget-object v3, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->up:Lcom/badlogic/gdx/math/Vector3;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector3;->x:F

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    mul-float v3, v3, v1

    add-float/2addr v2, v3

    .line 126
    iget-object v3, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->up:Lcom/badlogic/gdx/math/Vector3;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector3;->y:F

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    mul-float v1, v1, v3

    iget-object v3, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->up:Lcom/badlogic/gdx/math/Vector3;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector3;->x:F

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    mul-float v0, v0, v3

    add-float/2addr v1, v0

    .line 127
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget-object v3, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/high16 v4, 0x40000000    # 2.0f

    div-float v5, v2, v4

    sub-float/2addr v3, v5

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/OrthographicCamera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    div-float v4, v1, v4

    sub-float/2addr p1, v4

    invoke-virtual {v0, v3, p1, v2, v1}, Lcom/badlogic/gdx/math/Rectangle;->set(FFFF)Lcom/badlogic/gdx/math/Rectangle;

    return-void
.end method

.method public setView(Lcom/badlogic/gdx/math/Matrix4;FFFF)V
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-interface {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setProjectionMatrix(Lcom/badlogic/gdx/math/Matrix4;)V

    .line 133
    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    invoke-virtual {p1, p2, p3, p4, p5}, Lcom/badlogic/gdx/math/Rectangle;->set(FFFF)Lcom/badlogic/gdx/math/Rectangle;

    return-void
.end method
