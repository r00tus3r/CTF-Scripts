.class public Lbox2dLight/DirectionalLight;
.super Lbox2dLight/Light;
.source "DirectionalLight.java"


# instance fields
.field protected cos:F

.field protected final end:[Lcom/badlogic/gdx/math/Vector2;

.field protected sin:F

.field protected final start:[Lcom/badlogic/gdx/math/Vector2;


# direct methods
.method public constructor <init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;F)V
    .locals 22

    move-object/from16 v6, p0

    const/high16 v4, 0x7f800000    # Float.POSITIVE_INFINITY

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v5, p4

    .line 47
    invoke-direct/range {v0 .. v5}, Lbox2dLight/Light;-><init>(Lbox2dLight/RayHandler;ILcom/badlogic/gdx/graphics/Color;FF)V

    .line 49
    iget v0, v6, Lbox2dLight/DirectionalLight;->vertexNum:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x2

    mul-int/lit8 v0, v0, 0x2

    iput v0, v6, Lbox2dLight/DirectionalLight;->vertexNum:I

    .line 50
    iget v0, v6, Lbox2dLight/DirectionalLight;->rayNum:I

    new-array v0, v0, [Lcom/badlogic/gdx/math/Vector2;

    iput-object v0, v6, Lbox2dLight/DirectionalLight;->start:[Lcom/badlogic/gdx/math/Vector2;

    .line 51
    iget v0, v6, Lbox2dLight/DirectionalLight;->rayNum:I

    new-array v0, v0, [Lcom/badlogic/gdx/math/Vector2;

    iput-object v0, v6, Lbox2dLight/DirectionalLight;->end:[Lcom/badlogic/gdx/math/Vector2;

    const/4 v0, 0x0

    const/4 v3, 0x0

    .line 52
    :goto_0
    iget v4, v6, Lbox2dLight/DirectionalLight;->rayNum:I

    if-ge v3, v4, :cond_0

    .line 53
    iget-object v4, v6, Lbox2dLight/DirectionalLight;->start:[Lcom/badlogic/gdx/math/Vector2;

    new-instance v5, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v5}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    aput-object v5, v4, v3

    .line 54
    iget-object v4, v6, Lbox2dLight/DirectionalLight;->end:[Lcom/badlogic/gdx/math/Vector2;

    new-instance v5, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v5}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    aput-object v5, v4, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 57
    :cond_0
    new-instance v3, Lcom/badlogic/gdx/graphics/Mesh;

    sget-object v8, Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;->VertexArray:Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;

    iget-boolean v9, v6, Lbox2dLight/DirectionalLight;->staticLight:Z

    iget v10, v6, Lbox2dLight/DirectionalLight;->vertexNum:I

    const/4 v11, 0x0

    const/4 v4, 0x3

    new-array v12, v4, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    new-instance v5, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v13, "vertex_positions"

    invoke-direct {v5, v1, v2, v13}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v5, v12, v0

    new-instance v5, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v14, "quad_colors"

    const/4 v15, 0x4

    invoke-direct {v5, v15, v15, v14}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v5, v12, v1

    new-instance v5, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const-string v7, "s"

    const/16 v15, 0x20

    invoke-direct {v5, v15, v1, v7}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v5, v12, v2

    move-object v5, v7

    move-object v7, v3

    invoke-direct/range {v7 .. v12}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    iput-object v3, v6, Lbox2dLight/DirectionalLight;->lightMesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 62
    new-instance v3, Lcom/badlogic/gdx/graphics/Mesh;

    sget-object v17, Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;->VertexArray:Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;

    iget-boolean v7, v6, Lbox2dLight/DirectionalLight;->staticLight:Z

    iget v8, v6, Lbox2dLight/DirectionalLight;->vertexNum:I

    const/16 v20, 0x0

    new-array v4, v4, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    new-instance v9, Lcom/badlogic/gdx/graphics/VertexAttribute;

    invoke-direct {v9, v1, v2, v13}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v9, v4, v0

    new-instance v0, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/4 v9, 0x4

    invoke-direct {v0, v9, v9, v14}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v0, v4, v1

    new-instance v0, Lcom/badlogic/gdx/graphics/VertexAttribute;

    invoke-direct {v0, v15, v1, v5}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v0, v4, v2

    move-object/from16 v16, v3

    move/from16 v18, v7

    move/from16 v19, v8

    move-object/from16 v21, v4

    invoke-direct/range {v16 .. v21}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(Lcom/badlogic/gdx/graphics/Mesh$VertexDataType;ZII[Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    iput-object v3, v6, Lbox2dLight/DirectionalLight;->softShadowMesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 68
    invoke-virtual/range {p0 .. p0}, Lbox2dLight/DirectionalLight;->update()V

    return-void
.end method


# virtual methods
.method public attachToBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public contains(FF)Z
    .locals 8

    .line 171
    iget-object v0, p0, Lbox2dLight/DirectionalLight;->mx:[F

    iget v1, p0, Lbox2dLight/DirectionalLight;->rayNum:I

    iget-object v2, p0, Lbox2dLight/DirectionalLight;->start:[Lcom/badlogic/gdx/math/Vector2;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v2, v0, v1

    .line 172
    iget-object v0, p0, Lbox2dLight/DirectionalLight;->my:[F

    iget v1, p0, Lbox2dLight/DirectionalLight;->rayNum:I

    iget-object v4, p0, Lbox2dLight/DirectionalLight;->start:[Lcom/badlogic/gdx/math/Vector2;

    aget-object v4, v4, v3

    iget v4, v4, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v4, v0, v1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 174
    :goto_0
    iget v5, p0, Lbox2dLight/DirectionalLight;->rayNum:I

    if-gt v0, v5, :cond_3

    .line 175
    iget-object v5, p0, Lbox2dLight/DirectionalLight;->mx:[F

    aget v5, v5, v0

    .line 176
    iget-object v6, p0, Lbox2dLight/DirectionalLight;->my:[F

    aget v6, v6, v0

    cmpg-float v7, v6, p2

    if-gez v7, :cond_0

    cmpl-float v7, v4, p2

    if-gez v7, :cond_1

    :cond_0
    cmpl-float v7, v6, p2

    if-ltz v7, :cond_2

    cmpg-float v7, v4, p2

    if-gez v7, :cond_2

    :cond_1
    sub-float v7, p2, v6

    sub-float/2addr v4, v6

    div-float/2addr v7, v4

    sub-float/2addr v2, v5

    mul-float v7, v7, v2

    sub-float v2, p1, v5

    cmpg-float v2, v7, v2

    if-gez v2, :cond_2

    xor-int/lit8 v1, v1, 0x1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    move v2, v5

    move v4, v6

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    .line 181
    :goto_1
    iget v5, p0, Lbox2dLight/DirectionalLight;->rayNum:I

    if-ge v0, v5, :cond_8

    .line 182
    iget-object v5, p0, Lbox2dLight/DirectionalLight;->start:[Lcom/badlogic/gdx/math/Vector2;

    aget-object v5, v5, v0

    iget v5, v5, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 183
    iget-object v6, p0, Lbox2dLight/DirectionalLight;->start:[Lcom/badlogic/gdx/math/Vector2;

    aget-object v6, v6, v0

    iget v6, v6, Lcom/badlogic/gdx/math/Vector2;->y:F

    cmpg-float v7, v6, p2

    if-gez v7, :cond_4

    cmpl-float v7, v4, p2

    if-gez v7, :cond_5

    :cond_4
    cmpl-float v7, v6, p2

    if-ltz v7, :cond_7

    cmpg-float v7, v4, p2

    if-gez v7, :cond_7

    :cond_5
    sub-float v7, p2, v6

    sub-float/2addr v4, v6

    div-float/2addr v7, v4

    sub-float/2addr v2, v5

    mul-float v7, v7, v2

    sub-float v2, p1, v5

    cmpg-float v2, v7, v2

    if-gez v2, :cond_7

    if-nez v1, :cond_6

    const/4 v1, 0x1

    goto :goto_2

    :cond_6
    const/4 v1, 0x0

    :cond_7
    :goto_2
    add-int/lit8 v0, v0, 0x1

    move v2, v5

    move v4, v6

    goto :goto_1

    :cond_8
    return v1
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getIgnoreAttachedBody()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public getX()F
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public getY()F
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method render()V
    .locals 5

    .line 158
    iget-object v0, p0, Lbox2dLight/DirectionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v1, v0, Lbox2dLight/RayHandler;->lightRenderedLastFrame:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lbox2dLight/RayHandler;->lightRenderedLastFrame:I

    .line 159
    iget-object v0, p0, Lbox2dLight/DirectionalLight;->lightMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p0, Lbox2dLight/DirectionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v1, v1, Lbox2dLight/RayHandler;->lightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    iget v2, p0, Lbox2dLight/DirectionalLight;->vertexNum:I

    const/4 v3, 0x0

    const/4 v4, 0x5

    invoke-virtual {v0, v1, v4, v3, v2}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    .line 162
    iget-boolean v0, p0, Lbox2dLight/DirectionalLight;->soft:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lbox2dLight/DirectionalLight;->xray:Z

    if-nez v0, :cond_0

    .line 163
    iget-object v0, p0, Lbox2dLight/DirectionalLight;->softShadowMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p0, Lbox2dLight/DirectionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v1, v1, Lbox2dLight/RayHandler;->lightShader:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    iget v2, p0, Lbox2dLight/DirectionalLight;->vertexNum:I

    invoke-virtual {v0, v1, v4, v3, v2}, Lcom/badlogic/gdx/graphics/Mesh;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;III)V

    :cond_0
    return-void
.end method

.method public setDirection(F)V
    .locals 1

    .line 73
    iput p1, p0, Lbox2dLight/DirectionalLight;->direction:F

    .line 74
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v0

    iput v0, p0, Lbox2dLight/DirectionalLight;->sin:F

    .line 75
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result p1

    iput p1, p0, Lbox2dLight/DirectionalLight;->cos:F

    .line 76
    iget-boolean p1, p0, Lbox2dLight/DirectionalLight;->staticLight:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lbox2dLight/DirectionalLight;->dirty:Z

    :cond_0
    return-void
.end method

.method public setDistance(F)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public setIgnoreAttachedBody(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public setPosition(FF)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public setPosition(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method update()V
    .locals 14

    .line 81
    iget-boolean v0, p0, Lbox2dLight/DirectionalLight;->staticLight:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lbox2dLight/DirectionalLight;->dirty:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 82
    iput-boolean v0, p0, Lbox2dLight/DirectionalLight;->dirty:Z

    .line 84
    iget-object v1, p0, Lbox2dLight/DirectionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v1, v1, Lbox2dLight/RayHandler;->x2:F

    iget-object v2, p0, Lbox2dLight/DirectionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v2, v2, Lbox2dLight/RayHandler;->x1:F

    sub-float/2addr v1, v2

    .line 85
    iget-object v2, p0, Lbox2dLight/DirectionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v2, v2, Lbox2dLight/RayHandler;->y2:F

    iget-object v3, p0, Lbox2dLight/DirectionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v3, v3, Lbox2dLight/RayHandler;->y1:F

    sub-float/2addr v2, v3

    cmpl-float v3, v1, v2

    if-lez v3, :cond_1

    goto :goto_0

    :cond_1
    move v1, v2

    .line 88
    :goto_0
    iget v2, p0, Lbox2dLight/DirectionalLight;->cos:F

    mul-float v2, v2, v1

    .line 89
    iget v3, p0, Lbox2dLight/DirectionalLight;->sin:F

    mul-float v3, v3, v1

    mul-float v4, v2, v2

    const v5, 0x3dcccccd    # 0.1f

    const/high16 v6, 0x3f800000    # 1.0f

    cmpg-float v4, v4, v5

    if-gez v4, :cond_2

    mul-float v4, v3, v3

    cmpg-float v4, v4, v5

    if-gez v4, :cond_2

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    .line 97
    :cond_2
    iget v4, p0, Lbox2dLight/DirectionalLight;->sin:F

    neg-float v4, v4

    mul-float v4, v4, v1

    .line 98
    iget v5, p0, Lbox2dLight/DirectionalLight;->cos:F

    mul-float v1, v1, v5

    .line 100
    iget-object v5, p0, Lbox2dLight/DirectionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v5, v5, Lbox2dLight/RayHandler;->x1:F

    iget-object v7, p0, Lbox2dLight/DirectionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v7, v7, Lbox2dLight/RayHandler;->x2:F

    add-float/2addr v5, v7

    const/high16 v7, 0x3f000000    # 0.5f

    mul-float v5, v5, v7

    sub-float/2addr v5, v4

    .line 101
    iget-object v8, p0, Lbox2dLight/DirectionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v8, v8, Lbox2dLight/RayHandler;->y1:F

    iget-object v9, p0, Lbox2dLight/DirectionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget v9, v9, Lbox2dLight/RayHandler;->y2:F

    add-float/2addr v8, v9

    mul-float v8, v8, v7

    sub-float/2addr v8, v1

    const/high16 v7, 0x40000000    # 2.0f

    mul-float v4, v4, v7

    .line 103
    iget v9, p0, Lbox2dLight/DirectionalLight;->rayNum:I

    add-int/lit8 v9, v9, -0x1

    int-to-float v9, v9

    div-float/2addr v4, v9

    mul-float v9, v4, v7

    div-float/2addr v5, v9

    .line 104
    invoke-static {v5}, Lcom/badlogic/gdx/math/MathUtils;->floor(F)I

    move-result v5

    int-to-float v5, v5

    mul-float v5, v5, v4

    mul-float v5, v5, v7

    mul-float v1, v1, v7

    .line 105
    iget v9, p0, Lbox2dLight/DirectionalLight;->rayNum:I

    add-int/lit8 v9, v9, -0x1

    int-to-float v9, v9

    div-float/2addr v1, v9

    mul-float v9, v1, v7

    div-float/2addr v8, v9

    .line 106
    invoke-static {v8}, Lcom/badlogic/gdx/math/MathUtils;->ceil(F)I

    move-result v8

    int-to-float v8, v8

    mul-float v8, v8, v1

    mul-float v8, v8, v7

    const/4 v7, 0x0

    .line 107
    :goto_1
    iget v9, p0, Lbox2dLight/DirectionalLight;->rayNum:I

    if-ge v7, v9, :cond_4

    int-to-float v9, v7

    mul-float v10, v9, v4

    add-float/2addr v10, v5

    mul-float v9, v9, v1

    add-float/2addr v9, v8

    .line 110
    iput v7, p0, Lbox2dLight/DirectionalLight;->m_index:I

    .line 111
    iget-object v11, p0, Lbox2dLight/DirectionalLight;->start:[Lcom/badlogic/gdx/math/Vector2;

    aget-object v12, v11, v7

    sub-float v13, v10, v2

    iput v13, v12, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 112
    aget-object v11, v11, v7

    sub-float v12, v9, v3

    iput v12, v11, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 114
    iget-object v11, p0, Lbox2dLight/DirectionalLight;->mx:[F

    iget-object v12, p0, Lbox2dLight/DirectionalLight;->end:[Lcom/badlogic/gdx/math/Vector2;

    aget-object v12, v12, v7

    add-float/2addr v10, v2

    iput v10, v12, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v10, v11, v7

    .line 115
    iget-object v10, p0, Lbox2dLight/DirectionalLight;->my:[F

    iget-object v11, p0, Lbox2dLight/DirectionalLight;->end:[Lcom/badlogic/gdx/math/Vector2;

    aget-object v11, v11, v7

    add-float/2addr v9, v3

    iput v9, v11, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v9, v10, v7

    .line 117
    iget-object v9, p0, Lbox2dLight/DirectionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v9, v9, Lbox2dLight/RayHandler;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v9, :cond_3

    iget-boolean v9, p0, Lbox2dLight/DirectionalLight;->xray:Z

    if-nez v9, :cond_3

    .line 118
    iget-object v9, p0, Lbox2dLight/DirectionalLight;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v9, v9, Lbox2dLight/RayHandler;->world:Lcom/badlogic/gdx/physics/box2d/World;

    iget-object v10, p0, Lbox2dLight/DirectionalLight;->ray:Lcom/badlogic/gdx/physics/box2d/RayCastCallback;

    iget-object v11, p0, Lbox2dLight/DirectionalLight;->start:[Lcom/badlogic/gdx/math/Vector2;

    aget-object v11, v11, v7

    iget-object v12, p0, Lbox2dLight/DirectionalLight;->end:[Lcom/badlogic/gdx/math/Vector2;

    aget-object v12, v12, v7

    invoke-virtual {v9, v10, v11, v12}, Lcom/badlogic/gdx/physics/box2d/World;->rayCast(Lcom/badlogic/gdx/physics/box2d/RayCastCallback;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V

    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 125
    :cond_4
    iget v1, p0, Lbox2dLight/DirectionalLight;->rayNum:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_2
    if-ge v2, v1, :cond_5

    .line 128
    iget-object v4, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v5, v3, 0x1

    iget-object v7, p0, Lbox2dLight/DirectionalLight;->start:[Lcom/badlogic/gdx/math/Vector2;

    aget-object v7, v7, v2

    iget v7, v7, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v7, v4, v3

    .line 129
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v4, v5, 0x1

    iget-object v7, p0, Lbox2dLight/DirectionalLight;->start:[Lcom/badlogic/gdx/math/Vector2;

    aget-object v7, v7, v2

    iget v7, v7, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v7, v3, v5

    .line 130
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v5, v4, 0x1

    iget v7, p0, Lbox2dLight/DirectionalLight;->colorF:F

    aput v7, v3, v4

    .line 131
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v4, v5, 0x1

    aput v6, v3, v5

    .line 132
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v5, v4, 0x1

    iget-object v7, p0, Lbox2dLight/DirectionalLight;->mx:[F

    aget v7, v7, v2

    aput v7, v3, v4

    .line 133
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v4, v5, 0x1

    iget-object v7, p0, Lbox2dLight/DirectionalLight;->my:[F

    aget v7, v7, v2

    aput v7, v3, v5

    .line 134
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v5, v4, 0x1

    iget v7, p0, Lbox2dLight/DirectionalLight;->colorF:F

    aput v7, v3, v4

    .line 135
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v4, v5, 0x1

    aput v6, v3, v5

    add-int/lit8 v2, v2, 0x1

    move v3, v4

    goto :goto_2

    .line 137
    :cond_5
    iget-object v2, p0, Lbox2dLight/DirectionalLight;->lightMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v4, p0, Lbox2dLight/DirectionalLight;->segments:[F

    invoke-virtual {v2, v4, v0, v3}, Lcom/badlogic/gdx/graphics/Mesh;->setVertices([FII)Lcom/badlogic/gdx/graphics/Mesh;

    .line 139
    iget-boolean v2, p0, Lbox2dLight/DirectionalLight;->soft:Z

    if-eqz v2, :cond_8

    iget-boolean v2, p0, Lbox2dLight/DirectionalLight;->xray:Z

    if-eqz v2, :cond_6

    goto :goto_4

    :cond_6
    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_3
    if-ge v2, v1, :cond_7

    .line 143
    iget-object v4, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v5, v3, 0x1

    iget-object v7, p0, Lbox2dLight/DirectionalLight;->mx:[F

    aget v7, v7, v2

    aput v7, v4, v3

    .line 144
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v4, v5, 0x1

    iget-object v7, p0, Lbox2dLight/DirectionalLight;->my:[F

    aget v7, v7, v2

    aput v7, v3, v5

    .line 145
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v5, v4, 0x1

    iget v7, p0, Lbox2dLight/DirectionalLight;->colorF:F

    aput v7, v3, v4

    .line 146
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v4, v5, 0x1

    aput v6, v3, v5

    .line 148
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v5, v4, 0x1

    iget-object v7, p0, Lbox2dLight/DirectionalLight;->mx:[F

    aget v7, v7, v2

    iget v8, p0, Lbox2dLight/DirectionalLight;->softShadowLength:F

    iget v9, p0, Lbox2dLight/DirectionalLight;->cos:F

    mul-float v8, v8, v9

    add-float/2addr v7, v8

    aput v7, v3, v4

    .line 149
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v4, v5, 0x1

    iget-object v7, p0, Lbox2dLight/DirectionalLight;->my:[F

    aget v7, v7, v2

    iget v8, p0, Lbox2dLight/DirectionalLight;->softShadowLength:F

    iget v9, p0, Lbox2dLight/DirectionalLight;->sin:F

    mul-float v8, v8, v9

    add-float/2addr v7, v8

    aput v7, v3, v5

    .line 150
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v5, v4, 0x1

    sget v7, Lbox2dLight/DirectionalLight;->zeroColorBits:F

    aput v7, v3, v4

    .line 151
    iget-object v3, p0, Lbox2dLight/DirectionalLight;->segments:[F

    add-int/lit8 v4, v5, 0x1

    aput v6, v3, v5

    add-int/lit8 v2, v2, 0x1

    move v3, v4

    goto :goto_3

    .line 153
    :cond_7
    iget-object v1, p0, Lbox2dLight/DirectionalLight;->softShadowMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v2, p0, Lbox2dLight/DirectionalLight;->segments:[F

    invoke-virtual {v1, v2, v0, v3}, Lcom/badlogic/gdx/graphics/Mesh;->setVertices([FII)Lcom/badlogic/gdx/graphics/Mesh;

    :cond_8
    :goto_4
    return-void
.end method
