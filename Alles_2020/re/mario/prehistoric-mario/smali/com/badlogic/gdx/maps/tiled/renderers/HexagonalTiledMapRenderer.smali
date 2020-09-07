.class public Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;
.super Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;
.source "HexagonalTiledMapRenderer.java"


# instance fields
.field private hexSideLength:F

.field private staggerAxisX:Z

.field private staggerIndexEven:Z


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V
    .locals 1

    .line 42
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V

    const/4 v0, 0x1

    .line 32
    iput-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerAxisX:Z

    const/4 v0, 0x0

    .line 34
    iput-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerIndexEven:Z

    const/4 v0, 0x0

    .line 39
    iput v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->hexSideLength:F

    .line 43
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->init(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;F)V
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;F)V

    const/4 p2, 0x1

    .line 32
    iput-boolean p2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerAxisX:Z

    const/4 p2, 0x0

    .line 34
    iput-boolean p2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerIndexEven:Z

    const/4 p2, 0x0

    .line 39
    iput p2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->hexSideLength:F

    .line 48
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->init(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;FLcom/badlogic/gdx/graphics/g2d/Batch;)V
    .locals 0

    .line 57
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;FLcom/badlogic/gdx/graphics/g2d/Batch;)V

    const/4 p2, 0x1

    .line 32
    iput-boolean p2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerAxisX:Z

    const/4 p2, 0x0

    .line 34
    iput-boolean p2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerIndexEven:Z

    const/4 p2, 0x0

    .line 39
    iput p2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->hexSideLength:F

    .line 58
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->init(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/graphics/g2d/Batch;)V
    .locals 0

    .line 52
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/graphics/g2d/Batch;)V

    const/4 p2, 0x1

    .line 32
    iput-boolean p2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerAxisX:Z

    const/4 p2, 0x0

    .line 34
    iput-boolean p2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerIndexEven:Z

    const/4 p2, 0x0

    .line 39
    iput p2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->hexSideLength:F

    .line 53
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->init(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V

    return-void
.end method

.method private init(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V
    .locals 5

    .line 62
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v0

    const-class v1, Ljava/lang/String;

    const-string v2, "staggeraxis"

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/maps/MapProperties;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    const-string v3, "x"

    .line 64
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    iput-boolean v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerAxisX:Z

    goto :goto_0

    .line 67
    :cond_0
    iput-boolean v2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerAxisX:Z

    .line 71
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v0

    const-class v3, Ljava/lang/String;

    const-string v4, "staggerindex"

    invoke-virtual {v0, v4, v3}, Lcom/badlogic/gdx/maps/MapProperties;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_3

    const-string v3, "even"

    .line 73
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 74
    iput-boolean v1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerIndexEven:Z

    goto :goto_1

    .line 76
    :cond_2
    iput-boolean v2, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerIndexEven:Z

    .line 80
    :cond_3
    :goto_1
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v0

    const-class v1, Ljava/lang/Integer;

    const-string v3, "hexsidelength"

    invoke-virtual {v0, v3, v1}, Lcom/badlogic/gdx/maps/MapProperties;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_4

    .line 82
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->hexSideLength:F

    goto :goto_2

    .line 84
    :cond_4
    iget-boolean v0, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerAxisX:Z

    const/high16 v1, 0x3f000000    # 0.5f

    if-eqz v0, :cond_6

    .line 85
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v0

    const-class v3, Ljava/lang/Integer;

    const-string v4, "tilewidth"

    invoke-virtual {v0, v4, v3}, Lcom/badlogic/gdx/maps/MapProperties;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_5

    .line 87
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-float p1, p1

    mul-float p1, p1, v1

    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->hexSideLength:F

    goto :goto_2

    .line 89
    :cond_5
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/maps/MapLayers;->get(I)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    .line 90
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getTileWidth()F

    move-result p1

    mul-float p1, p1, v1

    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->hexSideLength:F

    goto :goto_2

    .line 93
    :cond_6
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v0

    const-class v3, Ljava/lang/Integer;

    const-string v4, "tileheight"

    invoke-virtual {v0, v4, v3}, Lcom/badlogic/gdx/maps/MapProperties;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_7

    .line 95
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p1

    int-to-float p1, p1

    mul-float p1, p1, v1

    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->hexSideLength:F

    goto :goto_2

    .line 97
    :cond_7
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/maps/MapLayers;->get(I)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    .line 98
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getTileHeight()F

    move-result p1

    mul-float p1, p1, v1

    iput p1, p0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->hexSideLength:F

    :goto_2
    return-void
.end method

.method private renderCell(Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;FFF)V
    .locals 19

    move-object/from16 v0, p0

    if-eqz p1, :cond_4

    .line 179
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getTile()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 181
    instance-of v2, v1, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;

    if-eqz v2, :cond_0

    return-void

    .line 183
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getFlipHorizontally()Z

    move-result v2

    .line 184
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getFlipVertically()Z

    move-result v3

    .line 185
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getRotation()I

    move-result v4

    .line 187
    invoke-interface {v1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v5

    .line 189
    invoke-interface {v1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getOffsetX()F

    move-result v6

    iget v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->unitScale:F

    mul-float v6, v6, v7

    add-float v6, p2, v6

    .line 190
    invoke-interface {v1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getOffsetY()F

    move-result v1

    iget v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->unitScale:F

    mul-float v1, v1, v7

    add-float v1, p3, v1

    .line 191
    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v7

    int-to-float v7, v7

    iget v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->unitScale:F

    mul-float v7, v7, v8

    add-float/2addr v7, v6

    .line 192
    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v8

    int-to-float v8, v8

    iget v9, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->unitScale:F

    mul-float v8, v8, v9

    add-float/2addr v8, v1

    .line 194
    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU()F

    move-result v9

    .line 195
    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV2()F

    move-result v10

    .line 196
    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU2()F

    move-result v11

    .line 197
    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV()F

    move-result v12

    .line 199
    iget-object v13, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/4 v14, 0x0

    aput v6, v13, v14

    .line 200
    iget-object v13, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/4 v15, 0x1

    aput v1, v13, v15

    .line 201
    iget-object v13, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/4 v15, 0x2

    aput p4, v13, v15

    .line 202
    iget-object v13, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v16, 0x3

    aput v9, v13, v16

    .line 203
    iget-object v13, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v17, 0x4

    aput v10, v13, v17

    .line 205
    iget-object v13, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v18, 0x5

    aput v6, v13, v18

    .line 206
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/4 v13, 0x6

    aput v8, v6, v13

    .line 207
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/4 v13, 0x7

    aput p4, v6, v13

    .line 208
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v13, 0x8

    aput v9, v6, v13

    .line 209
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v9, 0x9

    aput v12, v6, v9

    .line 211
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v18, 0xa

    aput v7, v6, v18

    .line 212
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v18, 0xb

    aput v8, v6, v18

    .line 213
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v8, 0xc

    aput p4, v6, v8

    .line 214
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v8, 0xd

    aput v11, v6, v8

    .line 215
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v18, 0xe

    aput v12, v6, v18

    .line 217
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v12, 0xf

    aput v7, v6, v12

    .line 218
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v7, 0x10

    aput v1, v6, v7

    .line 219
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v6, 0x11

    aput p4, v1, v6

    .line 220
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v6, 0x12

    aput v11, v1, v6

    .line 221
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v7, 0x13

    aput v10, v1, v7

    if-eqz v2, :cond_1

    .line 224
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v1, v1, v16

    .line 225
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    iget-object v10, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v10, v10, v8

    aput v10, v2, v16

    .line 226
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aput v1, v2, v8

    .line 227
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v1, v1, v13

    .line 228
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    iget-object v10, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v10, v10, v6

    aput v10, v2, v13

    .line 229
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aput v1, v2, v6

    :cond_1
    if-eqz v3, :cond_2

    .line 232
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v1, v1, v17

    .line 233
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    iget-object v3, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v3, v3, v18

    aput v3, v2, v17

    .line 234
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aput v1, v2, v18

    .line 235
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v1, v1, v9

    .line 236
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    iget-object v3, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v3, v3, v7

    aput v3, v2, v9

    .line 237
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aput v1, v2, v7

    :cond_2
    if-ne v4, v15, :cond_3

    .line 240
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v1, v1, v16

    .line 241
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    iget-object v3, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v3, v3, v8

    aput v3, v2, v16

    .line 242
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aput v1, v2, v8

    .line 243
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v1, v1, v13

    .line 244
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    iget-object v3, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v3, v3, v6

    aput v3, v2, v13

    .line 245
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aput v1, v2, v6

    .line 246
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v1, v1, v17

    .line 247
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    iget-object v3, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v3, v3, v18

    aput v3, v2, v17

    .line 248
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aput v1, v2, v18

    .line 249
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v1, v1, v9

    .line 250
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    iget-object v3, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aget v3, v3, v7

    aput v3, v2, v9

    .line 251
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    aput v1, v2, v7

    .line 253
    :cond_3
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v2

    iget-object v3, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->vertices:[F

    const/16 v4, 0x14

    invoke-interface {v1, v2, v3, v14, v4}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    :cond_4
    return-void
.end method


# virtual methods
.method public renderTileLayer(Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 106
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-interface {v2}, Lcom/badlogic/gdx/graphics/g2d/Batch;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v2

    .line 107
    iget v3, v2, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v4, v2, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v5, v2, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v2, v2, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getOpacity()F

    move-result v6

    mul-float v2, v2, v6

    invoke-static {v3, v4, v5, v2}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits(FFFF)F

    move-result v2

    .line 109
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getWidth()I

    move-result v3

    .line 110
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getHeight()I

    move-result v4

    .line 112
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getTileWidth()F

    move-result v5

    iget v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->unitScale:F

    mul-float v5, v5, v6

    .line 113
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getTileHeight()F

    move-result v6

    iget v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->unitScale:F

    mul-float v6, v6, v7

    .line 115
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getRenderOffsetX()F

    move-result v7

    iget v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->unitScale:F

    mul-float v7, v7, v8

    .line 117
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getRenderOffsetY()F

    move-result v8

    neg-float v8, v8

    iget v9, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->unitScale:F

    mul-float v8, v8, v9

    .line 119
    iget v9, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->hexSideLength:F

    iget v10, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->unitScale:F

    mul-float v9, v9, v10

    .line 121
    iget-boolean v10, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerAxisX:Z

    const/high16 v11, 0x3f000000    # 0.5f

    const/high16 v12, 0x40000000    # 2.0f

    const/4 v13, 0x0

    const/4 v14, 0x1

    if-eqz v10, :cond_6

    sub-float v10, v5, v9

    div-float/2addr v10, v12

    add-float/2addr v5, v9

    div-float/2addr v5, v12

    mul-float v11, v11, v6

    .line 126
    iget-object v9, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v9, v9, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr v9, v11

    sub-float/2addr v9, v7

    div-float/2addr v9, v6

    float-to-int v9, v9

    invoke-static {v13, v9}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 127
    iget-object v12, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v12, v12, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object v15, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v15, v15, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v12, v15

    add-float/2addr v12, v6

    sub-float/2addr v12, v7

    div-float/2addr v12, v6

    float-to-int v12, v12

    invoke-static {v4, v12}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 130
    iget-object v12, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v12, v12, Lcom/badlogic/gdx/math/Rectangle;->x:F

    sub-float/2addr v12, v10

    sub-float/2addr v12, v8

    div-float/2addr v12, v5

    float-to-int v10, v12

    invoke-static {v13, v10}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 131
    iget-object v12, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v12, v12, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object v15, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v15, v15, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v12, v15

    add-float/2addr v12, v5

    sub-float/2addr v12, v8

    div-float/2addr v12, v5

    float-to-int v12, v12

    invoke-static {v3, v12}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 135
    iget-boolean v12, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerIndexEven:Z

    rem-int/lit8 v15, v10, 0x2

    if-nez v15, :cond_0

    const/4 v13, 0x1

    :cond_0
    if-ne v12, v13, :cond_1

    add-int/lit8 v12, v10, 0x1

    goto :goto_0

    :cond_1
    move v12, v10

    .line 136
    :goto_0
    iget-boolean v13, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerIndexEven:Z

    if-nez v15, :cond_2

    const/4 v15, 0x1

    goto :goto_1

    :cond_2
    const/4 v15, 0x0

    :goto_1
    if-ne v13, v15, :cond_3

    goto :goto_2

    :cond_3
    add-int/lit8 v10, v10, 0x1

    :goto_2
    sub-int/2addr v4, v14

    :goto_3
    if-lt v4, v9, :cond_a

    move v13, v12

    :goto_4
    if-ge v13, v3, :cond_4

    .line 140
    invoke-virtual {v1, v13, v4}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getCell(II)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v14

    int-to-float v15, v13

    mul-float v15, v15, v5

    add-float/2addr v15, v7

    move/from16 v16, v9

    int-to-float v9, v4

    mul-float v9, v9, v6

    add-float/2addr v9, v11

    add-float/2addr v9, v8

    invoke-direct {v0, v14, v15, v9, v2}, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->renderCell(Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;FFF)V

    add-int/lit8 v13, v13, 0x2

    move/from16 v9, v16

    goto :goto_4

    :cond_4
    move/from16 v16, v9

    move v9, v10

    :goto_5
    if-ge v9, v3, :cond_5

    .line 144
    invoke-virtual {v1, v9, v4}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getCell(II)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v13

    int-to-float v14, v9

    mul-float v14, v14, v5

    add-float/2addr v14, v7

    int-to-float v15, v4

    mul-float v15, v15, v6

    add-float/2addr v15, v8

    invoke-direct {v0, v13, v14, v15, v2}, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->renderCell(Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;FFF)V

    add-int/lit8 v9, v9, 0x2

    goto :goto_5

    :cond_5
    add-int/lit8 v4, v4, -0x1

    move/from16 v9, v16

    goto :goto_3

    :cond_6
    sub-float v10, v6, v9

    div-float/2addr v10, v12

    add-float/2addr v6, v9

    div-float/2addr v6, v12

    mul-float v11, v11, v5

    .line 153
    iget-object v9, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v9, v9, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr v9, v10

    sub-float/2addr v9, v7

    div-float/2addr v9, v6

    float-to-int v9, v9

    const/4 v10, 0x0

    invoke-static {v10, v9}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 154
    iget-object v10, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v10, v10, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object v12, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v12, v12, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v10, v12

    add-float/2addr v10, v6

    sub-float/2addr v10, v7

    div-float/2addr v10, v6

    float-to-int v10, v10

    invoke-static {v4, v10}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 157
    iget-object v10, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v10, v10, Lcom/badlogic/gdx/math/Rectangle;->x:F

    sub-float/2addr v10, v11

    sub-float/2addr v10, v8

    div-float/2addr v10, v5

    float-to-int v10, v10

    const/4 v12, 0x0

    invoke-static {v12, v10}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 158
    iget-object v13, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v13, v13, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object v15, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v15, v15, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v13, v15

    add-float/2addr v13, v5

    sub-float/2addr v13, v8

    div-float/2addr v13, v5

    float-to-int v13, v13

    invoke-static {v3, v13}, Ljava/lang/Math;->min(II)I

    move-result v3

    sub-int/2addr v4, v14

    :goto_6
    if-lt v4, v9, :cond_a

    .line 164
    rem-int/lit8 v13, v4, 0x2

    if-nez v13, :cond_7

    const/4 v13, 0x1

    goto :goto_7

    :cond_7
    const/4 v13, 0x0

    :goto_7
    iget-boolean v15, v0, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->staggerIndexEven:Z

    if-ne v13, v15, :cond_8

    move v13, v11

    goto :goto_8

    :cond_8
    const/4 v13, 0x0

    :goto_8
    move v15, v10

    :goto_9
    if-ge v15, v3, :cond_9

    .line 169
    invoke-virtual {v1, v15, v4}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getCell(II)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v12

    int-to-float v14, v15

    mul-float v14, v14, v5

    add-float/2addr v14, v13

    add-float/2addr v14, v7

    int-to-float v1, v4

    mul-float v1, v1, v6

    add-float/2addr v1, v8

    invoke-direct {v0, v12, v14, v1, v2}, Lcom/badlogic/gdx/maps/tiled/renderers/HexagonalTiledMapRenderer;->renderCell(Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;FFF)V

    add-int/lit8 v15, v15, 0x1

    move-object/from16 v1, p1

    const/4 v12, 0x0

    const/4 v14, 0x1

    goto :goto_9

    :cond_9
    add-int/lit8 v4, v4, -0x1

    move-object/from16 v1, p1

    const/4 v12, 0x0

    const/4 v14, 0x1

    goto :goto_6

    :cond_a
    return-void
.end method
