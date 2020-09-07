.class public Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;
.super Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/BaseShapeBuilder;
.source "EllipseShapeBuilder.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/BaseShapeBuilder;-><init>()V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFIFFFFFF)V
    .locals 14

    const/4 v12, 0x0

    const/high16 v13, 0x43b40000    # 360.0f

    move-object v0, p0

    move v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    .line 149
    invoke-static/range {v0 .. v13}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFIFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFIFFFFFFFF)V
    .locals 20

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    .line 138
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v9, v10, v11}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2, v1}, Lcom/badlogic/gdx/math/Vector3;->crs(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 139
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v9, v10, v11}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    invoke-virtual {v0, v2, v1, v2}, Lcom/badlogic/gdx/math/Vector3;->crs(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 140
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Vector3;->len2()F

    move-result v0

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v1}, Lcom/badlogic/gdx/math/Vector3;->len2()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 141
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    invoke-virtual {v0, v9, v10, v11}, Lcom/badlogic/gdx/math/Vector3;->crs(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 142
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    iget v12, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    iget v13, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    iget v14, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    iget v15, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    move/from16 v16, v0

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    move/from16 v17, v0

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    move/from16 v18, p12

    move/from16 v19, p13

    invoke-static/range {v0 .. v19}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFIFFFFFFFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFIFFFFFFFFFFFFFF)V
    .locals 23

    move-object/from16 v0, p0

    move/from16 v1, p5

    move/from16 v2, p6

    move/from16 v3, p7

    move/from16 v4, p8

    move/from16 v5, p9

    move/from16 v6, p10

    move/from16 v7, p11

    move/from16 v8, p12

    move/from16 v9, p13

    move/from16 v10, p14

    move/from16 v11, p15

    move/from16 v12, p16

    move/from16 v13, p17

    const/4 v14, 0x0

    const/4 v15, 0x1

    cmpg-float v16, p3, v14

    if-lez v16, :cond_3

    cmpg-float v16, p4, v14

    if-gtz v16, :cond_0

    goto :goto_0

    :cond_0
    cmpl-float v16, p3, p1

    if-nez v16, :cond_2

    cmpl-float v16, p4, p2

    if-nez v16, :cond_2

    add-int/lit8 v14, v1, 0x1

    .line 168
    invoke-interface {v0, v14}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->ensureVertices(I)V

    .line 169
    invoke-interface {v0, v14}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->ensureIndices(I)V

    .line 170
    invoke-interface/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->getPrimitiveType()I

    move-result v14

    if-ne v14, v15, :cond_1

    goto :goto_1

    .line 171
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Incorrect primitive type : expect GL_LINES because innerWidth == width && innerHeight == height"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    add-int/lit8 v14, v1, 0x1

    mul-int/lit8 v15, v14, 0x2

    .line 174
    invoke-interface {v0, v15}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->ensureVertices(I)V

    .line 175
    invoke-interface {v0, v14}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->ensureRectangleIndices(I)V

    goto :goto_1

    :cond_3
    :goto_0
    add-int/lit8 v14, v1, 0x2

    .line 165
    invoke-interface {v0, v14}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->ensureVertices(I)V

    .line 166
    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->ensureTriangleIndices(I)V

    :goto_1
    const v14, 0x3c8efa35

    mul-float v15, p18, v14

    sub-float v18, p19, p18

    mul-float v18, v18, v14

    int-to-float v14, v1

    div-float v18, v18, v14

    .line 180
    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v14, v8, v9, v10}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v14

    move/from16 v19, v15

    const/high16 v15, 0x3f000000    # 0.5f

    mul-float v1, p1, v15

    invoke-virtual {v14, v1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v1

    .line 181
    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v14, v11, v12, v13}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v14

    move-object/from16 p18, v1

    mul-float v1, p2, v15

    invoke-virtual {v14, v1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v1

    .line 182
    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV3:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v14, v8, v9, v10}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v8

    mul-float v9, p3, v15

    invoke-virtual {v8, v9}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v8

    .line 183
    sget-object v9, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->tmpV4:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v9, v11, v12, v13}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v9

    mul-float v10, p4, v15

    invoke-virtual {v9, v10}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v9

    .line 184
    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->vertTmp3:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    const/4 v11, 0x0

    invoke-virtual {v10, v11, v11, v11, v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v10

    const/4 v12, 0x1

    .line 185
    iput-boolean v12, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->hasNormal:Z

    iput-boolean v12, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->hasPosition:Z

    iput-boolean v12, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->hasUV:Z

    .line 186
    iget-object v13, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->uv:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v13, v15, v15}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 187
    iget-object v13, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v13, v2, v3, v4}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 188
    iget-object v13, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->normal:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v13, v5, v6, v7}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 189
    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->vertTmp4:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    invoke-virtual {v13, v11, v11, v11, v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v11

    .line 190
    iput-boolean v12, v11, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->hasNormal:Z

    iput-boolean v12, v11, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->hasPosition:Z

    iput-boolean v12, v11, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->hasUV:Z

    .line 191
    iget-object v12, v11, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->uv:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v12, v15, v15}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 192
    iget-object v12, v11, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v12, v2, v3, v4}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 193
    iget-object v12, v11, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->normal:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v12, v5, v6, v7}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 194
    invoke-interface {v0, v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->vertex(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)S

    move-result v5

    div-float v6, p3, p1

    mul-float v6, v6, v15

    div-float v7, p4, p2

    mul-float v7, v7, v15

    const/4 v12, 0x0

    move/from16 v12, p5

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    :goto_2
    if-gt v13, v12, :cond_a

    int-to-float v15, v13

    mul-float v15, v15, v18

    add-float v15, v19, v15

    .line 201
    invoke-static {v15}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v17

    .line 202
    invoke-static {v15}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v15

    .line 203
    iget-object v12, v11, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v12, v2, v3, v4}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v12

    move/from16 p9, v5

    move/from16 p10, v7

    move-object/from16 v5, p18

    iget v7, v5, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v7, v7, v17

    move/from16 p11, v6

    iget v6, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v6, v6, v15

    add-float/2addr v7, v6

    iget v6, v5, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v6, v6, v17

    move-object/from16 p12, v9

    iget v9, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v9, v9, v15

    add-float/2addr v6, v9

    iget v9, v5, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v9, v9, v17

    iget v5, v1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v5, v5, v15

    add-float/2addr v9, v5

    invoke-virtual {v12, v7, v6, v9}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 205
    iget-object v5, v11, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->uv:Lcom/badlogic/gdx/math/Vector2;

    const/high16 v6, 0x3f000000    # 0.5f

    mul-float v7, v17, v6

    add-float/2addr v7, v6

    mul-float v9, v15, v6

    add-float/2addr v9, v6

    invoke-virtual {v5, v7, v9}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 206
    invoke-interface {v0, v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->vertex(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)S

    move-result v5

    const/4 v6, 0x0

    cmpg-float v7, p3, v6

    if-lez v7, :cond_9

    cmpg-float v7, p4, v6

    if-gtz v7, :cond_4

    goto :goto_3

    :cond_4
    cmpl-float v7, p3, p1

    if-nez v7, :cond_7

    cmpl-float v7, p4, p2

    if-nez v7, :cond_7

    if-eqz v13, :cond_5

    .line 212
    invoke-interface {v0, v5, v14}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->line(SS)V

    :cond_5
    move-object/from16 v12, p12

    move-object/from16 v22, v1

    move/from16 v6, v20

    move/from16 v9, v21

    const/high16 v7, 0x3f000000    # 0.5f

    :cond_6
    move/from16 v1, p9

    goto :goto_4

    .line 215
    :cond_7
    iget-object v7, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v7, v2, v3, v4}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v7

    iget v9, v8, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v9, v9, v17

    move-object/from16 v12, p12

    iget v14, v12, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v14, v14, v15

    add-float/2addr v9, v14

    iget v14, v8, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v14, v14, v17

    iget v6, v12, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v6, v6, v15

    add-float/2addr v14, v6

    iget v6, v8, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v6, v6, v17

    move-object/from16 v22, v1

    iget v1, v12, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v1, v1, v15

    add-float/2addr v6, v1

    invoke-virtual {v7, v9, v14, v6}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 217
    iget-object v1, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->uv:Lcom/badlogic/gdx/math/Vector2;

    mul-float v6, p11, v17

    const/high16 v7, 0x3f000000    # 0.5f

    add-float/2addr v6, v7

    mul-float v9, p10, v15

    add-float/2addr v9, v7

    invoke-virtual {v1, v6, v9}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 219
    invoke-interface {v0, v10}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->vertex(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)S

    move-result v1

    if-eqz v13, :cond_8

    move/from16 v6, v20

    move/from16 v9, v21

    .line 221
    invoke-interface {v0, v1, v5, v9, v6}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->rect(SSSS)V

    :cond_8
    move/from16 v20, v1

    move/from16 v21, v5

    move/from16 v1, p9

    goto :goto_5

    :cond_9
    :goto_3
    move-object/from16 v12, p12

    move-object/from16 v22, v1

    move/from16 v6, v20

    move/from16 v9, v21

    const/high16 v7, 0x3f000000    # 0.5f

    if-eqz v13, :cond_6

    move/from16 v1, p9

    .line 209
    invoke-interface {v0, v5, v14, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->triangle(SSS)V

    :goto_4
    move/from16 v20, v6

    move/from16 v21, v9

    :goto_5
    add-int/lit8 v13, v13, 0x1

    move/from16 v7, p10

    move/from16 v6, p11

    move v14, v5

    move-object v9, v12

    const/high16 v15, 0x3f000000    # 0.5f

    move/from16 v12, p5

    move v5, v1

    move-object/from16 v1, v22

    goto/16 :goto_2

    :cond_a
    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFILcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V
    .locals 14

    move-object/from16 v0, p6

    move-object/from16 v1, p7

    .line 156
    iget v6, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v7, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v8, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v9, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v10, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v11, v1, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/4 v12, 0x0

    const/high16 v13, 0x43b40000    # 360.0f

    move-object v0, p0

    move v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    invoke-static/range {v0 .. v13}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFIFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFIFFFFFF)V
    .locals 12

    const/4 v10, 0x0

    const/high16 v11, 0x43b40000    # 360.0f

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    .line 83
    invoke-static/range {v0 .. v11}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFIFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFIFFFFFFFF)V
    .locals 14

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move/from16 v2, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    move/from16 v12, p10

    move/from16 v13, p11

    .line 110
    invoke-static/range {v0 .. v13}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFIFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFIFFFFFFFFFFFF)V
    .locals 18

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    move/from16 v12, p12

    move/from16 v13, p13

    move/from16 v14, p14

    move/from16 v15, p15

    const/16 v16, 0x0

    const/high16 v17, 0x43b40000    # 360.0f

    .line 103
    invoke-static/range {v0 .. v17}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFIFFFFFFFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFIFFFFFFFFFFFFFF)V
    .locals 20

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    move/from16 v12, p10

    move/from16 v13, p11

    move/from16 v14, p12

    move/from16 v15, p13

    move/from16 v16, p14

    move/from16 v17, p15

    move/from16 v18, p16

    move/from16 v19, p17

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 130
    invoke-static/range {v0 .. v19}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFIFFFFFFFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFILcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V
    .locals 10

    .line 89
    iget v4, p4, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v5, p4, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v6, p4, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v7, p5, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v8, p5, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v9, p5, Lcom/badlogic/gdx/math/Vector3;->z:F

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-static/range {v0 .. v9}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFIFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFILcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;FF)V
    .locals 14

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    .line 116
    iget v6, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v7, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v8, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v9, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v10, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v11, v1, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move/from16 v2, p2

    move/from16 v5, p3

    move/from16 v12, p6

    move/from16 v13, p7

    invoke-static/range {v0 .. v13}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFIFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFILcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V
    .locals 16

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    move-object/from16 v3, p7

    .line 95
    iget v4, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v5, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v6, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v7, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v8, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v9, v1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v10, v2, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v11, v2, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v12, v2, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v13, v3, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v14, v3, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v15, v3, Lcom/badlogic/gdx/math/Vector3;->z:F

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    invoke-static/range {v0 .. v15}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFIFFFFFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFILcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;FF)V
    .locals 24

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    move-object/from16 v3, p7

    move-object/from16 v4, p0

    move/from16 v5, p1

    move/from16 v6, p2

    move/from16 v9, p3

    move/from16 v22, p8

    move/from16 v23, p9

    .line 122
    iget v10, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v11, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v12, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v13, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v14, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v15, v1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v0, v2, Lcom/badlogic/gdx/math/Vector3;->x:F

    move/from16 v16, v0

    iget v0, v2, Lcom/badlogic/gdx/math/Vector3;->y:F

    move/from16 v17, v0

    iget v0, v2, Lcom/badlogic/gdx/math/Vector3;->z:F

    move/from16 v18, v0

    iget v0, v3, Lcom/badlogic/gdx/math/Vector3;->x:F

    move/from16 v19, v0

    iget v0, v3, Lcom/badlogic/gdx/math/Vector3;->y:F

    move/from16 v20, v0

    iget v0, v3, Lcom/badlogic/gdx/math/Vector3;->z:F

    move/from16 v21, v0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v4 .. v23}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFIFFFFFFFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FIFFFFFF)V
    .locals 11

    const/4 v9, 0x0

    const/high16 v10, 0x43b40000    # 360.0f

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    .line 32
    invoke-static/range {v0 .. v10}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FIFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FIFFFFFFFF)V
    .locals 13

    const/high16 v0, 0x40000000    # 2.0f

    mul-float v3, p1, v0

    move-object v1, p0

    move v2, v3

    move v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    move/from16 v12, p10

    .line 57
    invoke-static/range {v1 .. v12}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFIFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FIFFFFFFFFFFFF)V
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    move/from16 v12, p12

    move/from16 v13, p13

    move/from16 v14, p14

    const/4 v15, 0x0

    const/high16 v16, 0x43b40000    # 360.0f

    .line 50
    invoke-static/range {v0 .. v16}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FIFFFFFFFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FIFFFFFFFFFFFFFF)V
    .locals 20

    move-object/from16 v0, p0

    move/from16 v5, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    move/from16 v10, p7

    move/from16 v11, p8

    move/from16 v12, p9

    move/from16 v13, p10

    move/from16 v14, p11

    move/from16 v15, p12

    move/from16 v16, p13

    move/from16 v17, p14

    move/from16 v18, p15

    move/from16 v19, p16

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v2, p1, v1

    move v1, v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 76
    invoke-static/range {v0 .. v19}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFIFFFFFFFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FILcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V
    .locals 9

    .line 37
    iget v3, p3, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v4, p3, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v5, p3, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v6, p4, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v7, p4, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v8, p4, Lcom/badlogic/gdx/math/Vector3;->z:F

    move-object v0, p0

    move v1, p1

    move v2, p2

    invoke-static/range {v0 .. v8}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FIFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FILcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;FF)V
    .locals 11

    move-object v0, p3

    move-object v1, p4

    .line 62
    iget v3, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v4, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v5, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v6, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v7, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v8, v1, Lcom/badlogic/gdx/math/Vector3;->z:F

    move-object v0, p0

    move v1, p1

    move v2, p2

    move/from16 v9, p5

    move/from16 v10, p6

    invoke-static/range {v0 .. v10}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FIFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FILcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V
    .locals 16

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    .line 43
    iget v4, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v5, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v6, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v7, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v8, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v9, v1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v10, v2, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v11, v2, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v12, v2, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v13, v3, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v14, v3, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v15, v3, Lcom/badlogic/gdx/math/Vector3;->z:F

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v7

    move v7, v8

    move v8, v9

    move v9, v10

    move v10, v11

    move v11, v12

    move v12, v13

    move v13, v14

    move v14, v15

    invoke-static/range {v0 .. v14}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FIFFFFFFFFFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FILcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;FF)V
    .locals 21

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    move-object/from16 v4, p0

    move/from16 v5, p1

    move/from16 v6, p2

    move/from16 v19, p7

    move/from16 v20, p8

    .line 68
    iget v7, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v8, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v9, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v10, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v11, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v12, v1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v13, v2, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v14, v2, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v15, v2, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v0, v3, Lcom/badlogic/gdx/math/Vector3;->x:F

    move/from16 v16, v0

    iget v0, v3, Lcom/badlogic/gdx/math/Vector3;->y:F

    move/from16 v17, v0

    iget v0, v3, Lcom/badlogic/gdx/math/Vector3;->z:F

    move/from16 v18, v0

    invoke-static/range {v4 .. v20}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FIFFFFFFFFFFFFFF)V

    return-void
.end method
