.class public Lcom/badlogic/gdx/math/Vector3;
.super Ljava/lang/Object;
.source "Vector3.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Lcom/badlogic/gdx/math/Vector;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Lcom/badlogic/gdx/math/Vector<",
        "Lcom/badlogic/gdx/math/Vector3;",
        ">;"
    }
.end annotation


# static fields
.field public static final X:Lcom/badlogic/gdx/math/Vector3;

.field public static final Y:Lcom/badlogic/gdx/math/Vector3;

.field public static final Z:Lcom/badlogic/gdx/math/Vector3;

.field public static final Zero:Lcom/badlogic/gdx/math/Vector3;

.field private static final serialVersionUID:J = 0x354a9d4dc2f0cbeaL

.field private static final tmpMat:Lcom/badlogic/gdx/math/Matrix4;


# instance fields
.field public x:F

.field public y:F

.field public z:F


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 36
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    sput-object v0, Lcom/badlogic/gdx/math/Vector3;->X:Lcom/badlogic/gdx/math/Vector3;

    .line 37
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0, v2, v1, v2}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    sput-object v0, Lcom/badlogic/gdx/math/Vector3;->Y:Lcom/badlogic/gdx/math/Vector3;

    .line 38
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0, v2, v2, v1}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    sput-object v0, Lcom/badlogic/gdx/math/Vector3;->Z:Lcom/badlogic/gdx/math/Vector3;

    .line 39
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0, v2, v2, v2}, Lcom/badlogic/gdx/math/Vector3;-><init>(FFF)V

    sput-object v0, Lcom/badlogic/gdx/math/Vector3;->Zero:Lcom/badlogic/gdx/math/Vector3;

    .line 41
    new-instance v0, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Vector3;->tmpMat:Lcom/badlogic/gdx/math/Matrix4;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(FFF)V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Vector2;F)V
    .locals 1

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Vector3;)V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public constructor <init>([F)V
    .locals 3

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 65
    aget v0, p1, v0

    const/4 v1, 0x1

    aget v1, p1, v1

    const/4 v2, 0x2

    aget p1, p1, v2

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public static dot(FFFFFF)F
    .locals 0

    mul-float p0, p0, p3

    mul-float p1, p1, p4

    add-float/2addr p0, p1

    mul-float p2, p2, p5

    add-float/2addr p0, p2

    return p0
.end method

.method public static dst(FFFFFF)F
    .locals 0

    sub-float/2addr p3, p0

    sub-float/2addr p4, p1

    sub-float/2addr p5, p2

    mul-float p3, p3, p3

    mul-float p4, p4, p4

    add-float/2addr p3, p4

    mul-float p5, p5, p5

    add-float/2addr p3, p5

    float-to-double p0, p3

    .line 252
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p0

    double-to-float p0, p0

    return p0
.end method

.method public static dst2(FFFFFF)F
    .locals 0

    sub-float/2addr p3, p0

    sub-float/2addr p4, p1

    sub-float/2addr p5, p2

    mul-float p3, p3, p3

    mul-float p4, p4, p4

    add-float/2addr p3, p4

    mul-float p5, p5, p5

    add-float/2addr p3, p5

    return p3
.end method

.method public static len(FFF)F
    .locals 0

    mul-float p0, p0, p0

    mul-float p1, p1, p1

    add-float/2addr p0, p1

    mul-float p2, p2, p2

    add-float/2addr p0, p2

    float-to-double p0, p0

    .line 223
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p0

    double-to-float p0, p0

    return p0
.end method

.method public static len2(FFF)F
    .locals 0

    mul-float p0, p0, p0

    mul-float p1, p1, p1

    add-float/2addr p0, p1

    mul-float p2, p2, p2

    add-float/2addr p0, p2

    return p0
.end method


# virtual methods
.method public add(F)Lcom/badlogic/gdx/math/Vector3;
    .locals 3

    .line 160
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-float/2addr v0, p1

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr v1, p1

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v2, p1

    invoke-virtual {p0, v0, v1, v2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public add(FFF)Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 152
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-float/2addr v0, p1

    iget p1, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr p1, p2

    iget p2, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr p2, p3

    invoke-virtual {p0, v0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    .line 143
    iget v0, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public clamp(FF)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    .line 645
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Vector3;->len2()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-nez v1, :cond_0

    return-object p0

    :cond_0
    mul-float p2, p2, p2

    cmpl-float v1, v0, p2

    if-lez v1, :cond_1

    div-float/2addr p2, v0

    float-to-double p1, p2

    .line 648
    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p1

    double-to-float p1, p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1

    :cond_1
    mul-float p1, p1, p1

    cmpg-float p2, v0, p1

    if-gez p2, :cond_2

    div-float/2addr p1, v0

    float-to-double p1, p1

    .line 650
    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p1

    double-to-float p1, p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1

    :cond_2
    return-object p0
.end method

.method public bridge synthetic clamp(FF)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->clamp(FF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public cpy()Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 138
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/math/Vector3;-><init>(Lcom/badlogic/gdx/math/Vector3;)V

    return-object v0
.end method

.method public bridge synthetic cpy()Lcom/badlogic/gdx/math/Vector;
    .locals 1

    .line 26
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Vector3;->cpy()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    return-object v0
.end method

.method public crs(FFF)Lcom/badlogic/gdx/math/Vector3;
    .locals 4

    .line 338
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v1, v0, p3

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v3, v2, p2

    sub-float/2addr v1, v3

    mul-float v2, v2, p1

    iget v3, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float p3, p3, v3

    sub-float/2addr v2, p3

    mul-float v3, v3, p2

    mul-float v0, v0, p1

    sub-float/2addr v3, v0

    invoke-virtual {p0, v1, v2, v3}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 6

    .line 329
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v2, v0, v1

    iget v3, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v5, v3, v4

    sub-float/2addr v2, v5

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v3, v3, p1

    iget v5, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v1, v1, v5

    sub-float/2addr v3, v1

    mul-float v5, v5, v4

    mul-float v0, v0, p1

    sub-float/2addr v5, v0

    invoke-virtual {p0, v2, v3, v5}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public dot(FFF)F
    .locals 1

    .line 322
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v0, v0, p1

    iget p1, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float p1, p1, p2

    add-float/2addr v0, p1

    iget p1, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float p1, p1, p3

    add-float/2addr v0, p1

    return v0
.end method

.method public dot(Lcom/badlogic/gdx/math/Vector3;)F
    .locals 3

    .line 313
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v0, v0, v1

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v1, v1, p1

    add-float/2addr v0, v1

    return v0
.end method

.method public bridge synthetic dot(Lcom/badlogic/gdx/math/Vector;)F
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->dot(Lcom/badlogic/gdx/math/Vector3;)F

    move-result p1

    return p1
.end method

.method public dst(FFF)F
    .locals 1

    .line 265
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr p1, v0

    .line 266
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr p2, v0

    .line 267
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr p3, v0

    mul-float p1, p1, p1

    mul-float p2, p2, p2

    add-float/2addr p1, p2

    mul-float p3, p3, p3

    add-float/2addr p1, p3

    float-to-double p1, p1

    .line 268
    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p1

    double-to-float p1, p1

    return p1
.end method

.method public dst(Lcom/badlogic/gdx/math/Vector3;)F
    .locals 3

    .line 257
    iget v0, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v0, v1

    .line 258
    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v1, v2

    .line 259
    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr p1, v2

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    mul-float p1, p1, p1

    add-float/2addr v0, p1

    float-to-double v0, v0

    .line 260
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p1, v0

    return p1
.end method

.method public bridge synthetic dst(Lcom/badlogic/gdx/math/Vector;)F
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->dst(Lcom/badlogic/gdx/math/Vector3;)F

    move-result p1

    return p1
.end method

.method public dst2(FFF)F
    .locals 1

    .line 293
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr p1, v0

    .line 294
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr p2, v0

    .line 295
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr p3, v0

    mul-float p1, p1, p1

    mul-float p2, p2, p2

    add-float/2addr p1, p2

    mul-float p3, p3, p3

    add-float/2addr p1, p3

    return p1
.end method

.method public dst2(Lcom/badlogic/gdx/math/Vector3;)F
    .locals 3

    .line 281
    iget v0, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v0, v1

    .line 282
    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v1, v2

    .line 283
    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr p1, v2

    mul-float v0, v0, v0

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    mul-float p1, p1, p1

    add-float/2addr v0, p1

    return v0
.end method

.method public bridge synthetic dst2(Lcom/badlogic/gdx/math/Vector;)F
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->dst2(Lcom/badlogic/gdx/math/Vector3;)F

    move-result p1

    return p1
.end method

.method public epsilonEquals(FFF)Z
    .locals 1

    const v0, 0x358637bd    # 1.0E-6f

    .line 713
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/badlogic/gdx/math/Vector3;->epsilonEquals(FFFF)Z

    move-result p1

    return p1
.end method

.method public epsilonEquals(FFFF)Z
    .locals 1

    .line 688
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/4 v0, 0x0

    cmpl-float p1, p1, p4

    if-lez p1, :cond_0

    return v0

    .line 689
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr p2, p1

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpl-float p1, p1, p4

    if-lez p1, :cond_1

    return v0

    .line 690
    :cond_1
    iget p1, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr p3, p1

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpl-float p1, p1, p4

    if-lez p1, :cond_2

    return v0

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method public epsilonEquals(Lcom/badlogic/gdx/math/Vector3;)Z
    .locals 1

    const v0, 0x358637bd    # 1.0E-6f

    .line 701
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/math/Vector3;->epsilonEquals(Lcom/badlogic/gdx/math/Vector3;F)Z

    move-result p1

    return p1
.end method

.method public epsilonEquals(Lcom/badlogic/gdx/math/Vector3;F)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 679
    :cond_0
    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpl-float v1, v1, p2

    if-lez v1, :cond_1

    return v0

    .line 680
    :cond_1
    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpl-float v1, v1, p2

    if-lez v1, :cond_2

    return v0

    .line 681
    :cond_2
    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    cmpl-float p1, p1, p2

    if-lez p1, :cond_3

    return v0

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method public bridge synthetic epsilonEquals(Lcom/badlogic/gdx/math/Vector;F)Z
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->epsilonEquals(Lcom/badlogic/gdx/math/Vector3;F)Z

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 668
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    return v1

    .line 669
    :cond_2
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    .line 670
    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    invoke-static {v2}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntBits(F)I

    move-result v2

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    invoke-static {v3}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntBits(F)I

    move-result v3

    if-eq v2, v3, :cond_3

    return v1

    .line 671
    :cond_3
    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    invoke-static {v2}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntBits(F)I

    move-result v2

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    invoke-static {v3}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntBits(F)I

    move-result v3

    if-eq v2, v3, :cond_4

    return v1

    .line 672
    :cond_4
    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    invoke-static {v2}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntBits(F)I

    move-result v2

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    invoke-static {p1}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntBits(F)I

    move-result p1

    if-eq v2, p1, :cond_5

    return v1

    :cond_5
    return v0
.end method

.method public fromString(Ljava/lang/String;)Lcom/badlogic/gdx/math/Vector3;
    .locals 6

    const/16 v0, 0x2c

    const/4 v1, 0x1

    .line 603
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    add-int/lit8 v3, v2, 0x1

    .line 604
    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    const/4 v4, -0x1

    if-eq v2, v4, :cond_0

    if-eq v0, v4, :cond_0

    const/4 v4, 0x0

    .line 605
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x28

    if-ne v4, v5, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x29

    if-ne v4, v5, :cond_0

    .line 607
    :try_start_0
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    .line 608
    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    add-int/2addr v0, v1

    .line 609
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v1

    invoke-virtual {p1, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    .line 610
    invoke-virtual {p0, v2, v3, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 615
    :catch_0
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Malformed Vector3: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hasOppositeDirection(Lcom/badlogic/gdx/math/Vector3;)Z
    .locals 1

    .line 550
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->dot(Lcom/badlogic/gdx/math/Vector3;)F

    move-result p1

    const/4 v0, 0x0

    cmpg-float p1, p1, v0

    if-gez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public bridge synthetic hasOppositeDirection(Lcom/badlogic/gdx/math/Vector;)Z
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->hasOppositeDirection(Lcom/badlogic/gdx/math/Vector3;)Z

    move-result p1

    return p1
.end method

.method public hasSameDirection(Lcom/badlogic/gdx/math/Vector3;)Z
    .locals 1

    .line 545
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->dot(Lcom/badlogic/gdx/math/Vector3;)F

    move-result p1

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public bridge synthetic hasSameDirection(Lcom/badlogic/gdx/math/Vector;)Z
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->hasSameDirection(Lcom/badlogic/gdx/math/Vector3;)Z

    move-result p1

    return p1
.end method

.method public hashCode()I
    .locals 3

    .line 658
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    invoke-static {v0}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntBits(F)I

    move-result v0

    const/16 v1, 0x1f

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 659
    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    invoke-static {v2}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntBits(F)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 660
    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    invoke-static {v1}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public idt(Lcom/badlogic/gdx/math/Vector3;)Z
    .locals 2

    .line 244
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    cmpl-float p1, v0, p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public interpolate(Lcom/badlogic/gdx/math/Vector3;FLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 563
    invoke-virtual {p3, v0, v1, p2}, Lcom/badlogic/gdx/math/Interpolation;->apply(FFF)F

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->lerp(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic interpolate(Lcom/badlogic/gdx/math/Vector;FLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/math/Vector3;->interpolate(Lcom/badlogic/gdx/math/Vector3;FLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public isCollinear(Lcom/badlogic/gdx/math/Vector3;)Z
    .locals 1

    .line 520
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->isOnLine(Lcom/badlogic/gdx/math/Vector3;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->hasSameDirection(Lcom/badlogic/gdx/math/Vector3;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isCollinear(Lcom/badlogic/gdx/math/Vector3;F)Z
    .locals 0

    .line 515
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->isOnLine(Lcom/badlogic/gdx/math/Vector3;F)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->hasSameDirection(Lcom/badlogic/gdx/math/Vector3;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public bridge synthetic isCollinear(Lcom/badlogic/gdx/math/Vector;)Z
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->isCollinear(Lcom/badlogic/gdx/math/Vector3;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic isCollinear(Lcom/badlogic/gdx/math/Vector;F)Z
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->isCollinear(Lcom/badlogic/gdx/math/Vector3;F)Z

    move-result p1

    return p1
.end method

.method public isCollinearOpposite(Lcom/badlogic/gdx/math/Vector3;)Z
    .locals 1

    .line 530
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->isOnLine(Lcom/badlogic/gdx/math/Vector3;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->hasOppositeDirection(Lcom/badlogic/gdx/math/Vector3;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isCollinearOpposite(Lcom/badlogic/gdx/math/Vector3;F)Z
    .locals 0

    .line 525
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->isOnLine(Lcom/badlogic/gdx/math/Vector3;F)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->hasOppositeDirection(Lcom/badlogic/gdx/math/Vector3;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public bridge synthetic isCollinearOpposite(Lcom/badlogic/gdx/math/Vector;)Z
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->isCollinearOpposite(Lcom/badlogic/gdx/math/Vector3;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic isCollinearOpposite(Lcom/badlogic/gdx/math/Vector;F)Z
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->isCollinearOpposite(Lcom/badlogic/gdx/math/Vector3;F)Z

    move-result p1

    return p1
.end method

.method public isOnLine(Lcom/badlogic/gdx/math/Vector3;)Z
    .locals 6

    .line 510
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v2, v0, v1

    iget v3, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v5, v3, v4

    sub-float/2addr v2, v5

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v3, v3, p1

    iget v5, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v1, v1, v5

    sub-float/2addr v3, v1

    mul-float v5, v5, v4

    mul-float v0, v0, p1

    sub-float/2addr v5, v0

    invoke-static {v2, v3, v5}, Lcom/badlogic/gdx/math/Vector3;->len2(FFF)F

    move-result p1

    const v0, 0x358637bd    # 1.0E-6f

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isOnLine(Lcom/badlogic/gdx/math/Vector3;F)Z
    .locals 6

    .line 505
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v2, v0, v1

    iget v3, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v4, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v5, v3, v4

    sub-float/2addr v2, v5

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v3, v3, p1

    iget v5, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v1, v1, v5

    sub-float/2addr v3, v1

    mul-float v5, v5, v4

    mul-float v0, v0, p1

    sub-float/2addr v5, v0

    invoke-static {v2, v3, v5}, Lcom/badlogic/gdx/math/Vector3;->len2(FFF)F

    move-result p1

    cmpg-float p1, p1, p2

    if-gtz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public bridge synthetic isOnLine(Lcom/badlogic/gdx/math/Vector;)Z
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->isOnLine(Lcom/badlogic/gdx/math/Vector3;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic isOnLine(Lcom/badlogic/gdx/math/Vector;F)Z
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->isOnLine(Lcom/badlogic/gdx/math/Vector3;F)Z

    move-result p1

    return p1
.end method

.method public isPerpendicular(Lcom/badlogic/gdx/math/Vector3;)Z
    .locals 0

    .line 535
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->dot(Lcom/badlogic/gdx/math/Vector3;)F

    move-result p1

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result p1

    return p1
.end method

.method public isPerpendicular(Lcom/badlogic/gdx/math/Vector3;F)Z
    .locals 0

    .line 540
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->dot(Lcom/badlogic/gdx/math/Vector3;)F

    move-result p1

    invoke-static {p1, p2}, Lcom/badlogic/gdx/math/MathUtils;->isZero(FF)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic isPerpendicular(Lcom/badlogic/gdx/math/Vector;)Z
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->isPerpendicular(Lcom/badlogic/gdx/math/Vector3;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic isPerpendicular(Lcom/badlogic/gdx/math/Vector;F)Z
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->isPerpendicular(Lcom/badlogic/gdx/math/Vector3;F)Z

    move-result p1

    return p1
.end method

.method public isUnit()Z
    .locals 1

    const v0, 0x3089705f    # 1.0E-9f

    .line 485
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/math/Vector3;->isUnit(F)Z

    move-result v0

    return v0
.end method

.method public isUnit(F)Z
    .locals 2

    .line 490
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Vector3;->len2()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float p1, v0, p1

    if-gez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isZero()Z
    .locals 2

    .line 495
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isZero(F)Z
    .locals 1

    .line 500
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Vector3;->len2()F

    move-result v0

    cmpg-float p1, v0, p1

    if-gez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public len()F
    .locals 2

    .line 228
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v0, v0, v0

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public len2()F
    .locals 2

    .line 238
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v0, v0, v0

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    return v0
.end method

.method public lerp(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    .line 555
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v1, v0

    mul-float v1, v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    .line 556
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v1, v0

    mul-float v1, v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 557
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr p1, v0

    mul-float p2, p2, p1

    add-float/2addr v0, p2

    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    return-object p0
.end method

.method public bridge synthetic lerp(Lcom/badlogic/gdx/math/Vector;F)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->lerp(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public limit(F)Lcom/badlogic/gdx/math/Vector3;
    .locals 0

    mul-float p1, p1, p1

    .line 620
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->limit2(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic limit(F)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->limit(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public limit2(F)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    .line 625
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Vector3;->len2()F

    move-result v0

    cmpl-float v1, v0, p1

    if-lez v1, :cond_0

    div-float/2addr p1, v0

    float-to-double v0, p1

    .line 627
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p1, v0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    :cond_0
    return-object p0
.end method

.method public bridge synthetic limit2(F)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->limit2(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public mul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 6

    .line 374
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    .line 375
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v1, 0x0

    aget v1, p1, v1

    mul-float v1, v1, v0

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v3, 0x3

    aget v3, p1, v3

    mul-float v3, v3, v2

    add-float/2addr v1, v3

    iget v3, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/4 v4, 0x6

    aget v4, p1, v4

    mul-float v4, v4, v3

    add-float/2addr v1, v4

    const/4 v4, 0x1

    aget v4, p1, v4

    mul-float v4, v4, v0

    const/4 v5, 0x4

    aget v5, p1, v5

    mul-float v5, v5, v2

    add-float/2addr v4, v5

    const/4 v5, 0x7

    aget v5, p1, v5

    mul-float v5, v5, v3

    add-float/2addr v4, v5

    const/4 v5, 0x2

    aget v5, p1, v5

    mul-float v0, v0, v5

    const/4 v5, 0x5

    aget v5, p1, v5

    mul-float v2, v2, v5

    add-float/2addr v0, v2

    const/16 v2, 0x8

    aget p1, p1, v2

    mul-float v3, v3, p1

    add-float/2addr v0, v3

    invoke-virtual {p0, v1, v4, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;
    .locals 6

    .line 354
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    .line 355
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v1, 0x0

    aget v1, p1, v1

    mul-float v1, v1, v0

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v3, 0x4

    aget v3, p1, v3

    mul-float v3, v3, v2

    add-float/2addr v1, v3

    iget v3, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 v4, 0x8

    aget v4, p1, v4

    mul-float v4, v4, v3

    add-float/2addr v1, v4

    const/16 v4, 0xc

    aget v4, p1, v4

    add-float/2addr v1, v4

    const/4 v4, 0x1

    aget v4, p1, v4

    mul-float v4, v4, v0

    const/4 v5, 0x5

    aget v5, p1, v5

    mul-float v5, v5, v2

    add-float/2addr v4, v5

    const/16 v5, 0x9

    aget v5, p1, v5

    mul-float v5, v5, v3

    add-float/2addr v4, v5

    const/16 v5, 0xd

    aget v5, p1, v5

    add-float/2addr v4, v5

    const/4 v5, 0x2

    aget v5, p1, v5

    mul-float v0, v0, v5

    const/4 v5, 0x6

    aget v5, p1, v5

    mul-float v2, v2, v5

    add-float/2addr v0, v2

    const/16 v2, 0xa

    aget v2, p1, v2

    mul-float v3, v3, v2

    add-float/2addr v0, v3

    const/16 v2, 0xe

    aget p1, p1, v2

    add-float/2addr v0, p1

    invoke-virtual {p0, v1, v4, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public mul(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Vector3;
    .locals 0

    .line 391
    invoke-virtual {p1, p0}, Lcom/badlogic/gdx/math/Quaternion;->transform(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public mul4x3([F)Lcom/badlogic/gdx/math/Vector3;
    .locals 6

    .line 346
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v1, 0x0

    aget v1, p1, v1

    mul-float v1, v1, v0

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v3, 0x3

    aget v3, p1, v3

    mul-float v3, v3, v2

    add-float/2addr v1, v3

    iget v3, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/4 v4, 0x6

    aget v4, p1, v4

    mul-float v4, v4, v3

    add-float/2addr v1, v4

    const/16 v4, 0x9

    aget v4, p1, v4

    add-float/2addr v1, v4

    const/4 v4, 0x1

    aget v4, p1, v4

    mul-float v4, v4, v0

    const/4 v5, 0x4

    aget v5, p1, v5

    mul-float v5, v5, v2

    add-float/2addr v4, v5

    const/4 v5, 0x7

    aget v5, p1, v5

    mul-float v5, v5, v3

    add-float/2addr v4, v5

    const/16 v5, 0xa

    aget v5, p1, v5

    add-float/2addr v4, v5

    const/4 v5, 0x2

    aget v5, p1, v5

    mul-float v0, v0, v5

    const/4 v5, 0x5

    aget v5, p1, v5

    mul-float v2, v2, v5

    add-float/2addr v0, v2

    const/16 v2, 0x8

    aget v2, p1, v2

    mul-float v3, v3, v2

    add-float/2addr v0, v3

    const/16 v2, 0xb

    aget p1, p1, v2

    add-float/2addr v0, p1

    invoke-virtual {p0, v1, v4, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public mulAdd(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    .line 207
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v1, v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    .line 208
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v1, v1, p2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 209
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float p1, p1, p2

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    return-object p0
.end method

.method public mulAdd(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 3

    .line 215
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v2, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    .line 216
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v2, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 217
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float p1, p1, p2

    add-float/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    return-object p0
.end method

.method public bridge synthetic mulAdd(Lcom/badlogic/gdx/math/Vector;F)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->mulAdd(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic mulAdd(Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    check-cast p2, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->mulAdd(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public nor()Lcom/badlogic/gdx/math/Vector3;
    .locals 4

    .line 301
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Vector3;->len2()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_1

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v2, v0, v1

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    float-to-double v2, v0

    .line 303
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v0, v2

    div-float/2addr v1, v0

    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    return-object v0

    :cond_1
    :goto_0
    return-object p0
.end method

.method public bridge synthetic nor()Lcom/badlogic/gdx/math/Vector;
    .locals 1

    .line 26
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    return-object v0
.end method

.method public prj(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;
    .locals 7

    .line 400
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    .line 401
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v1, 0x3

    aget v1, p1, v1

    mul-float v1, v1, v0

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v3, 0x7

    aget v3, p1, v3

    mul-float v3, v3, v2

    add-float/2addr v1, v3

    iget v3, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 v4, 0xb

    aget v4, p1, v4

    mul-float v4, v4, v3

    add-float/2addr v1, v4

    const/16 v4, 0xf

    aget v4, p1, v4

    add-float/2addr v1, v4

    const/high16 v4, 0x3f800000    # 1.0f

    div-float/2addr v4, v1

    const/4 v1, 0x0

    .line 402
    aget v1, p1, v1

    mul-float v1, v1, v0

    const/4 v5, 0x4

    aget v5, p1, v5

    mul-float v5, v5, v2

    add-float/2addr v1, v5

    const/16 v5, 0x8

    aget v5, p1, v5

    mul-float v5, v5, v3

    add-float/2addr v1, v5

    const/16 v5, 0xc

    aget v5, p1, v5

    add-float/2addr v1, v5

    mul-float v1, v1, v4

    const/4 v5, 0x1

    aget v5, p1, v5

    mul-float v5, v5, v0

    const/4 v6, 0x5

    aget v6, p1, v6

    mul-float v6, v6, v2

    add-float/2addr v5, v6

    const/16 v6, 0x9

    aget v6, p1, v6

    mul-float v6, v6, v3

    add-float/2addr v5, v6

    const/16 v6, 0xd

    aget v6, p1, v6

    add-float/2addr v5, v6

    mul-float v5, v5, v4

    const/4 v6, 0x2

    aget v6, p1, v6

    mul-float v0, v0, v6

    const/4 v6, 0x6

    aget v6, p1, v6

    mul-float v2, v2, v6

    add-float/2addr v0, v2

    const/16 v2, 0xa

    aget v2, p1, v2

    mul-float v3, v3, v2

    add-float/2addr v0, v3

    const/16 v2, 0xe

    aget p1, p1, v2

    add-float/2addr v0, p1

    mul-float v0, v0, v4

    invoke-virtual {p0, v1, v5, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public rot(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;
    .locals 6

    .line 412
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    .line 413
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v1, 0x0

    aget v1, p1, v1

    mul-float v1, v1, v0

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v3, 0x4

    aget v3, p1, v3

    mul-float v3, v3, v2

    add-float/2addr v1, v3

    iget v3, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 v4, 0x8

    aget v4, p1, v4

    mul-float v4, v4, v3

    add-float/2addr v1, v4

    const/4 v4, 0x1

    aget v4, p1, v4

    mul-float v4, v4, v0

    const/4 v5, 0x5

    aget v5, p1, v5

    mul-float v5, v5, v2

    add-float/2addr v4, v5

    const/16 v5, 0x9

    aget v5, p1, v5

    mul-float v5, v5, v3

    add-float/2addr v4, v5

    const/4 v5, 0x2

    aget v5, p1, v5

    mul-float v0, v0, v5

    const/4 v5, 0x6

    aget v5, p1, v5

    mul-float v2, v2, v5

    add-float/2addr v0, v2

    const/16 v2, 0xa

    aget p1, p1, v2

    mul-float v3, v3, p1

    add-float/2addr v0, v3

    invoke-virtual {p0, v1, v4, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public rotate(FFFF)Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 449
    sget-object v0, Lcom/badlogic/gdx/math/Vector3;->tmpMat:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p2, p3, p4, p1}, Lcom/badlogic/gdx/math/Matrix4;->setToRotation(FFFF)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public rotate(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 469
    sget-object v0, Lcom/badlogic/gdx/math/Vector3;->tmpMat:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/math/Matrix4;->setToRotation(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Matrix4;

    .line 470
    sget-object p1, Lcom/badlogic/gdx/math/Vector3;->tmpMat:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public rotateRad(FFFF)Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 460
    sget-object v0, Lcom/badlogic/gdx/math/Vector3;->tmpMat:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p2, p3, p4, p1}, Lcom/badlogic/gdx/math/Matrix4;->setToRotationRad(FFFF)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public rotateRad(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 479
    sget-object v0, Lcom/badlogic/gdx/math/Vector3;->tmpMat:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/math/Matrix4;->setToRotationRad(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Matrix4;

    .line 480
    sget-object p1, Lcom/badlogic/gdx/math/Vector3;->tmpMat:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public scl(F)Lcom/badlogic/gdx/math/Vector3;
    .locals 3

    .line 188
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v0, v0, p1

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v1, v1, p1

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v2, v2, p1

    invoke-virtual {p0, v0, v1, v2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public scl(FFF)Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 202
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v0, v0, p1

    iget p1, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float p1, p1, p2

    iget p2, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float p2, p2, p3

    invoke-virtual {p0, v0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public scl(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 3

    .line 193
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v0, v0, v1

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v1, v1, v2

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v2, v2, p1

    invoke-virtual {p0, v0, v1, v2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic scl(F)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic scl(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->scl(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public set(FFF)Lcom/badlogic/gdx/math/Vector3;
    .locals 0

    .line 83
    iput p1, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    .line 84
    iput p2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 85
    iput p3, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/math/Vector2;F)Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 108
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    .line 91
    iget v0, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public set([F)Lcom/badlogic/gdx/math/Vector3;
    .locals 3

    const/4 v0, 0x0

    .line 99
    aget v0, p1, v0

    const/4 v1, 0x1

    aget v1, p1, v1

    const/4 v2, 0x2

    aget p1, p1, v2

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public setFromSpherical(FF)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    .line 116
    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v0

    .line 117
    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p2

    .line 119
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v1

    .line 120
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p1

    mul-float v1, v1, p2

    mul-float p1, p1, p2

    .line 122
    invoke-virtual {p0, v1, p1, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public setLength(F)Lcom/badlogic/gdx/math/Vector3;
    .locals 0

    mul-float p1, p1, p1

    .line 634
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->setLength2(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic setLength(F)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->setLength(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public setLength2(F)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    .line 639
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Vector3;->len2()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_1

    cmpl-float v1, v0, p1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    div-float/2addr p1, v0

    float-to-double v0, p1

    .line 640
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p1, v0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    goto :goto_1

    :cond_1
    :goto_0
    move-object p1, p0

    :goto_1
    return-object p1
.end method

.method public bridge synthetic setLength2(F)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->setLength2(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public setToRandomDirection()Lcom/badlogic/gdx/math/Vector3;
    .locals 3

    .line 127
    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result v0

    .line 128
    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result v1

    const v2, 0x40c90fdb

    mul-float v0, v0, v2

    const/high16 v2, 0x40000000    # 2.0f

    mul-float v1, v1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v1, v2

    float-to-double v1, v1

    .line 131
    invoke-static {v1, v2}, Ljava/lang/Math;->acos(D)D

    move-result-wide v1

    double-to-float v1, v1

    .line 133
    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/math/Vector3;->setFromSpherical(FF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setToRandomDirection()Lcom/badlogic/gdx/math/Vector;
    .locals 1

    .line 26
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Vector3;->setToRandomDirection()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    return-object v0
.end method

.method public setZero()Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    const/4 v0, 0x0

    .line 718
    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    .line 719
    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 720
    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    return-object p0
.end method

.method public bridge synthetic setZero()Lcom/badlogic/gdx/math/Vector;
    .locals 1

    .line 26
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Vector3;->setZero()Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    return-object v0
.end method

.method public slerp(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;
    .locals 9

    .line 573
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->dot(Lcom/badlogic/gdx/math/Vector3;)F

    move-result v0

    float-to-double v1, v0

    const-wide v3, 0x3feffbe76c8b4396L    # 0.9995

    cmpl-double v5, v1, v3

    if-gtz v5, :cond_2

    const-wide v3, -0x401004189374bc6aL    # -0.9995

    cmpg-double v5, v1, v3

    if-gez v5, :cond_0

    goto :goto_1

    .line 578
    :cond_0
    invoke-static {v1, v2}, Ljava/lang/Math;->acos(D)D

    move-result-wide v1

    double-to-float v1, v1

    mul-float v1, v1, p2

    float-to-double v1, v1

    .line 582
    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float p2, v3

    .line 583
    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v4, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v4, v4, v0

    sub-float/2addr v3, v4

    .line 584
    iget v4, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v5, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v5, v5, v0

    sub-float/2addr v4, v5

    .line 585
    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v5, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v5, v5, v0

    sub-float/2addr p1, v5

    mul-float v0, v3, v3

    mul-float v5, v4, v4

    add-float/2addr v0, v5

    mul-float v5, p1, p1

    add-float/2addr v0, v5

    const v5, 0x38d1b717    # 1.0E-4f

    const/high16 v6, 0x3f800000    # 1.0f

    cmpg-float v5, v0, v5

    if-gez v5, :cond_1

    goto :goto_0

    :cond_1
    float-to-double v7, v0

    .line 587
    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    double-to-float v0, v7

    div-float/2addr v6, v0

    :goto_0
    mul-float p2, p2, v6

    .line 589
    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    double-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    mul-float v3, v3, p2

    mul-float v4, v4, p2

    mul-float p1, p1, p2

    invoke-virtual {v0, v3, v4, p1}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1

    .line 575
    :cond_2
    :goto_1
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->lerp(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public sub(F)Lcom/badlogic/gdx/math/Vector3;
    .locals 3

    .line 183
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v0, p1

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v1, p1

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr v2, p1

    invoke-virtual {p0, v0, v1, v2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public sub(FFF)Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 175
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v0, p1

    iget p1, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr p1, p2

    iget p2, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    sub-float/2addr p2, p3

    invoke-virtual {p0, v0, p1, p2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public sub(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    .line 165
    iget v0, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/math/Vector3;->sub(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic sub(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 0

    .line 26
    check-cast p1, Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Vector3;->sub(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 596
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public traMul(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 6

    .line 383
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    .line 384
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v1, 0x0

    aget v1, p1, v1

    mul-float v1, v1, v0

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v3, 0x1

    aget v3, p1, v3

    mul-float v3, v3, v2

    add-float/2addr v1, v3

    iget v3, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/4 v4, 0x2

    aget v4, p1, v4

    mul-float v4, v4, v3

    add-float/2addr v1, v4

    const/4 v4, 0x3

    aget v4, p1, v4

    mul-float v4, v4, v0

    const/4 v5, 0x4

    aget v5, p1, v5

    mul-float v5, v5, v2

    add-float/2addr v4, v5

    const/4 v5, 0x5

    aget v5, p1, v5

    mul-float v5, v5, v3

    add-float/2addr v4, v5

    const/4 v5, 0x6

    aget v5, p1, v5

    mul-float v0, v0, v5

    const/4 v5, 0x7

    aget v5, p1, v5

    mul-float v2, v2, v5

    add-float/2addr v0, v2

    const/16 v2, 0x8

    aget p1, p1, v2

    mul-float v3, v3, p1

    add-float/2addr v0, v3

    invoke-virtual {p0, v1, v4, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public traMul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;
    .locals 6

    .line 364
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    .line 365
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v1, 0x0

    aget v1, p1, v1

    mul-float v1, v1, v0

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v3, 0x1

    aget v3, p1, v3

    mul-float v3, v3, v2

    add-float/2addr v1, v3

    iget v3, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/4 v4, 0x2

    aget v4, p1, v4

    mul-float v4, v4, v3

    add-float/2addr v1, v4

    const/4 v4, 0x3

    aget v4, p1, v4

    add-float/2addr v1, v4

    const/4 v4, 0x4

    aget v4, p1, v4

    mul-float v4, v4, v0

    const/4 v5, 0x5

    aget v5, p1, v5

    mul-float v5, v5, v2

    add-float/2addr v4, v5

    const/4 v5, 0x6

    aget v5, p1, v5

    mul-float v5, v5, v3

    add-float/2addr v4, v5

    const/4 v5, 0x7

    aget v5, p1, v5

    add-float/2addr v4, v5

    const/16 v5, 0x8

    aget v5, p1, v5

    mul-float v0, v0, v5

    const/16 v5, 0x9

    aget v5, p1, v5

    mul-float v2, v2, v5

    add-float/2addr v0, v2

    const/16 v2, 0xa

    aget v2, p1, v2

    mul-float v3, v3, v2

    add-float/2addr v0, v3

    const/16 v2, 0xb

    aget p1, p1, v2

    add-float/2addr v0, p1

    invoke-virtual {p0, v1, v4, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public unrotate(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;
    .locals 6

    .line 422
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    .line 423
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v1, 0x0

    aget v1, p1, v1

    mul-float v1, v1, v0

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v3, 0x1

    aget v3, p1, v3

    mul-float v3, v3, v2

    add-float/2addr v1, v3

    iget v3, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/4 v4, 0x2

    aget v4, p1, v4

    mul-float v4, v4, v3

    add-float/2addr v1, v4

    const/4 v4, 0x4

    aget v4, p1, v4

    mul-float v4, v4, v0

    const/4 v5, 0x5

    aget v5, p1, v5

    mul-float v5, v5, v2

    add-float/2addr v4, v5

    const/4 v5, 0x6

    aget v5, p1, v5

    mul-float v5, v5, v3

    add-float/2addr v4, v5

    const/16 v5, 0x8

    aget v5, p1, v5

    mul-float v0, v0, v5

    const/16 v5, 0x9

    aget v5, p1, v5

    mul-float v2, v2, v5

    add-float/2addr v0, v2

    const/16 v2, 0xa

    aget p1, p1, v2

    mul-float v3, v3, p1

    add-float/2addr v0, v3

    invoke-virtual {p0, v1, v4, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public untransform(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;
    .locals 6

    .line 433
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    .line 434
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/16 v1, 0xc

    aget v2, p1, v1

    sub-float/2addr v0, v2

    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    .line 435
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    aget v2, p1, v1

    sub-float/2addr v0, v2

    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 436
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    aget v1, p1, v1

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    .line 437
    iget v0, p0, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v1, 0x0

    aget v1, p1, v1

    mul-float v1, v1, v0

    iget v2, p0, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v3, 0x1

    aget v3, p1, v3

    mul-float v3, v3, v2

    add-float/2addr v1, v3

    iget v3, p0, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/4 v4, 0x2

    aget v4, p1, v4

    mul-float v4, v4, v3

    add-float/2addr v1, v4

    const/4 v4, 0x4

    aget v4, p1, v4

    mul-float v4, v4, v0

    const/4 v5, 0x5

    aget v5, p1, v5

    mul-float v5, v5, v2

    add-float/2addr v4, v5

    const/4 v5, 0x6

    aget v5, p1, v5

    mul-float v5, v5, v3

    add-float/2addr v4, v5

    const/16 v5, 0x8

    aget v5, p1, v5

    mul-float v0, v0, v5

    const/16 v5, 0x9

    aget v5, p1, v5

    mul-float v2, v2, v5

    add-float/2addr v0, v2

    const/16 v2, 0xa

    aget p1, p1, v2

    mul-float v3, v3, p1

    add-float/2addr v0, v3

    invoke-virtual {p0, v1, v4, v0}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method
