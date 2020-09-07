.class public Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;
.super Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;
.source "IsometricStaggeredTiledMapRenderer.java"


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;F)V
    .locals 0

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;F)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;FLcom/badlogic/gdx/graphics/g2d/Batch;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;FLcom/badlogic/gdx/graphics/g2d/Batch;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/graphics/g2d/Batch;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/graphics/g2d/Batch;)V

    return-void
.end method


# virtual methods
.method public renderTileLayer(Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;)V
    .locals 32

    move-object/from16 v0, p0

    .line 49
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/g2d/Batch;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v1

    .line 50
    iget v2, v1, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v3, v1, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v4, v1, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v1, v1, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getOpacity()F

    move-result v5

    mul-float v1, v1, v5

    invoke-static {v2, v3, v4, v1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits(FFFF)F

    move-result v1

    .line 52
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getWidth()I

    move-result v2

    .line 53
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getHeight()I

    move-result v3

    .line 55
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getRenderOffsetX()F

    move-result v4

    iget v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->unitScale:F

    mul-float v4, v4, v5

    .line 57
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getRenderOffsetY()F

    move-result v5

    neg-float v5, v5

    iget v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->unitScale:F

    mul-float v5, v5, v6

    .line 59
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getTileWidth()F

    move-result v6

    iget v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->unitScale:F

    mul-float v6, v6, v7

    .line 60
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getTileHeight()F

    move-result v7

    iget v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->unitScale:F

    mul-float v7, v7, v8

    const/high16 v8, 0x3f000000    # 0.5f

    mul-float v9, v6, v8

    mul-float v8, v8, v7

    .line 65
    iget-object v10, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v10, v10, Lcom/badlogic/gdx/math/Rectangle;->x:F

    sub-float/2addr v10, v9

    sub-float/2addr v10, v4

    div-float/2addr v10, v6

    float-to-int v10, v10

    const/4 v11, 0x0

    invoke-static {v11, v10}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 66
    iget-object v12, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v12, v12, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object v13, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v13, v13, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v12, v13

    add-float/2addr v12, v6

    add-float/2addr v12, v9

    sub-float/2addr v12, v4

    div-float/2addr v12, v6

    float-to-int v12, v12

    invoke-static {v2, v12}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 69
    iget-object v12, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v12, v12, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr v12, v7

    sub-float/2addr v12, v5

    div-float/2addr v12, v7

    float-to-int v12, v12

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v12

    .line 70
    iget-object v13, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v13, v13, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object v14, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v14, v14, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v13, v14

    add-float/2addr v13, v7

    sub-float/2addr v13, v5

    div-float/2addr v13, v8

    float-to-int v7, v13

    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/4 v7, 0x1

    sub-int/2addr v3, v7

    :goto_0
    if-lt v3, v12, :cond_a

    .line 74
    rem-int/lit8 v13, v3, 0x2

    if-ne v13, v7, :cond_0

    move v13, v9

    goto :goto_1

    :cond_0
    const/4 v13, 0x0

    :goto_1
    add-int/lit8 v14, v2, -0x1

    :goto_2
    if-lt v14, v10, :cond_9

    move-object/from16 v15, p1

    .line 76
    invoke-virtual {v15, v14, v3}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getCell(II)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v16

    if-nez v16, :cond_1

    goto/16 :goto_4

    .line 78
    :cond_1
    invoke-virtual/range {v16 .. v16}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getTile()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v17

    if-eqz v17, :cond_8

    .line 81
    invoke-virtual/range {v16 .. v16}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getFlipHorizontally()Z

    move-result v18

    .line 82
    invoke-virtual/range {v16 .. v16}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getFlipVertically()Z

    move-result v19

    .line 83
    invoke-virtual/range {v16 .. v16}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getRotation()I

    move-result v7

    .line 84
    invoke-interface/range {v17 .. v17}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v16

    int-to-float v11, v14

    mul-float v11, v11, v6

    sub-float/2addr v11, v13

    .line 86
    invoke-interface/range {v17 .. v17}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getOffsetX()F

    move-result v22

    move/from16 v23, v2

    iget v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->unitScale:F

    mul-float v22, v22, v2

    add-float v11, v11, v22

    add-float/2addr v11, v4

    int-to-float v2, v3

    mul-float v2, v2, v8

    .line 87
    invoke-interface/range {v17 .. v17}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getOffsetY()F

    move-result v17

    move/from16 v22, v4

    iget v4, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->unitScale:F

    mul-float v17, v17, v4

    add-float v2, v2, v17

    add-float/2addr v2, v5

    .line 88
    invoke-virtual/range {v16 .. v16}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v4

    int-to-float v4, v4

    move/from16 v17, v5

    iget v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->unitScale:F

    mul-float v4, v4, v5

    add-float/2addr v4, v11

    .line 89
    invoke-virtual/range {v16 .. v16}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v5

    int-to-float v5, v5

    move/from16 v24, v6

    iget v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->unitScale:F

    mul-float v5, v5, v6

    add-float/2addr v5, v2

    .line 91
    invoke-virtual/range {v16 .. v16}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU()F

    move-result v6

    .line 92
    invoke-virtual/range {v16 .. v16}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV2()F

    move-result v25

    .line 93
    invoke-virtual/range {v16 .. v16}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU2()F

    move-result v26

    .line 94
    invoke-virtual/range {v16 .. v16}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV()F

    move-result v27

    move/from16 v28, v8

    .line 96
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v21, 0x0

    aput v11, v8, v21

    .line 97
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v20, 0x1

    aput v2, v8, v20

    .line 98
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    move/from16 v29, v9

    const/4 v9, 0x2

    aput v1, v8, v9

    .line 99
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/4 v9, 0x3

    aput v6, v8, v9

    .line 100
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v30, 0x4

    aput v25, v8, v30

    .line 102
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v31, 0x5

    aput v11, v8, v31

    .line 103
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/4 v11, 0x6

    aput v5, v8, v11

    .line 104
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/4 v11, 0x7

    aput v1, v8, v11

    .line 105
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v11, 0x8

    aput v6, v8, v11

    .line 106
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v8, 0x9

    aput v27, v6, v8

    .line 108
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v31, 0xa

    aput v4, v6, v31

    .line 109
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v31, 0xb

    aput v5, v6, v31

    .line 110
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v6, 0xc

    aput v1, v5, v6

    .line 111
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v6, 0xd

    aput v26, v5, v6

    .line 112
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v31, 0xe

    aput v27, v5, v31

    .line 114
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v27, 0xf

    aput v4, v5, v27

    .line 115
    iget-object v4, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v5, 0x10

    aput v2, v4, v5

    .line 116
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v4, 0x11

    aput v1, v2, v4

    .line 117
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v4, 0x12

    aput v26, v2, v4

    .line 118
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v5, 0x13

    aput v25, v2, v5

    if-eqz v18, :cond_2

    .line 121
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v2, v2, v9

    .line 122
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v8, v8, v6

    aput v8, v5, v9

    .line 123
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aput v2, v5, v6

    .line 124
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v2, v2, v11

    .line 125
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v8, v8, v4

    aput v8, v5, v11

    .line 126
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aput v2, v5, v4

    :cond_2
    if-eqz v19, :cond_3

    .line 130
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v2, v2, v30

    .line 131
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v8, v8, v31

    aput v8, v5, v30

    .line 132
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aput v2, v5, v31

    .line 133
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v5, 0x9

    aget v2, v2, v5

    .line 134
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v11, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v18, 0x13

    aget v11, v11, v18

    aput v11, v8, v5

    .line 135
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aput v2, v5, v18

    :cond_3
    if-eqz v7, :cond_7

    const/4 v2, 0x1

    if-eq v7, v2, :cond_6

    const/4 v5, 0x2

    if-eq v7, v5, :cond_5

    if-eq v7, v9, :cond_4

    goto/16 :goto_3

    .line 170
    :cond_4
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v5, v5, v30

    .line 171
    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v11, 0x13

    aget v8, v8, v11

    aput v8, v7, v30

    .line 172
    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v8, v8, v31

    aput v8, v7, v11

    .line 173
    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v11, 0x9

    aget v8, v8, v11

    aput v8, v7, v31

    .line 174
    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aput v5, v7, v11

    .line 176
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v5, v5, v9

    .line 177
    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v8, v8, v4

    aput v8, v7, v9

    .line 178
    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v8, v8, v6

    aput v8, v7, v4

    .line 179
    iget-object v4, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v8, 0x8

    aget v7, v7, v8

    aput v7, v4, v6

    .line 180
    iget-object v4, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aput v5, v4, v8

    goto/16 :goto_3

    :cond_5
    const/16 v8, 0x8

    .line 155
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v5, v5, v9

    .line 156
    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v11, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v11, v11, v6

    aput v11, v7, v9

    .line 157
    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aput v5, v7, v6

    .line 158
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v5, v5, v8

    .line 159
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v7, v7, v4

    aput v7, v6, v8

    .line 160
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aput v5, v6, v4

    .line 161
    iget-object v4, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v4, v4, v30

    .line 162
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v6, v6, v31

    aput v6, v5, v30

    .line 163
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aput v4, v5, v31

    .line 164
    iget-object v4, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v5, 0x9

    aget v4, v4, v5

    .line 165
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v8, 0x13

    aget v7, v7, v8

    aput v7, v6, v5

    .line 166
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aput v4, v5, v8

    goto :goto_3

    :cond_6
    const/16 v5, 0x9

    .line 141
    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v7, v7, v30

    .line 142
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v11, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v11, v11, v5

    aput v11, v8, v30

    .line 143
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v11, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v11, v11, v31

    aput v11, v8, v5

    .line 144
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v11, 0x13

    aget v8, v8, v11

    aput v8, v5, v31

    .line 145
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aput v7, v5, v11

    .line 147
    iget-object v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v5, v5, v9

    .line 148
    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v11, 0x8

    aget v8, v8, v11

    aput v8, v7, v9

    .line 149
    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v8, v8, v6

    aput v8, v7, v11

    .line 150
    iget-object v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aget v8, v8, v4

    aput v8, v7, v6

    .line 151
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    aput v5, v6, v4

    goto :goto_3

    :cond_7
    const/4 v2, 0x1

    .line 185
    :goto_3
    iget-object v4, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-virtual/range {v16 .. v16}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v5

    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/IsometricStaggeredTiledMapRenderer;->vertices:[F

    const/16 v7, 0x14

    const/4 v8, 0x0

    invoke-interface {v4, v5, v6, v8, v7}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    goto :goto_5

    :cond_8
    :goto_4
    move/from16 v23, v2

    move/from16 v22, v4

    move/from16 v17, v5

    move/from16 v24, v6

    move/from16 v28, v8

    move/from16 v29, v9

    const/4 v2, 0x1

    const/4 v8, 0x0

    :goto_5
    add-int/lit8 v14, v14, -0x1

    move/from16 v5, v17

    move/from16 v4, v22

    move/from16 v2, v23

    move/from16 v6, v24

    move/from16 v8, v28

    move/from16 v9, v29

    const/4 v7, 0x1

    const/4 v11, 0x0

    goto/16 :goto_2

    :cond_9
    move-object/from16 v15, p1

    move/from16 v23, v2

    move/from16 v22, v4

    move/from16 v17, v5

    move/from16 v24, v6

    move/from16 v28, v8

    move/from16 v29, v9

    const/4 v2, 0x1

    const/4 v8, 0x0

    add-int/lit8 v3, v3, -0x1

    move/from16 v2, v23

    move/from16 v8, v28

    const/4 v7, 0x1

    const/4 v11, 0x0

    goto/16 :goto_0

    :cond_a
    return-void
.end method
