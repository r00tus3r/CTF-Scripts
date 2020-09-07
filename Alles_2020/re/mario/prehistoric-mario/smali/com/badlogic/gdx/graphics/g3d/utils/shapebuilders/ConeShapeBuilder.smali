.class public Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ConeShapeBuilder;
.super Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/BaseShapeBuilder;
.source "ConeShapeBuilder.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/BaseShapeBuilder;-><init>()V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFI)V
    .locals 7

    const/4 v5, 0x0

    const/high16 v6, 0x43b40000    # 360.0f

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .line 27
    invoke-static/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ConeShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFIFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFIFF)V
    .locals 8

    const/4 v7, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .line 32
    invoke-static/range {v0 .. v7}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ConeShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFIFFZ)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFIFFZ)V
    .locals 20

    move-object/from16 v0, p0

    move/from16 v5, p4

    add-int/lit8 v1, v5, 0x2

    .line 38
    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->ensureVertices(I)V

    .line 39
    invoke-interface {v0, v5}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->ensureTriangleIndices(I)V

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v2, p1, v1

    mul-float v7, p2, v1

    mul-float v3, p3, v1

    const v4, 0x3c8efa35

    mul-float v6, p5, v4

    sub-float v8, p6, p5

    mul-float v8, v8, v4

    int-to-float v4, v5

    div-float/2addr v8, v4

    const/high16 v9, 0x3f800000    # 1.0f

    div-float v4, v9, v4

    .line 49
    sget-object v10, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ConeShapeBuilder;->vertTmp3:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    const/4 v11, 0x0

    invoke-virtual {v10, v11, v11, v11, v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v10

    const/4 v12, 0x1

    .line 50
    iput-boolean v12, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->hasNormal:Z

    iput-boolean v12, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->hasPosition:Z

    iput-boolean v12, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->hasUV:Z

    .line 51
    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ConeShapeBuilder;->vertTmp4:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    invoke-virtual {v12, v11, v11, v11, v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12, v7, v12}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setPos(FFF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v11

    invoke-virtual {v11, v12, v9, v12}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setNor(FFF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v11

    invoke-virtual {v11, v1, v12}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setUV(FF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v1

    .line 52
    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->vertex(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)S

    move-result v1

    const/4 v11, 0x0

    const/4 v13, 0x0

    :goto_0
    if-gt v11, v5, :cond_1

    int-to-float v14, v11

    mul-float v15, v8, v14

    add-float/2addr v15, v6

    mul-float v14, v14, v4

    sub-float v14, v9, v14

    .line 57
    iget-object v9, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-static {v15}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v16

    mul-float v12, v16, v2

    invoke-static {v15}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v15

    mul-float v15, v15, v3

    move/from16 v16, v2

    const/4 v2, 0x0

    invoke-virtual {v9, v12, v2, v15}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 58
    iget-object v9, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget-object v12, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v9, v12}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v9

    invoke-virtual {v9}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 59
    iget-object v9, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->position:Lcom/badlogic/gdx/math/Vector3;

    neg-float v12, v7

    iput v12, v9, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 60
    iget-object v9, v10, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->uv:Lcom/badlogic/gdx/math/Vector2;

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-virtual {v9, v14, v12}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 61
    invoke-interface {v0, v10}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->vertex(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)S

    move-result v9

    if-eqz v11, :cond_0

    .line 62
    invoke-interface {v0, v1, v9, v13}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->triangle(SSS)V

    :cond_0
    add-int/lit8 v11, v11, 0x1

    move v13, v9

    move/from16 v2, v16

    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v12, 0x0

    goto :goto_0

    :cond_1
    if-eqz p7, :cond_2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    neg-float v7, v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/high16 v10, -0x40800000    # -1.0f

    const/4 v11, 0x0

    const/high16 v12, -0x40800000    # -1.0f

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/high16 v17, 0x3f800000    # 1.0f

    const/high16 v1, 0x43340000    # 180.0f

    sub-float v18, v1, p6

    sub-float v19, v1, p5

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p3

    move/from16 v5, p4

    .line 66
    invoke-static/range {v0 .. v19}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/EllipseShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFIFFFFFFFFFFFFFF)V

    :cond_2
    return-void
.end method
