.class public Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;
.super Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/BaseShapeBuilder;
.source "SphereShapeBuilder.java"


# static fields
.field private static final normalTransform:Lcom/badlogic/gdx/math/Matrix3;

.field private static final tmpIndices:Lcom/badlogic/gdx/utils/ShortArray;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    new-instance v0, Lcom/badlogic/gdx/utils/ShortArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ShortArray;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->tmpIndices:Lcom/badlogic/gdx/utils/ShortArray;

    .line 30
    new-instance v0, Lcom/badlogic/gdx/math/Matrix3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->normalTransform:Lcom/badlogic/gdx/math/Matrix3;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/BaseShapeBuilder;-><init>()V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFII)V
    .locals 10

    const/4 v6, 0x0

    const/high16 v7, 0x43b40000    # 360.0f

    const/4 v8, 0x0

    const/high16 v9, 0x43340000    # 180.0f

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    .line 33
    invoke-static/range {v0 .. v9}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFIIFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFIIFFFF)V
    .locals 12

    .line 45
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->matTmp1:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v2

    move-object v1, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    invoke-static/range {v1 .. v11}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;Lcom/badlogic/gdx/math/Matrix4;FFFIIFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;Lcom/badlogic/gdx/math/Matrix4;FFFII)V
    .locals 11
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v7, 0x0

    const/high16 v8, 0x43b40000    # 360.0f

    const/4 v9, 0x0

    const/high16 v10, 0x43340000    # 180.0f

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    .line 40
    invoke-static/range {v0 .. v10}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;Lcom/badlogic/gdx/math/Matrix4;FFFIIFFFF)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;Lcom/badlogic/gdx/math/Matrix4;FFFIIFFFF)V
    .locals 22
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p5

    move/from16 v3, p6

    const/high16 v4, 0x3f000000    # 0.5f

    mul-float v5, p2, v4

    mul-float v6, p3, v4

    mul-float v4, v4, p4

    const v7, 0x3c8efa35

    mul-float v8, p7, v7

    sub-float v9, p8, p7

    mul-float v9, v9, v7

    int-to-float v10, v2

    div-float/2addr v9, v10

    mul-float v11, p9, v7

    sub-float v12, p10, p9

    mul-float v12, v12, v7

    int-to-float v7, v3

    div-float/2addr v12, v7

    const/high16 v13, 0x3f800000    # 1.0f

    div-float v10, v13, v10

    div-float v7, v13, v7

    .line 66
    sget-object v14, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->vertTmp3:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    const/4 v15, 0x0

    invoke-virtual {v14, v15, v15, v15, v15}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v14

    const/4 v15, 0x1

    .line 67
    iput-boolean v15, v14, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->hasNormal:Z

    iput-boolean v15, v14, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->hasPosition:Z

    iput-boolean v15, v14, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->hasUV:Z

    .line 69
    sget-object v15, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->normalTransform:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v15, v1}, Lcom/badlogic/gdx/math/Matrix3;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix3;

    add-int/lit8 v15, v2, 0x3

    .line 72
    sget-object v16, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->tmpIndices:Lcom/badlogic/gdx/utils/ShortArray;

    invoke-virtual/range {v16 .. v16}, Lcom/badlogic/gdx/utils/ShortArray;->clear()V

    .line 73
    sget-object v13, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->tmpIndices:Lcom/badlogic/gdx/utils/ShortArray;

    mul-int/lit8 v1, v2, 0x2

    invoke-virtual {v13, v1}, Lcom/badlogic/gdx/utils/ShortArray;->ensureCapacity(I)[S

    .line 74
    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->tmpIndices:Lcom/badlogic/gdx/utils/ShortArray;

    iput v15, v1, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    add-int/lit8 v1, v3, 0x1

    add-int/lit8 v13, v2, 0x1

    mul-int v1, v1, v13

    .line 77
    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->ensureVertices(I)V

    .line 78
    invoke-interface {v0, v2}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->ensureRectangleIndices(I)V

    const/4 v1, 0x0

    const/16 v16, 0x0

    :goto_0
    if-gt v1, v3, :cond_2

    int-to-float v3, v1

    mul-float v17, v12, v3

    add-float v17, v11, v17

    mul-float v3, v3, v7

    .line 82
    invoke-static/range {v17 .. v17}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v18

    .line 83
    invoke-static/range {v17 .. v17}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v17

    move/from16 p4, v7

    mul-float v7, v17, v6

    move/from16 v17, v6

    move/from16 p7, v11

    move/from16 v11, v16

    const/4 v6, 0x0

    :goto_1
    if-gt v6, v2, :cond_1

    move/from16 p8, v12

    int-to-float v12, v6

    mul-float v16, v9, v12

    add-float v16, v8, v16

    mul-float v12, v12, v10

    const/high16 v19, 0x3f800000    # 1.0f

    sub-float v12, v19, v12

    move/from16 p2, v8

    .line 87
    iget-object v8, v14, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-static/range {v16 .. v16}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v20

    mul-float v20, v20, v5

    move/from16 v21, v5

    mul-float v5, v20, v18

    invoke-static/range {v16 .. v16}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v16

    mul-float v16, v16, v4

    move/from16 v20, v4

    mul-float v4, v16, v18

    invoke-virtual {v8, v5, v7, v4}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 88
    iget-object v4, v14, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->normal:Lcom/badlogic/gdx/math/Vector3;

    iget-object v5, v14, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v4

    sget-object v5, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->normalTransform:Lcom/badlogic/gdx/math/Matrix3;

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v4

    invoke-virtual {v4}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 89
    iget-object v4, v14, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->position:Lcom/badlogic/gdx/math/Vector3;

    move-object/from16 v5, p1

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    .line 90
    iget-object v4, v14, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->uv:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v4, v12, v3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 91
    sget-object v4, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->tmpIndices:Lcom/badlogic/gdx/utils/ShortArray;

    invoke-interface {v0, v14}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->vertex(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)S

    move-result v8

    invoke-virtual {v4, v11, v8}, Lcom/badlogic/gdx/utils/ShortArray;->set(IS)V

    add-int v4, v11, v15

    if-lez v1, :cond_0

    if-lez v6, :cond_0

    .line 94
    sget-object v8, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->tmpIndices:Lcom/badlogic/gdx/utils/ShortArray;

    invoke-virtual {v8, v11}, Lcom/badlogic/gdx/utils/ShortArray;->get(I)S

    move-result v8

    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->tmpIndices:Lcom/badlogic/gdx/utils/ShortArray;

    add-int/lit8 v16, v4, -0x1

    move/from16 p9, v3

    rem-int v3, v16, v15

    invoke-virtual {v12, v3}, Lcom/badlogic/gdx/utils/ShortArray;->get(I)S

    move-result v3

    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->tmpIndices:Lcom/badlogic/gdx/utils/ShortArray;

    add-int/lit8 v16, v2, 0x2

    sub-int v16, v4, v16

    rem-int v2, v16, v15

    invoke-virtual {v12, v2}, Lcom/badlogic/gdx/utils/ShortArray;->get(I)S

    move-result v2

    sget-object v12, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->tmpIndices:Lcom/badlogic/gdx/utils/ShortArray;

    sub-int/2addr v4, v13

    rem-int/2addr v4, v15

    .line 95
    invoke-virtual {v12, v4}, Lcom/badlogic/gdx/utils/ShortArray;->get(I)S

    move-result v4

    .line 94
    invoke-interface {v0, v8, v3, v2, v4}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->rect(SSSS)V

    goto :goto_2

    :cond_0
    move/from16 p9, v3

    :goto_2
    add-int/lit8 v11, v11, 0x1

    .line 96
    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/SphereShapeBuilder;->tmpIndices:Lcom/badlogic/gdx/utils/ShortArray;

    iget v2, v2, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    rem-int/2addr v11, v2

    add-int/lit8 v6, v6, 0x1

    move/from16 v8, p2

    move/from16 v2, p5

    move/from16 v12, p8

    move/from16 v3, p9

    move/from16 v4, v20

    move/from16 v5, v21

    goto/16 :goto_1

    :cond_1
    move/from16 v20, v4

    move/from16 v21, v5

    move/from16 p2, v8

    move/from16 p8, v12

    const/high16 v19, 0x3f800000    # 1.0f

    move-object/from16 v5, p1

    add-int/lit8 v1, v1, 0x1

    move/from16 v7, p4

    move/from16 v2, p5

    move/from16 v3, p6

    move/from16 v16, v11

    move/from16 v6, v17

    move/from16 v5, v21

    move/from16 v11, p7

    goto/16 :goto_0

    :cond_2
    return-void
.end method
