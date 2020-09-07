.class public Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;
.super Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;
.source "OrthogonalTiledMapRenderer.java"


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;F)V
    .locals 0

    .line 59
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;F)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;FLcom/badlogic/gdx/graphics/g2d/Batch;)V
    .locals 0

    .line 63
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;FLcom/badlogic/gdx/graphics/g2d/Batch;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/graphics/g2d/Batch;)V
    .locals 0

    .line 55
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/maps/tiled/renderers/BatchTiledMapRenderer;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/graphics/g2d/Batch;)V

    return-void
.end method


# virtual methods
.method public renderTileLayer(Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;)V
    .locals 30

    move-object/from16 v0, p0

    .line 68
    iget-object v1, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/g2d/Batch;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v1

    .line 69
    iget v2, v1, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v3, v1, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v4, v1, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v1, v1, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getOpacity()F

    move-result v5

    mul-float v1, v1, v5

    invoke-static {v2, v3, v4, v1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits(FFFF)F

    move-result v1

    .line 71
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getWidth()I

    move-result v2

    .line 72
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getHeight()I

    move-result v3

    .line 74
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getTileWidth()F

    move-result v4

    iget v5, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->unitScale:F

    mul-float v4, v4, v5

    .line 75
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getTileHeight()F

    move-result v5

    iget v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->unitScale:F

    mul-float v5, v5, v6

    .line 77
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getRenderOffsetX()F

    move-result v6

    iget v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->unitScale:F

    mul-float v6, v6, v7

    .line 79
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getRenderOffsetY()F

    move-result v7

    neg-float v7, v7

    iget v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->unitScale:F

    mul-float v7, v7, v8

    .line 81
    iget-object v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v8, v8, Lcom/badlogic/gdx/math/Rectangle;->x:F

    sub-float/2addr v8, v6

    div-float/2addr v8, v4

    float-to-int v8, v8

    const/4 v9, 0x0

    invoke-static {v9, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 82
    iget-object v10, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v10, v10, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget-object v11, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v11, v11, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v10, v11

    add-float/2addr v10, v4

    sub-float/2addr v10, v6

    div-float/2addr v10, v4

    float-to-int v10, v10

    invoke-static {v2, v10}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 85
    iget-object v10, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v10, v10, Lcom/badlogic/gdx/math/Rectangle;->y:F

    sub-float/2addr v10, v7

    div-float/2addr v10, v5

    float-to-int v10, v10

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 86
    iget-object v11, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v11, v11, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object v12, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->viewBounds:Lcom/badlogic/gdx/math/Rectangle;

    iget v12, v12, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v11, v12

    add-float/2addr v11, v5

    sub-float/2addr v11, v7

    div-float/2addr v11, v5

    float-to-int v11, v11

    invoke-static {v3, v11}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v11, v3

    mul-float v11, v11, v5

    add-float/2addr v11, v7

    int-to-float v7, v8

    mul-float v7, v7, v4

    add-float/2addr v7, v6

    .line 91
    iget-object v6, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->vertices:[F

    :goto_0
    if-lt v3, v10, :cond_9

    move v13, v7

    move v12, v8

    :goto_1
    if-ge v12, v2, :cond_8

    move-object/from16 v14, p1

    .line 96
    invoke-virtual {v14, v12, v3}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getCell(II)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v15

    if-nez v15, :cond_0

    add-float/2addr v13, v4

    move/from16 v16, v2

    move/from16 v22, v7

    move/from16 v23, v8

    move/from16 v27, v10

    goto/16 :goto_4

    .line 101
    :cond_0
    invoke-virtual {v15}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getTile()Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v16

    if-eqz v16, :cond_7

    .line 104
    invoke-virtual {v15}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getFlipHorizontally()Z

    move-result v17

    .line 105
    invoke-virtual {v15}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getFlipVertically()Z

    move-result v18

    .line 106
    invoke-virtual {v15}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->getRotation()I

    move-result v15

    .line 108
    invoke-interface/range {v16 .. v16}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v19

    .line 110
    invoke-interface/range {v16 .. v16}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getOffsetX()F

    move-result v20

    iget v9, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->unitScale:F

    mul-float v20, v20, v9

    add-float v20, v13, v20

    .line 111
    invoke-interface/range {v16 .. v16}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getOffsetY()F

    move-result v9

    move/from16 v16, v2

    iget v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->unitScale:F

    mul-float v9, v9, v2

    add-float/2addr v9, v11

    .line 112
    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v2

    int-to-float v2, v2

    move/from16 v22, v7

    iget v7, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->unitScale:F

    mul-float v2, v2, v7

    add-float v2, v20, v2

    .line 113
    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v7

    int-to-float v7, v7

    move/from16 v23, v8

    iget v8, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->unitScale:F

    mul-float v7, v7, v8

    add-float/2addr v7, v9

    .line 115
    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU()F

    move-result v8

    .line 116
    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV2()F

    move-result v24

    .line 117
    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU2()F

    move-result v25

    .line 118
    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV()F

    move-result v26

    const/16 v21, 0x0

    .line 120
    aput v20, v6, v21

    move/from16 v27, v10

    const/4 v10, 0x1

    .line 121
    aput v9, v6, v10

    const/4 v10, 0x2

    .line 122
    aput v1, v6, v10

    const/4 v10, 0x3

    .line 123
    aput v8, v6, v10

    const/16 v28, 0x4

    .line 124
    aput v24, v6, v28

    const/16 v29, 0x5

    .line 126
    aput v20, v6, v29

    const/16 v20, 0x6

    .line 127
    aput v7, v6, v20

    const/16 v20, 0x7

    .line 128
    aput v1, v6, v20

    const/16 v20, 0x8

    .line 129
    aput v8, v6, v20

    const/16 v8, 0x9

    .line 130
    aput v26, v6, v8

    const/16 v29, 0xa

    .line 132
    aput v2, v6, v29

    const/16 v29, 0xb

    .line 133
    aput v7, v6, v29

    const/16 v7, 0xc

    .line 134
    aput v1, v6, v7

    const/16 v7, 0xd

    .line 135
    aput v25, v6, v7

    const/16 v29, 0xe

    .line 136
    aput v26, v6, v29

    const/16 v26, 0xf

    .line 138
    aput v2, v6, v26

    const/16 v2, 0x10

    .line 139
    aput v9, v6, v2

    const/16 v2, 0x11

    .line 140
    aput v1, v6, v2

    const/16 v2, 0x12

    .line 141
    aput v25, v6, v2

    const/16 v9, 0x13

    .line 142
    aput v24, v6, v9

    if-eqz v17, :cond_1

    .line 145
    aget v17, v6, v10

    .line 146
    aget v24, v6, v7

    aput v24, v6, v10

    .line 147
    aput v17, v6, v7

    .line 148
    aget v17, v6, v20

    .line 149
    aget v24, v6, v2

    aput v24, v6, v20

    .line 150
    aput v17, v6, v2

    :cond_1
    if-eqz v18, :cond_2

    .line 153
    aget v17, v6, v28

    .line 154
    aget v18, v6, v29

    aput v18, v6, v28

    .line 155
    aput v17, v6, v29

    .line 156
    aget v17, v6, v8

    .line 157
    aget v18, v6, v9

    aput v18, v6, v8

    .line 158
    aput v17, v6, v9

    :cond_2
    if-eqz v15, :cond_6

    const/4 v7, 0x1

    if-eq v15, v7, :cond_5

    const/4 v7, 0x2

    if-eq v15, v7, :cond_4

    if-eq v15, v10, :cond_3

    goto :goto_2

    .line 192
    :cond_3
    aget v7, v6, v28

    .line 193
    aget v15, v6, v9

    aput v15, v6, v28

    .line 194
    aget v15, v6, v29

    aput v15, v6, v9

    .line 195
    aget v9, v6, v8

    aput v9, v6, v29

    .line 196
    aput v7, v6, v8

    .line 198
    aget v7, v6, v10

    .line 199
    aget v8, v6, v2

    aput v8, v6, v10

    const/16 v15, 0xd

    .line 200
    aget v8, v6, v15

    aput v8, v6, v2

    .line 201
    aget v2, v6, v20

    aput v2, v6, v15

    .line 202
    aput v7, v6, v20

    goto :goto_2

    :cond_4
    const/16 v15, 0xd

    .line 177
    aget v7, v6, v10

    .line 178
    aget v17, v6, v15

    aput v17, v6, v10

    .line 179
    aput v7, v6, v15

    .line 180
    aget v7, v6, v20

    .line 181
    aget v10, v6, v2

    aput v10, v6, v20

    .line 182
    aput v7, v6, v2

    .line 183
    aget v2, v6, v28

    .line 184
    aget v7, v6, v29

    aput v7, v6, v28

    .line 185
    aput v2, v6, v29

    .line 186
    aget v2, v6, v8

    .line 187
    aget v7, v6, v9

    aput v7, v6, v8

    .line 188
    aput v2, v6, v9

    goto :goto_2

    .line 163
    :cond_5
    aget v7, v6, v28

    .line 164
    aget v15, v6, v8

    aput v15, v6, v28

    .line 165
    aget v15, v6, v29

    aput v15, v6, v8

    .line 166
    aget v8, v6, v9

    aput v8, v6, v29

    .line 167
    aput v7, v6, v9

    .line 169
    aget v7, v6, v10

    .line 170
    aget v8, v6, v20

    aput v8, v6, v10

    const/16 v8, 0xd

    .line 171
    aget v9, v6, v8

    aput v9, v6, v20

    .line 172
    aget v9, v6, v2

    aput v9, v6, v8

    .line 173
    aput v7, v6, v2

    .line 207
    :cond_6
    :goto_2
    iget-object v2, v0, Lcom/badlogic/gdx/maps/tiled/renderers/OrthogonalTiledMapRenderer;->batch:Lcom/badlogic/gdx/graphics/g2d/Batch;

    invoke-virtual/range {v19 .. v19}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v7

    const/16 v8, 0x14

    const/4 v9, 0x0

    invoke-interface {v2, v7, v6, v9, v8}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/Texture;[FII)V

    goto :goto_3

    :cond_7
    move/from16 v16, v2

    move/from16 v22, v7

    move/from16 v23, v8

    move/from16 v27, v10

    :goto_3
    add-float/2addr v13, v4

    :goto_4
    add-int/lit8 v12, v12, 0x1

    move/from16 v2, v16

    move/from16 v7, v22

    move/from16 v8, v23

    move/from16 v10, v27

    goto/16 :goto_1

    :cond_8
    move-object/from16 v14, p1

    move/from16 v16, v2

    move/from16 v22, v7

    move/from16 v23, v8

    move/from16 v27, v10

    sub-float/2addr v11, v5

    add-int/lit8 v3, v3, -0x1

    goto/16 :goto_0

    :cond_9
    return-void
.end method
