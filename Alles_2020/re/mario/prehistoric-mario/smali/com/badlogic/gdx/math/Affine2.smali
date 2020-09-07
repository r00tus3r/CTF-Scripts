.class public final Lcom/badlogic/gdx/math/Affine2;
.super Ljava/lang/Object;
.source "Affine2.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x15285b8a50dae163L


# instance fields
.field public m00:F

.field public m01:F

.field public m02:F

.field public m10:F

.field public m11:F

.field public m12:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 32
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    const/4 v1, 0x0

    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 33
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Affine2;)V
    .locals 2

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 32
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    const/4 v1, 0x0

    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 33
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    .line 45
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Affine2;->set(Lcom/badlogic/gdx/math/Affine2;)Lcom/badlogic/gdx/math/Affine2;

    return-void
.end method


# virtual methods
.method public applyTo(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 4

    .line 656
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 657
    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 658
    iget v2, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v2, v2, v0

    iget v3, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v3, v3, v1

    add-float/2addr v2, v3

    iget v3, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    add-float/2addr v2, v3

    iput v2, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 659
    iget v2, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v2, v2, v0

    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v0, v0, v1

    add-float/2addr v2, v0

    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    add-float/2addr v2, v0

    iput v2, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-void
.end method

.method public det()F
    .locals 3

    .line 630
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v0, v0, v1

    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    iget v2, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v1, v1, v2

    sub-float/2addr v0, v1

    return v0
.end method

.method public getTranslation(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 1

    .line 637
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    iput v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 638
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    iput v0, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-object p1
.end method

.method public idt()Lcom/badlogic/gdx/math/Affine2;
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    .line 51
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    const/4 v1, 0x0

    .line 52
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 53
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 54
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 55
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 56
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public inv()Lcom/badlogic/gdx/math/Affine2;
    .locals 9

    .line 340
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Affine2;->det()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    div-float/2addr v1, v0

    .line 345
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 346
    iget v2, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    neg-float v3, v2

    .line 347
    iget v4, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    mul-float v2, v2, v4

    iget v5, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    mul-float v6, v0, v5

    sub-float/2addr v2, v6

    .line 348
    iget v6, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    neg-float v7, v6

    .line 349
    iget v8, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v6, v6, v5

    mul-float v4, v4, v8

    sub-float/2addr v6, v4

    mul-float v0, v0, v1

    .line 352
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v3, v3, v1

    .line 353
    iput v3, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v2, v2, v1

    .line 354
    iput v2, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    mul-float v7, v7, v1

    .line 355
    iput v7, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v8, v8, v1

    .line 356
    iput v8, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v1, v1, v6

    .line 357
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0

    .line 341
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Can\'t invert a singular affine matrix"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isIdt()Z
    .locals 3

    .line 651
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    const/4 v2, 0x0

    cmpl-float v0, v0, v2

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isTranslation()Z
    .locals 2

    .line 645
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public mul(Lcom/badlogic/gdx/math/Affine2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 10

    .line 369
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v2, v0, v1

    iget v3, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    iget v4, p1, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v5, v3, v4

    add-float/2addr v2, v5

    .line 370
    iget v5, p1, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v6, v0, v5

    iget v7, p1, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v8, v3, v7

    add-float/2addr v6, v8

    .line 371
    iget v8, p1, Lcom/badlogic/gdx/math/Affine2;->m02:F

    mul-float v0, v0, v8

    iget p1, p1, Lcom/badlogic/gdx/math/Affine2;->m12:F

    mul-float v3, v3, p1

    add-float/2addr v0, v3

    iget v3, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    add-float/2addr v0, v3

    .line 372
    iget v3, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v1, v1, v3

    iget v9, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v4, v4, v9

    add-float/2addr v1, v4

    mul-float v5, v5, v3

    mul-float v7, v7, v9

    add-float/2addr v5, v7

    mul-float v3, v3, v8

    mul-float v9, v9, p1

    add-float/2addr v3, v9

    .line 374
    iget p1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    add-float/2addr v3, p1

    .line 376
    iput v2, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 377
    iput v6, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 378
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 379
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 380
    iput v5, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 381
    iput v3, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public preMul(Lcom/badlogic/gdx/math/Affine2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 11

    .line 393
    iget v0, p1, Lcom/badlogic/gdx/math/Affine2;->m00:F

    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v2, v0, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Affine2;->m01:F

    iget v4, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v5, v3, v4

    add-float/2addr v2, v5

    .line 394
    iget v5, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v6, v0, v5

    iget v7, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v8, v3, v7

    add-float/2addr v6, v8

    .line 395
    iget v8, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    mul-float v0, v0, v8

    iget v9, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    mul-float v3, v3, v9

    add-float/2addr v0, v3

    iget v3, p1, Lcom/badlogic/gdx/math/Affine2;->m02:F

    add-float/2addr v0, v3

    .line 396
    iget v3, p1, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v1, v1, v3

    iget v10, p1, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v4, v4, v10

    add-float/2addr v1, v4

    mul-float v5, v5, v3

    mul-float v7, v7, v10

    add-float/2addr v5, v7

    mul-float v3, v3, v8

    mul-float v10, v10, v9

    add-float/2addr v3, v10

    .line 398
    iget p1, p1, Lcom/badlogic/gdx/math/Affine2;->m12:F

    add-float/2addr v3, p1

    .line 400
    iput v2, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 401
    iput v6, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 402
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 403
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 404
    iput v5, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 405
    iput v3, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public preRotate(F)Lcom/badlogic/gdx/math/Affine2;
    .locals 11

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    return-object p0

    .line 531
    :cond_0
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v0

    .line 532
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result p1

    .line 534
    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v2, v0, v1

    iget v3, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v4, p1, v3

    sub-float/2addr v2, v4

    .line 535
    iget v4, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v5, v0, v4

    iget v6, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v7, p1, v6

    sub-float/2addr v5, v7

    .line 536
    iget v7, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    mul-float v8, v0, v7

    iget v9, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    mul-float v10, p1, v9

    sub-float/2addr v8, v10

    mul-float v1, v1, p1

    mul-float v3, v3, v0

    add-float/2addr v1, v3

    mul-float v4, v4, p1

    mul-float v6, v6, v0

    add-float/2addr v4, v6

    mul-float p1, p1, v7

    mul-float v0, v0, v9

    add-float/2addr p1, v0

    .line 541
    iput v2, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 542
    iput v5, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 543
    iput v8, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 544
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 545
    iput v4, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 546
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public preRotateRad(F)Lcom/badlogic/gdx/math/Affine2;
    .locals 11

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    return-object p0

    .line 556
    :cond_0
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v0

    .line 557
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p1

    .line 559
    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v2, v0, v1

    iget v3, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v4, p1, v3

    sub-float/2addr v2, v4

    .line 560
    iget v4, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v5, v0, v4

    iget v6, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v7, p1, v6

    sub-float/2addr v5, v7

    .line 561
    iget v7, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    mul-float v8, v0, v7

    iget v9, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    mul-float v10, p1, v9

    sub-float/2addr v8, v10

    mul-float v1, v1, p1

    mul-float v3, v3, v0

    add-float/2addr v1, v3

    mul-float v4, v4, p1

    mul-float v6, v6, v0

    add-float/2addr v4, v6

    mul-float p1, p1, v7

    mul-float v0, v0, v9

    add-float/2addr p1, v0

    .line 566
    iput v2, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 567
    iput v5, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 568
    iput v8, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 569
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 570
    iput v4, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 571
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public preScale(FF)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 467
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 468
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 469
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 470
    iget p1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float p1, p1, p2

    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 471
    iget p1, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float p1, p1, p2

    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 472
    iget p1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    mul-float p1, p1, p2

    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public preScale(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 480
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/math/Affine2;->preScale(FF)Lcom/badlogic/gdx/math/Affine2;

    move-result-object p1

    return-object p1
.end method

.method public preShear(FF)Lcom/badlogic/gdx/math/Affine2;
    .locals 8

    .line 604
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v2, p1, v1

    add-float/2addr v2, v0

    .line 605
    iget v3, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    iget v4, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v5, p1, v4

    add-float/2addr v5, v3

    .line 606
    iget v6, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    iget v7, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    mul-float p1, p1, v7

    add-float/2addr p1, v6

    mul-float v0, v0, p2

    add-float/2addr v1, v0

    mul-float v3, v3, p2

    add-float/2addr v4, v3

    mul-float p2, p2, v6

    add-float/2addr v7, p2

    .line 611
    iput v2, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 612
    iput v5, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 613
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 614
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 615
    iput v4, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 616
    iput v7, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public preShear(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 624
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/math/Affine2;->preShear(FF)Lcom/badlogic/gdx/math/Affine2;

    move-result-object p1

    return-object p1
.end method

.method public preTranslate(FF)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 431
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 432
    iget p1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    add-float/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public preTranslate(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 440
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/math/Affine2;->preTranslate(FF)Lcom/badlogic/gdx/math/Affine2;

    move-result-object p1

    return-object p1
.end method

.method public rotate(F)Lcom/badlogic/gdx/math/Affine2;
    .locals 7

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    return-object p0

    .line 489
    :cond_0
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v0

    .line 490
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result p1

    .line 492
    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v2, v1, v0

    iget v3, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v4, v3, p1

    add-float/2addr v2, v4

    neg-float v4, p1

    mul-float v1, v1, v4

    mul-float v3, v3, v0

    add-float/2addr v1, v3

    .line 494
    iget v3, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v5, v3, v0

    iget v6, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float p1, p1, v6

    add-float/2addr v5, p1

    mul-float v3, v3, v4

    mul-float v6, v6, v0

    add-float/2addr v3, v6

    .line 497
    iput v2, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 498
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 499
    iput v5, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 500
    iput v3, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    return-object p0
.end method

.method public rotateRad(F)Lcom/badlogic/gdx/math/Affine2;
    .locals 7

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    return-object p0

    .line 510
    :cond_0
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v0

    .line 511
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p1

    .line 513
    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v2, v1, v0

    iget v3, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v4, v3, p1

    add-float/2addr v2, v4

    neg-float v4, p1

    mul-float v1, v1, v4

    mul-float v3, v3, v0

    add-float/2addr v1, v3

    .line 515
    iget v3, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v5, v3, v0

    iget v6, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float p1, p1, v6

    add-float/2addr v5, p1

    mul-float v3, v3, v4

    mul-float v6, v6, v0

    add-float/2addr v3, v6

    .line 518
    iput v2, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 519
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 520
    iput v5, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 521
    iput v3, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    return-object p0
.end method

.method public scale(FF)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 448
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 449
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v0, v0, p2

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 450
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 451
    iget p1, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float p1, p1, p2

    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    return-object p0
.end method

.method public scale(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 459
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/math/Affine2;->scale(FF)Lcom/badlogic/gdx/math/Affine2;

    move-result-object p1

    return-object p1
.end method

.method public set(Lcom/badlogic/gdx/math/Affine2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 64
    iget v0, p1, Lcom/badlogic/gdx/math/Affine2;->m00:F

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 65
    iget v0, p1, Lcom/badlogic/gdx/math/Affine2;->m01:F

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 66
    iget v0, p1, Lcom/badlogic/gdx/math/Affine2;->m02:F

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 67
    iget v0, p1, Lcom/badlogic/gdx/math/Affine2;->m10:F

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 68
    iget v0, p1, Lcom/badlogic/gdx/math/Affine2;->m11:F

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 69
    iget p1, p1, Lcom/badlogic/gdx/math/Affine2;->m12:F

    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 77
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v0, 0x0

    .line 79
    aget v0, p1, v0

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    const/4 v0, 0x3

    .line 80
    aget v0, p1, v0

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    const/4 v0, 0x6

    .line 81
    aget v0, p1, v0

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    const/4 v0, 0x1

    .line 82
    aget v0, p1, v0

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    const/4 v0, 0x4

    .line 83
    aget v0, p1, v0

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    const/4 v0, 0x7

    .line 84
    aget p1, p1, v0

    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 98
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v0, 0x0

    .line 100
    aget v0, p1, v0

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    const/4 v0, 0x4

    .line 101
    aget v0, p1, v0

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    const/16 v0, 0xc

    .line 102
    aget v0, p1, v0

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    const/4 v0, 0x1

    .line 103
    aget v0, p1, v0

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    const/4 v0, 0x5

    .line 104
    aget v0, p1, v0

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    const/16 v0, 0xd

    .line 105
    aget p1, p1, v0

    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public setToProduct(Lcom/badlogic/gdx/math/Affine2;Lcom/badlogic/gdx/math/Affine2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 5

    .line 327
    iget v0, p1, Lcom/badlogic/gdx/math/Affine2;->m00:F

    iget v1, p2, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v0, v0, v1

    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m01:F

    iget v2, p2, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v3, v1, v2

    add-float/2addr v0, v3

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 328
    iget v0, p1, Lcom/badlogic/gdx/math/Affine2;->m00:F

    iget v3, p2, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v3, v3, v0

    iget v4, p2, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v1, v1, v4

    add-float/2addr v3, v1

    iput v3, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 329
    iget v1, p2, Lcom/badlogic/gdx/math/Affine2;->m02:F

    mul-float v0, v0, v1

    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m01:F

    iget v3, p2, Lcom/badlogic/gdx/math/Affine2;->m12:F

    mul-float v1, v1, v3

    add-float/2addr v0, v1

    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m02:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 330
    iget v0, p1, Lcom/badlogic/gdx/math/Affine2;->m10:F

    iget v1, p2, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v0, v0, v1

    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float v2, v2, v1

    add-float/2addr v0, v2

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 331
    iget v0, p1, Lcom/badlogic/gdx/math/Affine2;->m10:F

    iget v2, p2, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v2, v2, v0

    mul-float v1, v1, v4

    add-float/2addr v2, v1

    iput v2, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 332
    iget p2, p2, Lcom/badlogic/gdx/math/Affine2;->m02:F

    mul-float v0, v0, p2

    iget p2, p1, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float p2, p2, v3

    add-float/2addr v0, p2

    iget p1, p1, Lcom/badlogic/gdx/math/Affine2;->m12:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public setToRotation(F)Lcom/badlogic/gdx/math/Affine2;
    .locals 2

    .line 155
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v0

    .line 156
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result p1

    .line 158
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    neg-float v1, p1

    .line 159
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    const/4 v1, 0x0

    .line 160
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 161
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 162
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 163
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public setToRotation(FF)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 188
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    neg-float v0, p2

    .line 189
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    const/4 v0, 0x0

    .line 190
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 191
    iput p2, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 192
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 193
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public setToRotationRad(F)Lcom/badlogic/gdx/math/Affine2;
    .locals 2

    .line 171
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v0

    .line 172
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p1

    .line 174
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    neg-float v1, p1

    .line 175
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    const/4 v1, 0x0

    .line 176
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 177
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 178
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 179
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public setToScaling(FF)Lcom/badlogic/gdx/math/Affine2;
    .locals 0

    .line 135
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    const/4 p1, 0x0

    .line 136
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 137
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 138
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 139
    iput p2, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 140
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public setToScaling(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 148
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/math/Affine2;->setToScaling(FF)Lcom/badlogic/gdx/math/Affine2;

    move-result-object p1

    return-object p1
.end method

.method public setToShearing(FF)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    .line 202
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 203
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    const/4 p1, 0x0

    .line 204
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 205
    iput p2, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 206
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 207
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public setToShearing(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 215
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/math/Affine2;->setToShearing(FF)Lcom/badlogic/gdx/math/Affine2;

    move-result-object p1

    return-object p1
.end method

.method public setToTranslation(FF)Lcom/badlogic/gdx/math/Affine2;
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    .line 114
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    const/4 v1, 0x0

    .line 115
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 116
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 117
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 118
    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 119
    iput p2, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public setToTranslation(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 127
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/math/Affine2;->setToTranslation(FF)Lcom/badlogic/gdx/math/Affine2;

    move-result-object p1

    return-object p1
.end method

.method public setToTrnRotRadScl(FFFFF)Lcom/badlogic/gdx/math/Affine2;
    .locals 0

    .line 266
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 267
    iput p2, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    const/4 p1, 0x0

    cmpl-float p2, p3, p1

    if-nez p2, :cond_0

    .line 270
    iput p4, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 271
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 272
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 273
    iput p5, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    goto :goto_0

    .line 275
    :cond_0
    invoke-static {p3}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p1

    .line 276
    invoke-static {p3}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result p2

    mul-float p3, p2, p4

    .line 278
    iput p3, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    neg-float p3, p1

    mul-float p3, p3, p5

    .line 279
    iput p3, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float p1, p1, p4

    .line 280
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float p2, p2, p5

    .line 281
    iput p2, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    :goto_0
    return-object p0
.end method

.method public setToTrnRotRadScl(Lcom/badlogic/gdx/math/Vector2;FLcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 6

    .line 293
    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v4, p3, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v5, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    move-object v0, p0

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/math/Affine2;->setToTrnRotRadScl(FFFFF)Lcom/badlogic/gdx/math/Affine2;

    move-result-object p1

    return-object p1
.end method

.method public setToTrnRotScl(FFFFF)Lcom/badlogic/gdx/math/Affine2;
    .locals 0

    .line 227
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 228
    iput p2, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    const/4 p1, 0x0

    cmpl-float p2, p3, p1

    if-nez p2, :cond_0

    .line 231
    iput p4, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 232
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 233
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 234
    iput p5, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    goto :goto_0

    .line 236
    :cond_0
    invoke-static {p3}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result p1

    .line 237
    invoke-static {p3}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result p2

    mul-float p3, p2, p4

    .line 239
    iput p3, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    neg-float p3, p1

    mul-float p3, p3, p5

    .line 240
    iput p3, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float p1, p1, p4

    .line 241
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float p2, p2, p5

    .line 242
    iput p2, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    :goto_0
    return-object p0
.end method

.method public setToTrnRotScl(Lcom/badlogic/gdx/math/Vector2;FLcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 6

    .line 254
    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v4, p3, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v5, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    move-object v0, p0

    move v3, p2

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/math/Affine2;->setToTrnRotScl(FFFFF)Lcom/badlogic/gdx/math/Affine2;

    move-result-object p1

    return-object p1
.end method

.method public setToTrnScl(FFFF)Lcom/badlogic/gdx/math/Affine2;
    .locals 0

    .line 304
    iput p3, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    const/4 p3, 0x0

    .line 305
    iput p3, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 306
    iput p1, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 307
    iput p3, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 308
    iput p4, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    .line 309
    iput p2, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public setToTrnScl(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 2

    .line 319
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v1, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p2, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1, v1, p2}, Lcom/badlogic/gdx/math/Affine2;->setToTrnScl(FFFF)Lcom/badlogic/gdx/math/Affine2;

    move-result-object p1

    return-object p1
.end method

.method public shear(FF)Lcom/badlogic/gdx/math/Affine2;
    .locals 3

    .line 580
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v2, p2, v1

    add-float/2addr v2, v0

    mul-float v0, v0, p1

    add-float/2addr v1, v0

    .line 582
    iput v2, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    .line 583
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    .line 585
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float p2, p2, v1

    add-float/2addr p2, v0

    mul-float p1, p1, v0

    add-float/2addr v1, p1

    .line 587
    iput p2, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    .line 588
    iput v1, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    return-object p0
.end method

.method public shear(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 596
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/math/Affine2;->shear(FF)Lcom/badlogic/gdx/math/Affine2;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 664
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "]\n["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, "]\n[0.0|0.0|0.1]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public translate(FF)Lcom/badlogic/gdx/math/Affine2;
    .locals 3

    .line 414
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m00:F

    mul-float v1, v1, p1

    iget v2, p0, Lcom/badlogic/gdx/math/Affine2;->m01:F

    mul-float v2, v2, p2

    add-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m02:F

    .line 415
    iget v0, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    iget v1, p0, Lcom/badlogic/gdx/math/Affine2;->m10:F

    mul-float v1, v1, p1

    iget p1, p0, Lcom/badlogic/gdx/math/Affine2;->m11:F

    mul-float p1, p1, p2

    add-float/2addr v1, p1

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/Affine2;->m12:F

    return-object p0
.end method

.method public translate(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Affine2;
    .locals 1

    .line 423
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/math/Affine2;->translate(FF)Lcom/badlogic/gdx/math/Affine2;

    move-result-object p1

    return-object p1
.end method
