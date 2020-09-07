.class public Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder;
.super Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/BaseShapeBuilder;
.source "ArrowShapeBuilder.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/BaseShapeBuilder;-><init>()V

    return-void
.end method

.method public static build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFFFFFFI)V
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p9

    .line 37
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder;->obtainV3()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v5

    invoke-virtual {v5, v1, v2, v3}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v5

    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder;->obtainV3()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v6

    move/from16 v7, p4

    move/from16 v8, p5

    move/from16 v9, p6

    invoke-virtual {v6, v7, v8, v9}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v6

    .line 38
    invoke-virtual {v5, v6}, Lcom/badlogic/gdx/math/Vector3;->dst(Lcom/badlogic/gdx/math/Vector3;)F

    move-result v7

    mul-float v8, v7, p7

    float-to-double v9, v8

    const-wide v11, 0x3fd5555560000000L    # 0.3333333432674408

    .line 40
    invoke-static {v11, v12}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v11

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v9, v9, v11

    double-to-float v9, v9

    const/high16 v10, 0x40000000    # 2.0f

    mul-float v9, v9, v10

    sub-float/2addr v7, v8

    mul-float v11, v9, p8

    .line 44
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder;->obtainV3()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v12

    invoke-virtual {v12, v6}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v12

    invoke-virtual {v12, v5}, Lcom/badlogic/gdx/math/Vector3;->sub(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v12

    invoke-virtual {v12}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v12

    .line 45
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder;->obtainV3()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v13

    invoke-virtual {v13, v12}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v13

    sget-object v14, Lcom/badlogic/gdx/math/Vector3;->Z:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v13, v14}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v13

    .line 46
    invoke-virtual {v13}, Lcom/badlogic/gdx/math/Vector3;->isZero()Z

    move-result v14

    if-eqz v14, :cond_0

    sget-object v14, Lcom/badlogic/gdx/math/Vector3;->X:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v13, v14}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 47
    :cond_0
    invoke-virtual {v13, v12}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v14

    invoke-virtual {v14}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 48
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder;->obtainV3()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v14

    invoke-virtual {v14, v12}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v14

    invoke-virtual {v14, v13}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v14

    invoke-virtual {v14}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v14

    .line 49
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder;->obtainV3()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v15

    invoke-virtual {v15, v6}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/badlogic/gdx/math/Vector3;->sub(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v5

    invoke-virtual {v5}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v5

    .line 52
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder;->obtainM4()Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v6

    invoke-interface {v0, v6}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->getVertexTransform(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v6

    .line 53
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder;->obtainM4()Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v15

    .line 54
    iget-object v10, v15, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v16, 0x0

    move/from16 p5, v8

    .line 55
    iget v8, v14, Lcom/badlogic/gdx/math/Vector3;->x:F

    aput v8, v10, v16

    const/4 v8, 0x4

    move/from16 p6, v9

    .line 56
    iget v9, v12, Lcom/badlogic/gdx/math/Vector3;->x:F

    aput v9, v10, v8

    const/16 v8, 0x8

    .line 57
    iget v9, v13, Lcom/badlogic/gdx/math/Vector3;->x:F

    aput v9, v10, v8

    const/4 v8, 0x1

    .line 58
    iget v9, v14, Lcom/badlogic/gdx/math/Vector3;->y:F

    aput v9, v10, v8

    const/4 v8, 0x5

    .line 59
    iget v9, v12, Lcom/badlogic/gdx/math/Vector3;->y:F

    aput v9, v10, v8

    const/16 v8, 0x9

    .line 60
    iget v9, v13, Lcom/badlogic/gdx/math/Vector3;->y:F

    aput v9, v10, v8

    const/4 v8, 0x2

    .line 61
    iget v9, v14, Lcom/badlogic/gdx/math/Vector3;->z:F

    aput v9, v10, v8

    const/4 v8, 0x6

    .line 62
    iget v9, v12, Lcom/badlogic/gdx/math/Vector3;->z:F

    aput v9, v10, v8

    const/16 v8, 0xa

    .line 63
    iget v9, v13, Lcom/badlogic/gdx/math/Vector3;->z:F

    aput v9, v10, v8

    .line 64
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder;->obtainM4()Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v8

    .line 67
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder;->obtainV3()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v9

    invoke-virtual {v9, v5}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v9

    const/high16 v10, 0x40000000    # 2.0f

    div-float v10, v7, v10

    invoke-virtual {v9, v10}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v9

    invoke-virtual {v9, v1, v2, v3}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v9

    invoke-virtual {v15, v9}, Lcom/badlogic/gdx/math/Matrix4;->setTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;

    .line 68
    invoke-virtual {v8, v15}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v9

    invoke-virtual {v9, v6}, Lcom/badlogic/gdx/math/Matrix4;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v9

    invoke-interface {v0, v9}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->setVertexTransform(Lcom/badlogic/gdx/math/Matrix4;)V

    .line 69
    invoke-static {v0, v11, v7, v11, v4}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/CylinderShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFI)V

    .line 72
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder;->obtainV3()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v9

    invoke-virtual {v9, v5}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v5

    invoke-virtual {v5, v7}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v5

    invoke-virtual {v5, v1, v2, v3}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v1

    invoke-virtual {v15, v1}, Lcom/badlogic/gdx/math/Matrix4;->setTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;

    .line 73
    invoke-virtual {v8, v15}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/badlogic/gdx/math/Matrix4;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->setVertexTransform(Lcom/badlogic/gdx/math/Matrix4;)V

    move/from16 v7, p5

    move/from16 v9, p6

    .line 74
    invoke-static {v0, v9, v7, v9, v4}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ConeShapeBuilder;->build(Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;FFFI)V

    .line 76
    invoke-interface {v0, v6}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->setVertexTransform(Lcom/badlogic/gdx/math/Matrix4;)V

    .line 77
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/utils/shapebuilders/ArrowShapeBuilder;->freeAll()V

    return-void
.end method
