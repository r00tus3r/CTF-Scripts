.class public Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;
.super Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/BaseShapeBuilder;
.source "PatchShapeBuilder.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/BaseShapeBuilder;-><init>()V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFFFFFFFFFFFFII)V
    .locals 12

    move/from16 v0, p13

    move/from16 v1, p14

    move/from16 v2, p15

    .line 57
    sget-object v3, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->vertTmp1:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v3

    move v5, p1

    move v6, p2

    move v7, p3

    invoke-virtual {v3, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setPos(FFF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v3

    invoke-virtual {v3, v0, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setNor(FFF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v3

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    invoke-virtual {v3, v6, v5}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setUV(FF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v3

    sget-object v7, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->vertTmp2:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    .line 58
    invoke-virtual {v7, v4}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v7

    move/from16 v8, p4

    move/from16 v9, p5

    move/from16 v10, p6

    invoke-virtual {v7, v8, v9, v10}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setPos(FFF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v7

    invoke-virtual {v7, v0, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setNor(FFF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v7

    invoke-virtual {v7, v5, v5}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setUV(FF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v7

    sget-object v8, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->vertTmp3:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    .line 59
    invoke-virtual {v8, v4}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v8

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    invoke-virtual {v8, v9, v10, v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setPos(FFF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v8

    invoke-virtual {v8, v0, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setNor(FFF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v8

    invoke-virtual {v8, v5, v6}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setUV(FF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v5

    sget-object v8, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->vertTmp4:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    .line 60
    invoke-virtual {v8, v4}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v4

    move/from16 v8, p10

    move/from16 v9, p11

    move/from16 v10, p12

    invoke-virtual {v4, v8, v9, v10}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setPos(FFF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v4

    invoke-virtual {v4, v0, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setNor(FFF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v0

    invoke-virtual {v0, v6, v6}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setUV(FF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v0

    move-object p1, v3

    move-object p2, v7

    move-object p3, v5

    move-object/from16 p4, v0

    move/from16 p5, p16

    move/from16 p6, p17

    .line 57
    invoke-static/range {p0 .. p6}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;II)V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;II)V
    .locals 8

    const/4 v0, 0x1

    if-lt p5, v0, :cond_3

    if-lt p6, v0, :cond_3

    add-int/lit8 v1, p6, 0x1

    add-int/lit8 v2, p5, 0x1

    mul-int v1, v1, v2

    .line 33
    invoke-interface {p0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->ensureVertices(I)V

    mul-int v1, p6, p5

    .line 34
    invoke-interface {p0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->ensureRectangleIndices(I)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-gt v2, p5, :cond_2

    int-to-float v3, v2

    int-to-float v4, p5

    div-float/2addr v3, v4

    .line 37
    sget-object v4, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->vertTmp5:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    invoke-virtual {v4, p1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v4

    invoke-virtual {v4, p2, v3}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->lerp(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;F)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    .line 38
    sget-object v4, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->vertTmp6:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    invoke-virtual {v4, p4}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v4

    invoke-virtual {v4, p3, v3}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->lerp(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;F)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    const/4 v3, 0x0

    :goto_1
    if-gt v3, p6, :cond_1

    .line 40
    sget-object v4, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->vertTmp7:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    sget-object v5, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->vertTmp5:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v4

    sget-object v5, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->vertTmp6:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    int-to-float v6, v3

    int-to-float v7, p6

    div-float/2addr v6, v7

    invoke-virtual {v4, v5, v6}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->lerp(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;F)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v4

    invoke-interface {p0, v4}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->vertex(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;)S

    move-result v4

    if-lez v2, :cond_0

    if-lez v3, :cond_0

    sub-int v5, v4, p6

    add-int/lit8 v6, v5, -0x2

    int-to-short v6, v6

    add-int/lit8 v7, v4, -0x1

    int-to-short v7, v7

    sub-int/2addr v5, v0

    int-to-short v5, v5

    .line 41
    invoke-interface {p0, v6, v7, v4, v5}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->rect(SSSS)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-void

    .line 31
    :cond_3
    new-instance p0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "divisionsU and divisionV must be > 0, u,v: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p0

    :goto_3
    goto :goto_2
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;II)V
    .locals 12

    move-object/from16 v0, p5

    .line 49
    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->vertTmp1:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    const/4 v2, 0x0

    move-object v3, p1

    invoke-virtual {v1, p1, v0, v2, v2}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v1

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v3}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setUV(FF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v6

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->vertTmp2:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-object v5, p2

    invoke-virtual {v1, p2, v0, v2, v2}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v1

    invoke-virtual {v1, v3, v3}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setUV(FF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v7

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->vertTmp3:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-object v5, p3

    .line 50
    invoke-virtual {v1, p3, v0, v2, v2}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v1

    invoke-virtual {v1, v3, v4}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setUV(FF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v8

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->vertTmp4:Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-object/from16 v3, p4

    invoke-virtual {v1, v3, v0, v2, v2}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v0

    invoke-virtual {v0, v4, v4}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;->setUV(FF)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;

    move-result-object v9

    move-object v5, p0

    move/from16 v10, p6

    move/from16 v11, p7

    .line 49
    invoke-static/range {v5 .. v11}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/PatchShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder$VertexInfo;II)V

    return-void
.end method
