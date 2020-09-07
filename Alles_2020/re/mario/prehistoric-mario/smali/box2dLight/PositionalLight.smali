.class public abstract Lbox2dLight/PositionalLight;
.super Lbox2dLight/Light;
.source "PositionalLight.java"


# instance fields
.field protected body:Lcom/badlogic/gdx/physics/box2d/Body;

.field protected bodyAngleOffset:F

.field protected bodyOffsetX:F

.field protected bodyOffsetY:F

.field protected cos:[F

.field protected endX:[F

.field protected endY:[F

.field protected sin:[F

.field protected final start:Lcom/badlogic/gdx/math/Vector2;

.field protected final tmpEnd:Lcom/badlogic/gdx/math/Vector2;


# direct methods
.method public constructor <init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FFFF)V
    .locals 16

    move-object/from16 v6, p0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p7

    .line 58
    invoke-direct/range {v0 .. v5}, Lbox2dLight/Light;-><init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FF)V

    .line 23
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, v6, Lbox2dLight/PositionalLight;->tmpEnd:Lcom/badlogic/gdx/math/Vector2;

    .line 24
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, v6, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    .line 59
    iget-object v0, v6, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    move/from16 v1, p5

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    move/from16 v1, p6

    .line 60
    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 62
    new-instance v0, Lcom/badlogic/gdx/graphics/Mesh;

    sget-object v1, Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;->VertexArray:Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;

    iget v2, v6, Lbox2dLight/PositionalLight;->vertexNum:I

    const/4 v3, 0x3

    new-array v4, v3, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    new-instance v5, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v7, "vertex_positions"

    const/4 v8, 0x2

    const/4 v9, 0x1

    invoke-direct {v5, v9, v8, v7}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    const/4 v10, 0x0

    aput-object v5, v4, v10

    new-instance v5, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v11, "quad_colors"

    const/4 v12, 0x4

    invoke-direct {v5, v12, v12, v11}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v5, v4, v9

    new-instance v5, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v13, "s"

    const/16 v14, 0x20

    invoke-direct {v5, v14, v9, v13}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v5, v4, v8

    const/4 v5, 0x0

    const/4 v15, 0x0

    move-object/from16 p1, v0

    move-object/from16 p2, v1

    move/from16 p3, v5

    move/from16 p4, v2

    move/from16 p5, v15

    move-object/from16 p6, v4

    invoke-direct/range {p1 .. p6}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    iput-object v0, v6, Lbox2dLight/PositionalLight;->lightMesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 65
    new-instance v0, Lcom/badlogic/gdx/graphics/Mesh;

    sget-object v1, Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;->VertexArray:Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;

    iget v2, v6, Lbox2dLight/PositionalLight;->vertexNum:I

    mul-int/lit8 v2, v2, 0x2

    new-array v3, v3, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    new-instance v4, Lcom/badlogic/gdx/graphics/VertexAttribute;

    invoke-direct {v4, v9, v8, v7}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v4, v3, v10

    new-instance v4, Lcom/badlogic/gdx/graphics/VertexAttribute;

    invoke-direct {v4, v12, v12, v11}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v4, v3, v9

    new-instance v4, Lcom/badlogic/gdx/graphics/VertexAttribute;

    invoke-direct {v4, v14, v9, v13}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v4, v3, v8

    const/4 v4, 0x0

    move-object/from16 p1, v0

    move-object/from16 p2, v1

    move/from16 p3, v4

    move/from16 p4, v2

    move/from16 p5, v5

    move-object/from16 p6, v3

    invoke-direct/range {p1 .. p6}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    iput-object v0, v6, Lbox2dLight/PositionalLight;->softShadowMesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 68
    invoke-virtual/range {p0 .. p0}, Lbox2dLight/PositionalLight;->setMesh()V

    return-void
.end method


# virtual methods
.method public attachToBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 1

    const/4 v0, 0x0

    .line 101
    invoke-virtual {p0, p1, v0, v0, v0}, Lbox2dLight/PositionalLight;->attachToBody(Lcom/badlogic/gdx/physics/box2d/Body;FFF)V

    return-void
.end method

.method public attachToBody(Lcom/badlogic/gdx/physics/box2d/Body;FF)V
    .locals 1

    const/4 v0, 0x0

    .line 118
    invoke-virtual {p0, p1, p2, p3, v0}, Lbox2dLight/PositionalLight;->attachToBody(Lcom/badlogic/gdx/physics/box2d/Body;FFF)V

    return-void
.end method

.method public attachToBody(Lcom/badlogic/gdx/physics/box2d/Body;FFF)V
    .locals 0

    .line 136
    iput-object p1, p0, Lbox2dLight/PositionalLight;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 137
    iput p2, p0, Lbox2dLight/PositionalLight;->bodyOffsetX:F

    .line 138
    iput p3, p0, Lbox2dLight/PositionalLight;->bodyOffsetY:F

    .line 139
    iput p4, p0, Lbox2dLight/PositionalLight;->bodyAngleOffset:F

    .line 140
    iget-boolean p1, p0, Lbox2dLight/PositionalLight;->staticLight:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lbox2dLight/PositionalLight;->dirty:Z

    :cond_0
    return-void
.end method

.method public contains(FF)Z
    .locals 7

    .line 183
    iget-object v0, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    sub-float/2addr v0, p1

    .line 184
    iget-object v1, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float/2addr v1, p2

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    .line 186
    iget v1, p0, Lbox2dLight/PositionalLight;->distance:F

    iget v2, p0, Lbox2dLight/PositionalLight;->distance:F

    mul-float v1, v1, v2

    const/4 v2, 0x0

    cmpg-float v0, v1, v0

    if-gtz v0, :cond_0

    return v2

    .line 190
    :cond_0
    iget-object v0, p0, Lbox2dLight/PositionalLight;->mx:[F

    iget v1, p0, Lbox2dLight/PositionalLight;->rayNum:I

    iget-object v3, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v3, v0, v1

    .line 191
    iget-object v0, p0, Lbox2dLight/PositionalLight;->my:[F

    iget v1, p0, Lbox2dLight/PositionalLight;->rayNum:I

    iget-object v4, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v4, v0, v1

    const/4 v0, 0x0

    .line 193
    :goto_0
    iget v1, p0, Lbox2dLight/PositionalLight;->rayNum:I

    if-gt v2, v1, :cond_4

    .line 194
    iget-object v1, p0, Lbox2dLight/PositionalLight;->mx:[F

    aget v1, v1, v2

    .line 195
    iget-object v5, p0, Lbox2dLight/PositionalLight;->my:[F

    aget v5, v5, v2

    cmpg-float v6, v5, p2

    if-gez v6, :cond_1

    cmpl-float v6, v4, p2

    if-gez v6, :cond_2

    :cond_1
    cmpl-float v6, v5, p2

    if-ltz v6, :cond_3

    cmpg-float v6, v4, p2

    if-gez v6, :cond_3

    :cond_2
    sub-float v6, p2, v5

    sub-float/2addr v4, v5

    div-float/2addr v6, v4

    sub-float/2addr v3, v1

    mul-float v6, v6, v3

    sub-float v3, p1, v1

    cmpg-float v3, v6, v3

    if-gez v3, :cond_3

    xor-int/lit8 v0, v0, 0x1

    :cond_3
    add-int/lit8 v2, v2, 0x1

    move v3, v1

    move v4, v5

    goto :goto_0

    :cond_4
    return v0
.end method

.method protected cull()Z
    .locals 5

    .line 214
    iget-object v0, p0, Lbox2dLight/PositionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-boolean v0, v0, Lbox2dLight/RayHandler;->culling:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lbox2dLight/PositionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v1, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v2, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v3, p0, Lbox2dLight/PositionalLight;->distance:F

    iget v4, p0, Lbox2dLight/PositionalLight;->softShadowLength:F

    add-float/2addr v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lbox2dLight/RayHandler;->intersect(FFF)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lbox2dLight/PositionalLight;->culled:Z

    .line 216
    iget-boolean v0, p0, Lbox2dLight/PositionalLight;->culled:Z

    return v0
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 151
    iget-object v0, p0, Lbox2dLight/PositionalLight;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getPosition()Lcom/badlogic/gdx/math/Vector2;
    .locals 2

    .line 145
    iget-object v0, p0, Lbox2dLight/PositionalLight;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 146
    iget-object v0, p0, Lbox2dLight/PositionalLight;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 147
    iget-object v0, p0, Lbox2dLight/PositionalLight;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getX()F
    .locals 1

    .line 157
    iget-object v0, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 163
    iget-object v0, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    return v0
.end method

.method render()V
    .locals 5

    .line 84
    iget-object v0, p0, Lbox2dLight/PositionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-boolean v0, v0, Lbox2dLight/RayHandler;->culling:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lbox2dLight/PositionalLight;->culled:Z

    if-eqz v0, :cond_0

    return-void

    .line 86
    :cond_0
    iget-object v0, p0, Lbox2dLight/PositionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v1, v0, Lbox2dLight/RayHandler;->lightRenderedLastFrame:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lbox2dLight/RayHandler;->lightRenderedLastFrame:I

    .line 87
    iget-object v0, p0, Lbox2dLight/PositionalLight;->lightMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p0, Lbox2dLight/PositionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v1, v1, Lbox2dLight/RayHandler;->lightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const/4 v2, 0x6

    iget v3, p0, Lbox2dLight/PositionalLight;->vertexNum:I

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v4, v3}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    .line 90
    iget-boolean v0, p0, Lbox2dLight/PositionalLight;->soft:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lbox2dLight/PositionalLight;->xray:Z

    if-nez v0, :cond_1

    .line 91
    iget-object v0, p0, Lbox2dLight/PositionalLight;->softShadowMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p0, Lbox2dLight/PositionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v1, v1, Lbox2dLight/RayHandler;->lightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const/4 v2, 0x5

    iget v3, p0, Lbox2dLight/PositionalLight;->vertexNum:I

    add-int/lit8 v3, v3, -0x1

    mul-int/lit8 v3, v3, 0x2

    invoke-virtual {v0, v1, v2, v4, v3}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    :cond_1
    return-void
.end method

.method protected setMesh()V
    .locals 10

    .line 252
    iget-object v0, p0, Lbox2dLight/PositionalLight;->segments:[F

    iget-object v1, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 253
    iget-object v0, p0, Lbox2dLight/PositionalLight;->segments:[F

    iget-object v1, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    const/4 v3, 0x1

    aput v1, v0, v3

    .line 254
    iget-object v0, p0, Lbox2dLight/PositionalLight;->segments:[F

    iget v1, p0, Lbox2dLight/PositionalLight;->colorF:F

    const/4 v3, 0x2

    aput v1, v0, v3

    .line 255
    iget-object v0, p0, Lbox2dLight/PositionalLight;->segments:[F

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v3, 0x3

    aput v1, v0, v3

    const/4 v0, 0x4

    const/4 v0, 0x0

    const/4 v3, 0x4

    .line 257
    :goto_0
    iget v4, p0, Lbox2dLight/PositionalLight;->rayNum:I

    if-ge v0, v4, :cond_0

    .line 258
    iget-object v4, p0, Lbox2dLight/PositionalLight;->segments:[F

    add-int/lit8 v5, v3, 0x1

    iget-object v6, p0, Lbox2dLight/PositionalLight;->mx:[F

    aget v6, v6, v0

    aput v6, v4, v3

    .line 259
    iget-object v3, p0, Lbox2dLight/PositionalLight;->segments:[F

    add-int/lit8 v4, v5, 0x1

    iget-object v6, p0, Lbox2dLight/PositionalLight;->my:[F

    aget v6, v6, v0

    aput v6, v3, v5

    .line 260
    iget-object v3, p0, Lbox2dLight/PositionalLight;->segments:[F

    add-int/lit8 v5, v4, 0x1

    iget v6, p0, Lbox2dLight/PositionalLight;->colorF:F

    aput v6, v3, v4

    .line 261
    iget-object v3, p0, Lbox2dLight/PositionalLight;->segments:[F

    add-int/lit8 v4, v5, 0x1

    iget-object v6, p0, Lbox2dLight/PositionalLight;->f:[F

    aget v6, v6, v0

    sub-float v6, v1, v6

    aput v6, v3, v5

    add-int/lit8 v0, v0, 0x1

    move v3, v4

    goto :goto_0

    .line 263
    :cond_0
    iget-object v0, p0, Lbox2dLight/PositionalLight;->lightMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v4, p0, Lbox2dLight/PositionalLight;->segments:[F

    invoke-virtual {v0, v4, v2, v3}, Lcom/badlogic/gdx/graphics/Mesh;->setVertices([FII)Lcom/badlogic/gdx/graphics/Mesh;

    .line 265
    iget-boolean v0, p0, Lbox2dLight/PositionalLight;->soft:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lbox2dLight/PositionalLight;->xray:Z

    if-eqz v0, :cond_1

    goto :goto_2

    :cond_1
    const/4 v0, 0x0

    const/4 v3, 0x0

    .line 269
    :goto_1
    iget v4, p0, Lbox2dLight/PositionalLight;->rayNum:I

    if-ge v0, v4, :cond_2

    .line 270
    iget-object v4, p0, Lbox2dLight/PositionalLight;->segments:[F

    add-int/lit8 v5, v3, 0x1

    iget-object v6, p0, Lbox2dLight/PositionalLight;->mx:[F

    aget v6, v6, v0

    aput v6, v4, v3

    .line 271
    iget-object v3, p0, Lbox2dLight/PositionalLight;->segments:[F

    add-int/lit8 v4, v5, 0x1

    iget-object v6, p0, Lbox2dLight/PositionalLight;->my:[F

    aget v6, v6, v0

    aput v6, v3, v5

    .line 272
    iget-object v3, p0, Lbox2dLight/PositionalLight;->segments:[F

    add-int/lit8 v5, v4, 0x1

    iget v6, p0, Lbox2dLight/PositionalLight;->colorF:F

    aput v6, v3, v4

    .line 273
    iget-object v3, p0, Lbox2dLight/PositionalLight;->f:[F

    aget v3, v3, v0

    sub-float v3, v1, v3

    .line 274
    iget-object v4, p0, Lbox2dLight/PositionalLight;->segments:[F

    add-int/lit8 v6, v5, 0x1

    aput v3, v4, v5

    .line 275
    iget-object v4, p0, Lbox2dLight/PositionalLight;->segments:[F

    add-int/lit8 v5, v6, 0x1

    iget-object v7, p0, Lbox2dLight/PositionalLight;->mx:[F

    aget v7, v7, v0

    iget v8, p0, Lbox2dLight/PositionalLight;->softShadowLength:F

    mul-float v8, v8, v3

    iget-object v9, p0, Lbox2dLight/PositionalLight;->cos:[F

    aget v9, v9, v0

    mul-float v8, v8, v9

    add-float/2addr v7, v8

    aput v7, v4, v6

    .line 276
    iget-object v4, p0, Lbox2dLight/PositionalLight;->segments:[F

    add-int/lit8 v6, v5, 0x1

    iget-object v7, p0, Lbox2dLight/PositionalLight;->my:[F

    aget v7, v7, v0

    iget v8, p0, Lbox2dLight/PositionalLight;->softShadowLength:F

    mul-float v3, v3, v8

    iget-object v8, p0, Lbox2dLight/PositionalLight;->sin:[F

    aget v8, v8, v0

    mul-float v3, v3, v8

    add-float/2addr v7, v3

    aput v7, v4, v5

    .line 277
    iget-object v3, p0, Lbox2dLight/PositionalLight;->segments:[F

    add-int/lit8 v4, v6, 0x1

    sget v5, Lbox2dLight/PositionalLight;->zeroColorBits:F

    aput v5, v3, v6

    .line 278
    iget-object v3, p0, Lbox2dLight/PositionalLight;->segments:[F

    add-int/lit8 v5, v4, 0x1

    const/4 v6, 0x0

    aput v6, v3, v4

    add-int/lit8 v0, v0, 0x1

    move v3, v5

    goto :goto_1

    .line 280
    :cond_2
    iget-object v0, p0, Lbox2dLight/PositionalLight;->softShadowMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p0, Lbox2dLight/PositionalLight;->segments:[F

    invoke-virtual {v0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/Mesh;->setVertices([FII)Lcom/badlogic/gdx/graphics/Mesh;

    :cond_3
    :goto_2
    return-void
.end method

.method public setPosition(FF)V
    .locals 1

    .line 168
    iget-object v0, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iput p1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 169
    iput p2, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 170
    iget-boolean p1, p0, Lbox2dLight/PositionalLight;->staticLight:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lbox2dLight/PositionalLight;->dirty:Z

    :cond_0
    return-void
.end method

.method public setPosition(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 2

    .line 175
    iget-object v0, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 176
    iget-object v0, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iput p1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 177
    iget-boolean p1, p0, Lbox2dLight/PositionalLight;->staticLight:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lbox2dLight/PositionalLight;->dirty:Z

    :cond_0
    return-void
.end method

.method protected setRayNum(I)V
    .locals 1

    .line 205
    invoke-super {p0, p1}, Lbox2dLight/Light;->setRayNum(I)V

    .line 207
    new-array v0, p1, [F

    iput-object v0, p0, Lbox2dLight/PositionalLight;->sin:[F

    .line 208
    new-array v0, p1, [F

    iput-object v0, p0, Lbox2dLight/PositionalLight;->cos:[F

    .line 209
    new-array v0, p1, [F

    iput-object v0, p0, Lbox2dLight/PositionalLight;->endX:[F

    .line 210
    new-array p1, p1, [F

    iput-object p1, p0, Lbox2dLight/PositionalLight;->endY:[F

    return-void
.end method

.method update()V
    .locals 1

    .line 73
    invoke-virtual {p0}, Lbox2dLight/PositionalLight;->updateBody()V

    .line 75
    invoke-virtual {p0}, Lbox2dLight/PositionalLight;->cull()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 76
    :cond_0
    iget-boolean v0, p0, Lbox2dLight/PositionalLight;->staticLight:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lbox2dLight/PositionalLight;->dirty:Z

    if-nez v0, :cond_1

    return-void

    :cond_1
    const/4 v0, 0x0

    .line 78
    iput-boolean v0, p0, Lbox2dLight/PositionalLight;->dirty:Z

    .line 79
    invoke-virtual {p0}, Lbox2dLight/PositionalLight;->updateMesh()V

    return-void
.end method

.method protected updateBody()V
    .locals 8

    .line 220
    iget-object v0, p0, Lbox2dLight/PositionalLight;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lbox2dLight/PositionalLight;->staticLight:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 222
    :cond_0
    iget-object v0, p0, Lbox2dLight/PositionalLight;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/Body;->getPosition()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    .line 223
    iget-object v1, p0, Lbox2dLight/PositionalLight;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-virtual {v1}, Lcom/badlogic/gdx/physics/box2d/Body;->getAngle()F

    move-result v1

    .line 224
    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v2

    .line 225
    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v3

    .line 226
    iget v4, p0, Lbox2dLight/PositionalLight;->bodyOffsetX:F

    mul-float v5, v4, v2

    iget v6, p0, Lbox2dLight/PositionalLight;->bodyOffsetY:F

    mul-float v7, v6, v3

    sub-float/2addr v5, v7

    mul-float v4, v4, v3

    mul-float v6, v6, v2

    add-float/2addr v4, v6

    .line 228
    iget-object v2, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v3, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float/2addr v3, v5

    iput v3, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 229
    iget-object v2, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-float/2addr v0, v4

    iput v0, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 230
    iget v0, p0, Lbox2dLight/PositionalLight;->bodyAngleOffset:F

    const v2, 0x42652ee0

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    invoke-virtual {p0, v0}, Lbox2dLight/PositionalLight;->setDirection(F)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected updateMesh()V
    .locals 5

    const/4 v0, 0x0

    .line 234
    :goto_0
    iget v1, p0, Lbox2dLight/PositionalLight;->rayNum:I

    if-ge v0, v1, :cond_1

    .line 235
    iput v0, p0, Lbox2dLight/PositionalLight;->m_index:I

    .line 236
    iget-object v1, p0, Lbox2dLight/PositionalLight;->f:[F

    const/high16 v2, 0x3f800000    # 1.0f

    aput v2, v1, v0

    .line 237
    iget-object v1, p0, Lbox2dLight/PositionalLight;->tmpEnd:Lcom/badlogic/gdx/math/Vector2;

    iget-object v2, p0, Lbox2dLight/PositionalLight;->endX:[F

    aget v2, v2, v0

    iget-object v3, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float/2addr v2, v3

    iput v2, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 238
    iget-object v1, p0, Lbox2dLight/PositionalLight;->mx:[F

    iget-object v2, p0, Lbox2dLight/PositionalLight;->tmpEnd:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v2, v1, v0

    .line 239
    iget-object v1, p0, Lbox2dLight/PositionalLight;->tmpEnd:Lcom/badlogic/gdx/math/Vector2;

    iget-object v2, p0, Lbox2dLight/PositionalLight;->endY:[F

    aget v2, v2, v0

    iget-object v3, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-float/2addr v2, v3

    iput v2, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 240
    iget-object v1, p0, Lbox2dLight/PositionalLight;->my:[F

    iget-object v2, p0, Lbox2dLight/PositionalLight;->tmpEnd:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v2, v1, v0

    .line 241
    iget-object v1, p0, Lbox2dLight/PositionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v1, v1, Lbox2dLight/RayHandler;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lbox2dLight/PositionalLight;->xray:Z

    if-nez v1, :cond_0

    .line 242
    iget-object v1, p0, Lbox2dLight/PositionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v1, v1, Lbox2dLight/RayHandler;->world:Lcom/badlogic/gdx/physics/box2d/World;

    iget-object v2, p0, Lbox2dLight/PositionalLight;->ray:Lcom/badlogic/gdx/physics/box2d/RayCastCallback;

    iget-object v3, p0, Lbox2dLight/PositionalLight;->start:Lcom/badlogic/gdx/math/Vector2;

    iget-object v4, p0, Lbox2dLight/PositionalLight;->tmpEnd:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v1, v2, v3, v4}, Lcom/badlogic/gdx/physics/box2d/World;->rayCast(Lcom/badlogic/gdx/physics/box2d/RayCastCallback;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 245
    :cond_1
    invoke-virtual {p0}, Lbox2dLight/PositionalLight;->setMesh()V

    return-void
.end method
