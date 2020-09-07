.class public Lcom/badlogic/gdx/math/Matrix3;
.super Ljava/lang/Object;
.source "Matrix3.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final M00:I = 0x0

.field public static final M01:I = 0x3

.field public static final M02:I = 0x6

.field public static final M10:I = 0x1

.field public static final M11:I = 0x4

.field public static final M12:I = 0x7

.field public static final M20:I = 0x2

.field public static final M21:I = 0x5

.field public static final M22:I = 0x8

.field private static final serialVersionUID:J = 0x6dbd5498495b94acL


# instance fields
.field private tmp:[F

.field public val:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x9

    .line 38
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    .line 39
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->tmp:[F

    .line 42
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix3;->idt()Lcom/badlogic/gdx/math/Matrix3;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Matrix3;)V
    .locals 2

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x9

    .line 38
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    .line 39
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->tmp:[F

    .line 46
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix3;->set(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Matrix3;

    return-void
.end method

.method public constructor <init>([F)V
    .locals 2

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x9

    .line 38
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    .line 39
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->tmp:[F

    .line 54
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix3;->set([F)Lcom/badlogic/gdx/math/Matrix3;

    return-void
.end method

.method private static mul([F[F)V
    .locals 20

    const/4 v0, 0x0

    .line 598
    aget v1, p0, v0

    aget v2, p1, v0

    mul-float v1, v1, v2

    const/4 v2, 0x3

    aget v3, p0, v2

    const/4 v4, 0x1

    aget v5, p1, v4

    mul-float v3, v3, v5

    add-float/2addr v1, v3

    const/4 v3, 0x6

    aget v5, p0, v3

    const/4 v6, 0x2

    aget v7, p1, v6

    mul-float v5, v5, v7

    add-float/2addr v1, v5

    .line 599
    aget v5, p0, v0

    aget v7, p1, v2

    mul-float v5, v5, v7

    aget v7, p0, v2

    const/4 v8, 0x4

    aget v9, p1, v8

    mul-float v7, v7, v9

    add-float/2addr v5, v7

    aget v7, p0, v3

    const/4 v9, 0x5

    aget v10, p1, v9

    mul-float v7, v7, v10

    add-float/2addr v5, v7

    .line 600
    aget v7, p0, v0

    aget v10, p1, v3

    mul-float v7, v7, v10

    aget v10, p0, v2

    const/4 v11, 0x7

    aget v12, p1, v11

    mul-float v10, v10, v12

    add-float/2addr v7, v10

    aget v10, p0, v3

    const/16 v12, 0x8

    aget v13, p1, v12

    mul-float v10, v10, v13

    add-float/2addr v7, v10

    .line 602
    aget v10, p0, v4

    aget v13, p1, v0

    mul-float v10, v10, v13

    aget v13, p0, v8

    aget v14, p1, v4

    mul-float v13, v13, v14

    add-float/2addr v10, v13

    aget v13, p0, v11

    aget v14, p1, v6

    mul-float v13, v13, v14

    add-float/2addr v10, v13

    .line 603
    aget v13, p0, v4

    aget v14, p1, v2

    mul-float v13, v13, v14

    aget v14, p0, v8

    aget v15, p1, v8

    mul-float v14, v14, v15

    add-float/2addr v13, v14

    aget v14, p0, v11

    aget v15, p1, v9

    mul-float v14, v14, v15

    add-float/2addr v13, v14

    .line 604
    aget v14, p0, v4

    aget v15, p1, v3

    mul-float v14, v14, v15

    aget v15, p0, v8

    aget v16, p1, v11

    mul-float v15, v15, v16

    add-float/2addr v14, v15

    aget v15, p0, v11

    aget v16, p1, v12

    mul-float v15, v15, v16

    add-float/2addr v14, v15

    .line 606
    aget v15, p0, v6

    aget v16, p1, v0

    mul-float v15, v15, v16

    aget v16, p0, v9

    aget v17, p1, v4

    mul-float v16, v16, v17

    add-float v15, v15, v16

    aget v16, p0, v12

    aget v17, p1, v6

    mul-float v16, v16, v17

    add-float v15, v15, v16

    .line 607
    aget v16, p0, v6

    aget v17, p1, v2

    mul-float v16, v16, v17

    aget v17, p0, v9

    aget v18, p1, v8

    mul-float v17, v17, v18

    add-float v16, v16, v17

    aget v17, p0, v12

    aget v18, p1, v9

    mul-float v17, v17, v18

    add-float v16, v16, v17

    .line 608
    aget v17, p0, v6

    aget v18, p1, v3

    mul-float v17, v17, v18

    aget v18, p0, v9

    aget v19, p1, v11

    mul-float v18, v18, v19

    add-float v17, v17, v18

    aget v18, p0, v12

    aget v19, p1, v12

    mul-float v18, v18, v19

    add-float v17, v17, v18

    .line 610
    aput v1, p0, v0

    .line 611
    aput v10, p0, v4

    .line 612
    aput v15, p0, v6

    .line 613
    aput v5, p0, v2

    .line 614
    aput v13, p0, v8

    .line 615
    aput v16, p0, v9

    .line 616
    aput v7, p0, v3

    .line 617
    aput v14, p0, v11

    .line 618
    aput v17, p0, v12

    return-void
.end method


# virtual methods
.method public det()F
    .locals 13

    .line 280
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x0

    .line 281
    aget v2, v0, v1

    const/4 v3, 0x4

    aget v4, v0, v3

    mul-float v2, v2, v4

    const/16 v4, 0x8

    aget v5, v0, v4

    mul-float v2, v2, v5

    const/4 v5, 0x3

    aget v6, v0, v5

    const/4 v7, 0x7

    aget v8, v0, v7

    mul-float v6, v6, v8

    const/4 v8, 0x2

    aget v9, v0, v8

    mul-float v6, v6, v9

    add-float/2addr v2, v6

    const/4 v6, 0x6

    aget v9, v0, v6

    const/4 v10, 0x1

    aget v11, v0, v10

    mul-float v9, v9, v11

    const/4 v11, 0x5

    aget v12, v0, v11

    mul-float v9, v9, v12

    add-float/2addr v2, v9

    aget v1, v0, v1

    aget v7, v0, v7

    mul-float v1, v1, v7

    aget v7, v0, v11

    mul-float v1, v1, v7

    sub-float/2addr v2, v1

    aget v1, v0, v5

    aget v5, v0, v10

    mul-float v1, v1, v5

    aget v4, v0, v4

    mul-float v1, v1, v4

    sub-float/2addr v2, v1

    aget v1, v0, v6

    aget v3, v0, v3

    mul-float v1, v1, v3

    aget v0, v0, v8

    mul-float v1, v1, v0

    sub-float/2addr v2, v1

    return v2
.end method

.method public getRotation()F
    .locals 5

    .line 536
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x1

    aget v1, v0, v1

    float-to-double v1, v1

    const/4 v3, 0x0

    aget v0, v0, v3

    float-to-double v3, v0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    double-to-float v0, v0

    const v1, 0x42652ee0

    mul-float v0, v0, v1

    return v0
.end method

.method public getRotationRad()F
    .locals 5

    .line 540
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x1

    aget v1, v0, v1

    float-to-double v1, v1

    const/4 v3, 0x0

    aget v0, v0, v3

    float-to-double v3, v0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public getScale(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 529
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x0

    .line 530
    aget v2, v0, v1

    aget v1, v0, v1

    mul-float v2, v2, v1

    const/4 v1, 0x3

    aget v3, v0, v1

    aget v1, v0, v1

    mul-float v3, v3, v1

    add-float/2addr v2, v3

    float-to-double v1, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-float v1, v1

    iput v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v1, 0x1

    .line 531
    aget v2, v0, v1

    aget v1, v0, v1

    mul-float v2, v2, v1

    const/4 v1, 0x4

    aget v3, v0, v1

    aget v0, v0, v1

    mul-float v3, v3, v0

    add-float/2addr v2, v3

    float-to-double v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    iput v0, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-object p1
.end method

.method public getTranslation(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 2

    .line 523
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x6

    aget v1, v0, v1

    iput v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v1, 0x7

    .line 524
    aget v0, v0, v1

    iput v0, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-object p1
.end method

.method public getValues()[F
    .locals 1

    .line 519
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    return-object v0
.end method

.method public idt()Lcom/badlogic/gdx/math/Matrix3;
    .locals 4

    .line 60
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    .line 61
    aput v1, v0, v2

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 62
    aput v2, v0, v3

    const/4 v3, 0x2

    .line 63
    aput v2, v0, v3

    const/4 v3, 0x3

    .line 64
    aput v2, v0, v3

    const/4 v3, 0x4

    .line 65
    aput v1, v0, v3

    const/4 v3, 0x5

    .line 66
    aput v2, v0, v3

    const/4 v3, 0x6

    .line 67
    aput v2, v0, v3

    const/4 v3, 0x7

    .line 68
    aput v2, v0, v3

    const/16 v2, 0x8

    .line 69
    aput v1, v0, v2

    return-object p0
.end method

.method public inv()Lcom/badlogic/gdx/math/Matrix3;
    .locals 15

    .line 289
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix3;->det()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    div-float/2addr v1, v0

    .line 293
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->tmp:[F

    iget-object v2, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v3, 0x4

    .line 295
    aget v4, v2, v3

    const/16 v5, 0x8

    aget v6, v2, v5

    mul-float v4, v4, v6

    const/4 v6, 0x5

    aget v7, v2, v6

    const/4 v8, 0x7

    aget v9, v2, v8

    mul-float v7, v7, v9

    sub-float/2addr v4, v7

    const/4 v7, 0x0

    aput v4, v0, v7

    const/4 v4, 0x2

    .line 296
    aget v9, v2, v4

    aget v10, v2, v8

    mul-float v9, v9, v10

    const/4 v10, 0x1

    aget v11, v2, v10

    aget v12, v2, v5

    mul-float v11, v11, v12

    sub-float/2addr v9, v11

    aput v9, v0, v10

    .line 297
    aget v9, v2, v10

    aget v11, v2, v6

    mul-float v9, v9, v11

    aget v11, v2, v4

    aget v12, v2, v3

    mul-float v11, v11, v12

    sub-float/2addr v9, v11

    aput v9, v0, v4

    .line 298
    aget v9, v2, v6

    const/4 v11, 0x6

    aget v12, v2, v11

    mul-float v9, v9, v12

    const/4 v12, 0x3

    aget v13, v2, v12

    aget v14, v2, v5

    mul-float v13, v13, v14

    sub-float/2addr v9, v13

    aput v9, v0, v12

    .line 299
    aget v9, v2, v7

    aget v13, v2, v5

    mul-float v9, v9, v13

    aget v13, v2, v4

    aget v14, v2, v11

    mul-float v13, v13, v14

    sub-float/2addr v9, v13

    aput v9, v0, v3

    .line 300
    aget v9, v2, v4

    aget v13, v2, v12

    mul-float v9, v9, v13

    aget v13, v2, v7

    aget v14, v2, v6

    mul-float v13, v13, v14

    sub-float/2addr v9, v13

    aput v9, v0, v6

    .line 301
    aget v9, v2, v12

    aget v13, v2, v8

    mul-float v9, v9, v13

    aget v13, v2, v3

    aget v14, v2, v11

    mul-float v13, v13, v14

    sub-float/2addr v9, v13

    aput v9, v0, v11

    .line 302
    aget v9, v2, v10

    aget v13, v2, v11

    mul-float v9, v9, v13

    aget v13, v2, v7

    aget v14, v2, v8

    mul-float v13, v13, v14

    sub-float/2addr v9, v13

    aput v9, v0, v8

    .line 303
    aget v9, v2, v7

    aget v13, v2, v3

    mul-float v9, v9, v13

    aget v13, v2, v10

    aget v14, v2, v12

    mul-float v13, v13, v14

    sub-float/2addr v9, v13

    aput v9, v0, v5

    .line 305
    aget v9, v0, v7

    mul-float v9, v9, v1

    aput v9, v2, v7

    .line 306
    aget v7, v0, v10

    mul-float v7, v7, v1

    aput v7, v2, v10

    .line 307
    aget v7, v0, v4

    mul-float v7, v7, v1

    aput v7, v2, v4

    .line 308
    aget v4, v0, v12

    mul-float v4, v4, v1

    aput v4, v2, v12

    .line 309
    aget v4, v0, v3

    mul-float v4, v4, v1

    aput v4, v2, v3

    .line 310
    aget v3, v0, v6

    mul-float v3, v3, v1

    aput v3, v2, v6

    .line 311
    aget v3, v0, v11

    mul-float v3, v3, v1

    aput v3, v2, v11

    .line 312
    aget v3, v0, v8

    mul-float v3, v3, v1

    aput v3, v2, v8

    .line 313
    aget v0, v0, v5

    mul-float v1, v1, v0

    aput v1, v2, v5

    return-object p0

    .line 290
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Can\'t invert a singular matrix"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Matrix3;
    .locals 23

    move-object/from16 v0, p0

    .line 81
    iget-object v1, v0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v2, 0x0

    .line 83
    aget v3, v1, v2

    move-object/from16 v4, p1

    iget-object v4, v4, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    aget v5, v4, v2

    mul-float v3, v3, v5

    const/4 v5, 0x3

    aget v6, v1, v5

    const/4 v7, 0x1

    aget v8, v4, v7

    mul-float v6, v6, v8

    add-float/2addr v3, v6

    const/4 v6, 0x6

    aget v8, v1, v6

    const/4 v9, 0x2

    aget v10, v4, v9

    mul-float v8, v8, v10

    add-float/2addr v3, v8

    .line 84
    aget v8, v1, v2

    aget v10, v4, v5

    mul-float v8, v8, v10

    aget v10, v1, v5

    const/4 v11, 0x4

    aget v12, v4, v11

    mul-float v10, v10, v12

    add-float/2addr v8, v10

    aget v10, v1, v6

    const/4 v12, 0x5

    aget v13, v4, v12

    mul-float v10, v10, v13

    add-float/2addr v8, v10

    .line 85
    aget v10, v1, v2

    aget v13, v4, v6

    mul-float v10, v10, v13

    aget v13, v1, v5

    const/4 v14, 0x7

    aget v15, v4, v14

    mul-float v13, v13, v15

    add-float/2addr v10, v13

    aget v13, v1, v6

    const/16 v15, 0x8

    aget v16, v4, v15

    mul-float v13, v13, v16

    add-float/2addr v10, v13

    .line 87
    aget v13, v1, v7

    aget v16, v4, v2

    mul-float v13, v13, v16

    aget v16, v1, v11

    aget v17, v4, v7

    mul-float v16, v16, v17

    add-float v13, v13, v16

    aget v16, v1, v14

    aget v17, v4, v9

    mul-float v16, v16, v17

    add-float v13, v13, v16

    .line 88
    aget v16, v1, v7

    aget v17, v4, v5

    mul-float v16, v16, v17

    aget v17, v1, v11

    aget v18, v4, v11

    mul-float v17, v17, v18

    add-float v16, v16, v17

    aget v17, v1, v14

    aget v18, v4, v12

    mul-float v17, v17, v18

    add-float v16, v16, v17

    .line 89
    aget v17, v1, v7

    aget v18, v4, v6

    mul-float v17, v17, v18

    aget v18, v1, v11

    aget v19, v4, v14

    mul-float v18, v18, v19

    add-float v17, v17, v18

    aget v18, v1, v14

    aget v19, v4, v15

    mul-float v18, v18, v19

    add-float v17, v17, v18

    .line 91
    aget v18, v1, v9

    aget v19, v4, v2

    mul-float v18, v18, v19

    aget v19, v1, v12

    aget v20, v4, v7

    mul-float v19, v19, v20

    add-float v18, v18, v19

    aget v19, v1, v15

    aget v20, v4, v9

    mul-float v19, v19, v20

    add-float v18, v18, v19

    .line 92
    aget v19, v1, v9

    aget v20, v4, v5

    mul-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v4, v11

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v15

    aget v21, v4, v12

    mul-float v20, v20, v21

    add-float v19, v19, v20

    .line 93
    aget v20, v1, v9

    aget v21, v4, v6

    mul-float v20, v20, v21

    aget v21, v1, v12

    aget v22, v4, v14

    mul-float v21, v21, v22

    add-float v20, v20, v21

    aget v21, v1, v15

    aget v4, v4, v15

    mul-float v21, v21, v4

    add-float v20, v20, v21

    .line 95
    aput v3, v1, v2

    .line 96
    aput v13, v1, v7

    .line 97
    aput v18, v1, v9

    .line 98
    aput v8, v1, v5

    .line 99
    aput v16, v1, v11

    .line 100
    aput v19, v1, v12

    .line 101
    aput v10, v1, v6

    .line 102
    aput v17, v1, v14

    .line 103
    aput v20, v1, v15

    return-object v0
.end method

.method public mulLeft(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Matrix3;
    .locals 23

    move-object/from16 v0, p0

    .line 116
    iget-object v1, v0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    move-object/from16 v2, p1

    .line 118
    iget-object v2, v2, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v3, 0x0

    aget v4, v2, v3

    aget v5, v1, v3

    mul-float v4, v4, v5

    const/4 v5, 0x3

    aget v6, v2, v5

    const/4 v7, 0x1

    aget v8, v1, v7

    mul-float v6, v6, v8

    add-float/2addr v4, v6

    const/4 v6, 0x6

    aget v8, v2, v6

    const/4 v9, 0x2

    aget v10, v1, v9

    mul-float v8, v8, v10

    add-float/2addr v4, v8

    .line 119
    aget v8, v2, v3

    aget v10, v1, v5

    mul-float v8, v8, v10

    aget v10, v2, v5

    const/4 v11, 0x4

    aget v12, v1, v11

    mul-float v10, v10, v12

    add-float/2addr v8, v10

    aget v10, v2, v6

    const/4 v12, 0x5

    aget v13, v1, v12

    mul-float v10, v10, v13

    add-float/2addr v8, v10

    .line 120
    aget v10, v2, v3

    aget v13, v1, v6

    mul-float v10, v10, v13

    aget v13, v2, v5

    const/4 v14, 0x7

    aget v15, v1, v14

    mul-float v13, v13, v15

    add-float/2addr v10, v13

    aget v13, v2, v6

    const/16 v15, 0x8

    aget v16, v1, v15

    mul-float v13, v13, v16

    add-float/2addr v10, v13

    .line 122
    aget v13, v2, v7

    aget v16, v1, v3

    mul-float v13, v13, v16

    aget v16, v2, v11

    aget v17, v1, v7

    mul-float v16, v16, v17

    add-float v13, v13, v16

    aget v16, v2, v14

    aget v17, v1, v9

    mul-float v16, v16, v17

    add-float v13, v13, v16

    .line 123
    aget v16, v2, v7

    aget v17, v1, v5

    mul-float v16, v16, v17

    aget v17, v2, v11

    aget v18, v1, v11

    mul-float v17, v17, v18

    add-float v16, v16, v17

    aget v17, v2, v14

    aget v18, v1, v12

    mul-float v17, v17, v18

    add-float v16, v16, v17

    .line 124
    aget v17, v2, v7

    aget v18, v1, v6

    mul-float v17, v17, v18

    aget v18, v2, v11

    aget v19, v1, v14

    mul-float v18, v18, v19

    add-float v17, v17, v18

    aget v18, v2, v14

    aget v19, v1, v15

    mul-float v18, v18, v19

    add-float v17, v17, v18

    .line 126
    aget v18, v2, v9

    aget v19, v1, v3

    mul-float v18, v18, v19

    aget v19, v2, v12

    aget v20, v1, v7

    mul-float v19, v19, v20

    add-float v18, v18, v19

    aget v19, v2, v15

    aget v20, v1, v9

    mul-float v19, v19, v20

    add-float v18, v18, v19

    .line 127
    aget v19, v2, v9

    aget v20, v1, v5

    mul-float v19, v19, v20

    aget v20, v2, v12

    aget v21, v1, v11

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v2, v15

    aget v21, v1, v12

    mul-float v20, v20, v21

    add-float v19, v19, v20

    .line 128
    aget v20, v2, v9

    aget v21, v1, v6

    mul-float v20, v20, v21

    aget v21, v2, v12

    aget v22, v1, v14

    mul-float v21, v21, v22

    add-float v20, v20, v21

    aget v2, v2, v15

    aget v21, v1, v15

    mul-float v2, v2, v21

    add-float v20, v20, v2

    .line 130
    aput v4, v1, v3

    .line 131
    aput v13, v1, v7

    .line 132
    aput v18, v1, v9

    .line 133
    aput v8, v1, v5

    .line 134
    aput v16, v1, v11

    .line 135
    aput v19, v1, v12

    .line 136
    aput v10, v1, v6

    .line 137
    aput v17, v1, v14

    .line 138
    aput v20, v1, v15

    return-object v0
.end method

.method public rotate(F)Lcom/badlogic/gdx/math/Matrix3;
    .locals 1

    const v0, 0x3c8efa35

    mul-float p1, p1, v0

    .line 449
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix3;->rotateRad(F)Lcom/badlogic/gdx/math/Matrix3;

    move-result-object p1

    return-object p1
.end method

.method public rotateRad(F)Lcom/badlogic/gdx/math/Matrix3;
    .locals 5

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_0

    return-object p0

    :cond_0
    float-to-double v1, p1

    .line 458
    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    double-to-float p1, v3

    .line 459
    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v1

    double-to-float v1, v1

    .line 460
    iget-object v2, p0, Lcom/badlogic/gdx/math/Matrix3;->tmp:[F

    const/4 v3, 0x0

    .line 462
    aput p1, v2, v3

    const/4 v3, 0x1

    .line 463
    aput v1, v2, v3

    const/4 v3, 0x2

    .line 464
    aput v0, v2, v3

    const/4 v3, 0x3

    neg-float v1, v1

    .line 466
    aput v1, v2, v3

    const/4 v1, 0x4

    .line 467
    aput p1, v2, v1

    const/4 p1, 0x5

    .line 468
    aput v0, v2, p1

    const/4 p1, 0x6

    .line 470
    aput v0, v2, p1

    const/4 p1, 0x7

    .line 471
    aput v0, v2, p1

    const/16 p1, 0x8

    const/high16 v0, 0x3f800000    # 1.0f

    .line 472
    aput v0, v2, p1

    .line 473
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    invoke-static {p1, v2}, Lcom/badlogic/gdx/math/Matrix3;->mul([F[F)V

    return-object p0
.end method

.method public scale(FF)Lcom/badlogic/gdx/math/Matrix3;
    .locals 2

    .line 483
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->tmp:[F

    const/4 v1, 0x0

    .line 484
    aput p1, v0, v1

    const/4 p1, 0x0

    const/4 v1, 0x1

    .line 485
    aput p1, v0, v1

    const/4 v1, 0x2

    .line 486
    aput p1, v0, v1

    const/4 v1, 0x3

    .line 487
    aput p1, v0, v1

    const/4 v1, 0x4

    .line 488
    aput p2, v0, v1

    const/4 p2, 0x5

    .line 489
    aput p1, v0, p2

    const/4 p2, 0x6

    .line 490
    aput p1, v0, p2

    const/4 p2, 0x7

    .line 491
    aput p1, v0, p2

    const/16 p1, 0x8

    const/high16 p2, 0x3f800000    # 1.0f

    .line 492
    aput p2, v0, p1

    .line 493
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    invoke-static {p1, v0}, Lcom/badlogic/gdx/math/Matrix3;->mul([F[F)V

    return-object p0
.end method

.method public scale(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Matrix3;
    .locals 3

    .line 502
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->tmp:[F

    .line 503
    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v2, 0x0

    aput v1, v0, v2

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 504
    aput v1, v0, v2

    const/4 v2, 0x2

    .line 505
    aput v1, v0, v2

    const/4 v2, 0x3

    .line 506
    aput v1, v0, v2

    .line 507
    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    const/4 v2, 0x4

    aput p1, v0, v2

    const/4 p1, 0x5

    .line 508
    aput v1, v0, p1

    const/4 p1, 0x6

    .line 509
    aput v1, v0, p1

    const/4 p1, 0x7

    .line 510
    aput v1, v0, p1

    const/16 p1, 0x8

    const/high16 v1, 0x3f800000    # 1.0f

    .line 511
    aput v1, v0, p1

    .line 512
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    invoke-static {p1, v0}, Lcom/badlogic/gdx/math/Matrix3;->mul([F[F)V

    return-object p0
.end method

.method public scl(F)Lcom/badlogic/gdx/math/Matrix3;
    .locals 3

    .line 547
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x0

    aget v2, v0, v1

    mul-float v2, v2, p1

    aput v2, v0, v1

    const/4 v1, 0x4

    .line 548
    aget v2, v0, v1

    mul-float v2, v2, p1

    aput v2, v0, v1

    return-object p0
.end method

.method public scl(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Matrix3;
    .locals 4

    .line 556
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x0

    aget v2, v0, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float v2, v2, v3

    aput v2, v0, v1

    .line 557
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x4

    aget v2, v0, v1

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float v2, v2, p1

    aput v2, v0, v1

    return-object p0
.end method

.method public scl(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix3;
    .locals 4

    .line 565
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x0

    aget v2, v0, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v2, v2, v3

    aput v2, v0, v1

    .line 566
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x4

    aget v2, v0, v1

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v2, v2, p1

    aput v2, v0, v1

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/math/Affine2;)Lcom/badlogic/gdx/math/Matrix3;
    .locals 4

    .line 330
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    .line 332
    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m00:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 333
    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m10:F

    const/4 v2, 0x1

    aput v1, v0, v2

    const/4 v1, 0x0

    const/4 v2, 0x2

    .line 334
    aput v1, v0, v2

    .line 335
    iget v2, p1, Lcom/badlogic/gdx/math/Affine2;->m01:F

    const/4 v3, 0x3

    aput v2, v0, v3

    .line 336
    iget v2, p1, Lcom/badlogic/gdx/math/Affine2;->m11:F

    const/4 v3, 0x4

    aput v2, v0, v3

    const/4 v2, 0x5

    .line 337
    aput v1, v0, v2

    .line 338
    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m02:F

    const/4 v2, 0x6

    aput v1, v0, v2

    .line 339
    iget p1, p1, Lcom/badlogic/gdx/math/Affine2;->m12:F

    const/4 v1, 0x7

    aput p1, v0, v1

    const/16 p1, 0x8

    const/high16 v1, 0x3f800000    # 1.0f

    .line 340
    aput v1, v0, p1

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Matrix3;
    .locals 3

    .line 322
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix3;
    .locals 4

    .line 349
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    .line 350
    iget-object v1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    aput v1, v0, v2

    .line 351
    iget-object v1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    aput v1, v0, v2

    .line 352
    iget-object v1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    aput v1, v0, v2

    .line 353
    iget-object v1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x4

    aget v1, v1, v2

    const/4 v3, 0x3

    aput v1, v0, v3

    .line 354
    iget-object v1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v3, 0x5

    aget v1, v1, v3

    aput v1, v0, v2

    .line 355
    iget-object v1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x6

    aget v1, v1, v2

    aput v1, v0, v3

    .line 356
    iget-object v1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v3, 0x8

    aget v1, v1, v3

    aput v1, v0, v2

    .line 357
    iget-object v1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v2, 0x9

    aget v1, v1, v2

    const/4 v2, 0x7

    aput v1, v0, v2

    .line 358
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0xa

    aget p1, p1, v1

    aput p1, v0, v3

    return-object p0
.end method

.method public set([F)Lcom/badlogic/gdx/math/Matrix3;
    .locals 3

    .line 369
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p0
.end method

.method public setToRotation(F)Lcom/badlogic/gdx/math/Matrix3;
    .locals 1

    const v0, 0x3c8efa35

    mul-float p1, p1, v0

    .line 147
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix3;->setToRotationRad(F)Lcom/badlogic/gdx/math/Matrix3;

    move-result-object p1

    return-object p1
.end method

.method public setToRotation(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Matrix3;
    .locals 1

    .line 174
    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v0

    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result p2

    invoke-virtual {p0, p1, v0, p2}, Lcom/badlogic/gdx/math/Matrix3;->setToRotation(Lcom/badlogic/gdx/math/Vector3;FF)Lcom/badlogic/gdx/math/Matrix3;

    move-result-object p1

    return-object p1
.end method

.method public setToRotation(Lcom/badlogic/gdx/math/Vector3;FF)Lcom/badlogic/gdx/math/Matrix3;
    .locals 4

    .line 178
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p2

    .line 180
    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v2, v2, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v2, v2, v3

    add-float/2addr v2, p2

    const/4 v3, 0x0

    aput v2, v0, v3

    .line 181
    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v2, v2, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v2, v2, v3

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v3, v3, p3

    sub-float/2addr v2, v3

    const/4 v3, 0x1

    aput v2, v0, v3

    .line 182
    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v2, v2, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v2, v2, v3

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v3, v3, p3

    add-float/2addr v2, v3

    const/4 v3, 0x2

    aput v2, v0, v3

    .line 183
    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v2, v2, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v2, v2, v3

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v3, v3, p3

    add-float/2addr v2, v3

    const/4 v3, 0x3

    aput v2, v0, v3

    .line 184
    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v2, v2, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v2, v2, v3

    add-float/2addr v2, p2

    const/4 v3, 0x4

    aput v2, v0, v3

    .line 185
    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v2, v2, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v2, v2, v3

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v3, v3, p3

    sub-float/2addr v2, v3

    const/4 v3, 0x5

    aput v2, v0, v3

    .line 186
    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v2, v2, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v2, v2, v3

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v3, v3, p3

    sub-float/2addr v2, v3

    const/4 v3, 0x6

    aput v2, v0, v3

    .line 187
    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v2, v2, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v2, v2, v3

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v3, v3, p3

    add-float/2addr v2, v3

    const/4 p3, 0x7

    aput v2, v0, p3

    .line 188
    iget p3, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v1, v1, p3

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v1, v1, p1

    add-float/2addr v1, p2

    const/16 p1, 0x8

    aput v1, v0, p1

    return-object p0
.end method

.method public setToRotationRad(F)Lcom/badlogic/gdx/math/Matrix3;
    .locals 4

    float-to-double v0, p1

    .line 154
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float p1, v2

    .line 155
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    .line 156
    iget-object v1, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v2, 0x0

    .line 158
    aput p1, v1, v2

    const/4 v2, 0x1

    .line 159
    aput v0, v1, v2

    const/4 v2, 0x0

    const/4 v3, 0x2

    .line 160
    aput v2, v1, v3

    neg-float v0, v0

    const/4 v3, 0x3

    .line 162
    aput v0, v1, v3

    const/4 v0, 0x4

    .line 163
    aput p1, v1, v0

    const/4 p1, 0x5

    .line 164
    aput v2, v1, p1

    const/4 p1, 0x6

    .line 166
    aput v2, v1, p1

    const/4 p1, 0x7

    .line 167
    aput v2, v1, p1

    const/16 p1, 0x8

    const/high16 v0, 0x3f800000    # 1.0f

    .line 168
    aput v0, v1, p1

    return-object p0
.end method

.method public setToScaling(FF)Lcom/badlogic/gdx/math/Matrix3;
    .locals 2

    .line 241
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x0

    .line 242
    aput p1, v0, v1

    const/4 p1, 0x0

    const/4 v1, 0x1

    .line 243
    aput p1, v0, v1

    const/4 v1, 0x2

    .line 244
    aput p1, v0, v1

    const/4 v1, 0x3

    .line 245
    aput p1, v0, v1

    const/4 v1, 0x4

    .line 246
    aput p2, v0, v1

    const/4 p2, 0x5

    .line 247
    aput p1, v0, p2

    const/4 p2, 0x6

    .line 248
    aput p1, v0, p2

    const/4 p2, 0x7

    .line 249
    aput p1, v0, p2

    const/16 p1, 0x8

    const/high16 p2, 0x3f800000    # 1.0f

    .line 250
    aput p2, v0, p1

    return-object p0
.end method

.method public setToScaling(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Matrix3;
    .locals 3

    .line 258
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    .line 259
    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v2, 0x0

    aput v1, v0, v2

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 260
    aput v1, v0, v2

    const/4 v2, 0x2

    .line 261
    aput v1, v0, v2

    const/4 v2, 0x3

    .line 262
    aput v1, v0, v2

    .line 263
    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    const/4 v2, 0x4

    aput p1, v0, v2

    const/4 p1, 0x5

    .line 264
    aput v1, v0, p1

    const/4 p1, 0x6

    .line 265
    aput v1, v0, p1

    const/4 p1, 0x7

    .line 266
    aput v1, v0, p1

    const/16 p1, 0x8

    const/high16 v1, 0x3f800000    # 1.0f

    .line 267
    aput v1, v0, p1

    return-object p0
.end method

.method public setToTranslation(FF)Lcom/badlogic/gdx/math/Matrix3;
    .locals 4

    .line 197
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    .line 199
    aput v1, v0, v2

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 200
    aput v2, v0, v3

    const/4 v3, 0x2

    .line 201
    aput v2, v0, v3

    const/4 v3, 0x3

    .line 203
    aput v2, v0, v3

    const/4 v3, 0x4

    .line 204
    aput v1, v0, v3

    const/4 v3, 0x5

    .line 205
    aput v2, v0, v3

    const/4 v2, 0x6

    .line 207
    aput p1, v0, v2

    const/4 p1, 0x7

    .line 208
    aput p2, v0, p1

    const/16 p1, 0x8

    .line 209
    aput v1, v0, p1

    return-object p0
.end method

.method public setToTranslation(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Matrix3;
    .locals 4

    .line 218
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    .line 220
    aput v1, v0, v2

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 221
    aput v2, v0, v3

    const/4 v3, 0x2

    .line 222
    aput v2, v0, v3

    const/4 v3, 0x3

    .line 224
    aput v2, v0, v3

    const/4 v3, 0x4

    .line 225
    aput v1, v0, v3

    const/4 v3, 0x5

    .line 226
    aput v2, v0, v3

    .line 228
    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v3, 0x6

    aput v2, v0, v3

    .line 229
    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    const/4 v2, 0x7

    aput p1, v0, v2

    const/16 p1, 0x8

    .line 230
    aput v1, v0, p1

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 272
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    .line 273
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    aget v2, v0, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "|"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x3

    aget v3, v0, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x6

    aget v3, v0, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, "]\n["

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x1

    aget v4, v0, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x4

    aget v4, v0, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x7

    aget v4, v0, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x2

    aget v3, v0, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x5

    aget v3, v0, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x8

    aget v0, v0, v2

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, "]"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public translate(FF)Lcom/badlogic/gdx/math/Matrix3;
    .locals 5

    .line 407
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    .line 408
    iget-object v1, p0, Lcom/badlogic/gdx/math/Matrix3;->tmp:[F

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    aput v2, v1, v3

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 409
    aput v3, v1, v4

    const/4 v4, 0x2

    .line 410
    aput v3, v1, v4

    const/4 v4, 0x3

    .line 412
    aput v3, v1, v4

    const/4 v4, 0x4

    .line 413
    aput v2, v1, v4

    const/4 v4, 0x5

    .line 414
    aput v3, v1, v4

    const/4 v3, 0x6

    .line 416
    aput p1, v1, v3

    const/4 p1, 0x7

    .line 417
    aput p2, v1, p1

    const/16 p1, 0x8

    .line 418
    aput v2, v1, p1

    .line 419
    invoke-static {v0, v1}, Lcom/badlogic/gdx/math/Matrix3;->mul([F[F)V

    return-object p0
.end method

.method public translate(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Matrix3;
    .locals 5

    .line 428
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    .line 429
    iget-object v1, p0, Lcom/badlogic/gdx/math/Matrix3;->tmp:[F

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    aput v2, v1, v3

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 430
    aput v3, v1, v4

    const/4 v4, 0x2

    .line 431
    aput v3, v1, v4

    const/4 v4, 0x3

    .line 433
    aput v3, v1, v4

    const/4 v4, 0x4

    .line 434
    aput v2, v1, v4

    const/4 v4, 0x5

    .line 435
    aput v3, v1, v4

    .line 437
    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v4, 0x6

    aput v3, v1, v4

    .line 438
    iget-object v1, p0, Lcom/badlogic/gdx/math/Matrix3;->tmp:[F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    const/4 v3, 0x7

    aput p1, v1, v3

    .line 439
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix3;->tmp:[F

    const/16 v1, 0x8

    aput v2, p1, v1

    .line 440
    invoke-static {v0, p1}, Lcom/badlogic/gdx/math/Matrix3;->mul([F[F)V

    return-object p0
.end method

.method public transpose()Lcom/badlogic/gdx/math/Matrix3;
    .locals 13

    .line 574
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x1

    .line 575
    aget v2, v0, v1

    const/4 v3, 0x2

    .line 576
    aget v4, v0, v3

    const/4 v5, 0x3

    .line 577
    aget v6, v0, v5

    const/4 v7, 0x5

    .line 578
    aget v8, v0, v7

    const/4 v9, 0x6

    .line 579
    aget v10, v0, v9

    const/4 v11, 0x7

    .line 580
    aget v12, v0, v11

    .line 581
    aput v2, v0, v5

    .line 582
    aput v4, v0, v9

    .line 583
    aput v6, v0, v1

    .line 584
    aput v8, v0, v11

    .line 585
    aput v10, v0, v3

    .line 586
    aput v12, v0, v7

    return-object p0
.end method

.method public trn(FF)Lcom/badlogic/gdx/math/Matrix3;
    .locals 3

    .line 387
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x6

    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    const/4 p1, 0x7

    .line 388
    aget v1, v0, p1

    add-float/2addr v1, p2

    aput v1, v0, p1

    return-object p0
.end method

.method public trn(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Matrix3;
    .locals 4

    .line 377
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x6

    aget v2, v0, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float/2addr v2, v3

    aput v2, v0, v1

    .line 378
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x7

    aget v2, v0, v1

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-float/2addr v2, p1

    aput v2, v0, v1

    return-object p0
.end method

.method public trn(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix3;
    .locals 4

    .line 396
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x6

    aget v2, v0, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-float/2addr v2, v3

    aput v2, v0, v1

    .line 397
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v1, 0x7

    aget v2, v0, v1

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr v2, p1

    aput v2, v0, v1

    return-object p0
.end method
