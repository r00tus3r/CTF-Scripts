.class public Lcom/badlogic/gdx/math/BSpline;
.super Ljava/lang/Object;
.source "BSpline.java"

# interfaces
.implements Lcom/badlogic/gdx/math/Path;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/badlogic/gdx/math/Vector<",
        "TT;>;>",
        "Ljava/lang/Object;",
        "Lcom/badlogic/gdx/math/Path<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final d6:F = 0.16666667f


# instance fields
.field public continuous:Z

.field public controlPoints:[Lcom/badlogic/gdx/math/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field public degree:I

.field public knots:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation
.end field

.field public spanCount:I

.field private tmp:Lcom/badlogic/gdx/math/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private tmp2:Lcom/badlogic/gdx/math/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private tmp3:Lcom/badlogic/gdx/math/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>([Lcom/badlogic/gdx/math/Vector;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;IZ)V"
        }
    .end annotation

    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 182
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/math/BSpline;->set([Lcom/badlogic/gdx/math/Vector;IZ)Lcom/badlogic/gdx/math/BSpline;

    return-void
.end method

.method public static calculate(Lcom/badlogic/gdx/math/Vector;F[Lcom/badlogic/gdx/math/Vector;IZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;F[TT;IZTT;)TT;"
        }
    .end annotation

    if-eqz p4, :cond_0

    .line 109
    array-length v0, p2

    goto :goto_0

    :cond_0
    array-length v0, p2

    sub-int/2addr v0, p3

    :goto_0
    int-to-float v1, v0

    mul-float v1, v1, p1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v2

    if-ltz p1, :cond_1

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_1
    float-to-int v0, v1

    :goto_1
    move v3, v0

    int-to-float p1, v3

    sub-float v4, v1, p1

    move-object v2, p0

    move-object v5, p2

    move v6, p3

    move v7, p4

    move-object v8, p5

    .line 113
    invoke-static/range {v2 .. v8}, Lcom/badlogic/gdx/math/BSpline;->calculate(Lcom/badlogic/gdx/math/Vector;IF[Lcom/badlogic/gdx/math/Vector;IZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    return-object p0
.end method

.method public static calculate(Lcom/badlogic/gdx/math/Vector;IF[Lcom/badlogic/gdx/math/Vector;IZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;IF[TT;IZTT;)TT;"
        }
    .end annotation

    const/4 v0, 0x3

    if-eq p4, v0, :cond_0

    return-object p0

    :cond_0
    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p5

    move-object v5, p6

    .line 146
    invoke-static/range {v0 .. v5}, Lcom/badlogic/gdx/math/BSpline;->cubic(Lcom/badlogic/gdx/math/Vector;IF[Lcom/badlogic/gdx/math/Vector;ZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    return-object p0
.end method

.method public static cubic(Lcom/badlogic/gdx/math/Vector;F[Lcom/badlogic/gdx/math/Vector;ZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;F[TT;ZTT;)TT;"
        }
    .end annotation

    if-eqz p3, :cond_0

    .line 34
    array-length v0, p2

    goto :goto_0

    :cond_0
    array-length v0, p2

    add-int/lit8 v0, v0, -0x3

    :goto_0
    int-to-float v1, v0

    mul-float v1, v1, p1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v2

    if-ltz p1, :cond_1

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_1
    float-to-int v0, v1

    :goto_1
    move v3, v0

    int-to-float p1, v3

    sub-float v4, v1, p1

    move-object v2, p0

    move-object v5, p2

    move v6, p3

    move-object v7, p4

    .line 38
    invoke-static/range {v2 .. v7}, Lcom/badlogic/gdx/math/BSpline;->cubic(Lcom/badlogic/gdx/math/Vector;IF[Lcom/badlogic/gdx/math/Vector;ZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    return-object p0
.end method

.method public static cubic(Lcom/badlogic/gdx/math/Vector;IF[Lcom/badlogic/gdx/math/Vector;ZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;IF[TT;ZTT;)TT;"
        }
    .end annotation

    .line 67
    array-length v0, p3

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v2, v1, p2

    mul-float v3, p2, p2

    mul-float v4, v3, p2

    .line 71
    aget-object v5, p3, p1

    invoke-interface {p0, v5}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object v5

    const/high16 v6, 0x40400000    # 3.0f

    mul-float v7, v4, v6

    const/high16 v8, 0x40c00000    # 6.0f

    mul-float v8, v8, v3

    sub-float/2addr v7, v8

    const/high16 v8, 0x40800000    # 4.0f

    add-float/2addr v7, v8

    const v8, 0x3e2aaaab

    mul-float v7, v7, v8

    invoke-interface {v5, v7}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    if-nez p4, :cond_0

    if-lez p1, :cond_1

    :cond_0
    add-int v5, v0, p1

    add-int/lit8 v5, v5, -0x1

    .line 72
    rem-int/2addr v5, v0

    aget-object v5, p3, v5

    invoke-interface {p5, v5}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object v5

    mul-float v7, v2, v2

    mul-float v7, v7, v2

    mul-float v7, v7, v8

    invoke-interface {v5, v7}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object v2

    invoke-interface {p0, v2}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    :cond_1
    if-nez p4, :cond_2

    add-int/lit8 v2, v0, -0x1

    if-ge p1, v2, :cond_3

    :cond_2
    add-int/lit8 v2, p1, 0x1

    .line 73
    rem-int/2addr v2, v0

    aget-object v2, p3, v2

    invoke-interface {p5, v2}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object v2

    const/high16 v5, -0x3fc00000    # -3.0f

    mul-float v5, v5, v4

    mul-float v3, v3, v6

    add-float/2addr v5, v3

    mul-float p2, p2, v6

    add-float/2addr v5, p2

    add-float/2addr v5, v1

    mul-float v5, v5, v8

    invoke-interface {v2, v5}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p2

    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    :cond_3
    if-nez p4, :cond_4

    add-int/lit8 p2, v0, -0x2

    if-ge p1, p2, :cond_5

    :cond_4
    add-int/lit8 p1, p1, 0x2

    .line 74
    rem-int/2addr p1, v0

    aget-object p1, p3, p1

    invoke-interface {p5, p1}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    mul-float v4, v4, v8

    invoke-interface {p1, v4}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    :cond_5
    return-object p0
.end method

.method public static cubic_derivative(Lcom/badlogic/gdx/math/Vector;F[Lcom/badlogic/gdx/math/Vector;ZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;F[TT;ZTT;)TT;"
        }
    .end annotation

    if-eqz p3, :cond_0

    .line 50
    array-length v0, p2

    goto :goto_0

    :cond_0
    array-length v0, p2

    add-int/lit8 v0, v0, -0x3

    :goto_0
    int-to-float v1, v0

    mul-float v1, v1, p1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v2

    if-ltz p1, :cond_1

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_1
    float-to-int v0, v1

    :goto_1
    move v3, v0

    int-to-float p1, v3

    sub-float v4, v1, p1

    move-object v2, p0

    move-object v5, p2

    move v6, p3

    move-object v7, p4

    .line 54
    invoke-static/range {v2 .. v7}, Lcom/badlogic/gdx/math/BSpline;->cubic(Lcom/badlogic/gdx/math/Vector;IF[Lcom/badlogic/gdx/math/Vector;ZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    return-object p0
.end method

.method public static cubic_derivative(Lcom/badlogic/gdx/math/Vector;IF[Lcom/badlogic/gdx/math/Vector;ZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;IF[TT;ZTT;)TT;"
        }
    .end annotation

    .line 88
    array-length v0, p3

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p2

    mul-float v2, p2, p2

    .line 92
    aget-object v3, p3, p1

    invoke-interface {p0, v3}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object v3

    const/high16 v4, 0x3fc00000    # 1.5f

    mul-float v4, v4, v2

    const/high16 v5, 0x40000000    # 2.0f

    mul-float v5, v5, p2

    sub-float/2addr v4, v5

    invoke-interface {v3, v4}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    if-nez p4, :cond_0

    if-lez p1, :cond_1

    :cond_0
    add-int v3, v0, p1

    add-int/lit8 v3, v3, -0x1

    .line 93
    rem-int/2addr v3, v0

    aget-object v3, p3, v3

    invoke-interface {p5, v3}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object v3

    const/high16 v4, -0x41000000    # -0.5f

    mul-float v4, v4, v1

    mul-float v4, v4, v1

    invoke-interface {v3, v4}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object v1

    invoke-interface {p0, v1}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    :cond_1
    const/high16 v1, 0x3f000000    # 0.5f

    if-nez p4, :cond_2

    add-int/lit8 v3, v0, -0x1

    if-ge p1, v3, :cond_3

    :cond_2
    add-int/lit8 v3, p1, 0x1

    .line 94
    rem-int/2addr v3, v0

    aget-object v3, p3, v3

    invoke-interface {p5, v3}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object v3

    const/high16 v4, -0x40400000    # -1.5f

    mul-float v4, v4, v2

    add-float/2addr v4, p2

    add-float/2addr v4, v1

    invoke-interface {v3, v4}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p2

    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    :cond_3
    if-nez p4, :cond_4

    add-int/lit8 p2, v0, -0x2

    if-ge p1, p2, :cond_5

    :cond_4
    add-int/lit8 p1, p1, 0x2

    .line 95
    rem-int/2addr p1, v0

    aget-object p1, p3, p1

    invoke-interface {p5, p1}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    mul-float v2, v2, v1

    invoke-interface {p1, v2}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    :cond_5
    return-object p0
.end method

.method public static derivative(Lcom/badlogic/gdx/math/Vector;F[Lcom/badlogic/gdx/math/Vector;IZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;F[TT;IZTT;)TT;"
        }
    .end annotation

    if-eqz p4, :cond_0

    .line 126
    array-length v0, p2

    goto :goto_0

    :cond_0
    array-length v0, p2

    sub-int/2addr v0, p3

    :goto_0
    int-to-float v1, v0

    mul-float v1, v1, p1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v2

    if-ltz p1, :cond_1

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_1
    float-to-int v0, v1

    :goto_1
    move v3, v0

    int-to-float p1, v3

    sub-float v4, v1, p1

    move-object v2, p0

    move-object v5, p2

    move v6, p3

    move v7, p4

    move-object v8, p5

    .line 130
    invoke-static/range {v2 .. v8}, Lcom/badlogic/gdx/math/BSpline;->derivative(Lcom/badlogic/gdx/math/Vector;IF[Lcom/badlogic/gdx/math/Vector;IZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    return-object p0
.end method

.method public static derivative(Lcom/badlogic/gdx/math/Vector;IF[Lcom/badlogic/gdx/math/Vector;IZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;IF[TT;IZTT;)TT;"
        }
    .end annotation

    const/4 v0, 0x3

    if-eq p4, v0, :cond_0

    return-object p0

    :cond_0
    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p5

    move-object v5, p6

    .line 164
    invoke-static/range {v0 .. v5}, Lcom/badlogic/gdx/math/BSpline;->cubic_derivative(Lcom/badlogic/gdx/math/Vector;IF[Lcom/badlogic/gdx/math/Vector;ZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public approxLength(I)F
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p1, :cond_1

    .line 301
    iget-object v2, p0, Lcom/badlogic/gdx/math/BSpline;->tmp2:Lcom/badlogic/gdx/math/Vector;

    iget-object v3, p0, Lcom/badlogic/gdx/math/BSpline;->tmp3:Lcom/badlogic/gdx/math/Vector;

    invoke-interface {v2, v3}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    .line 302
    iget-object v2, p0, Lcom/badlogic/gdx/math/BSpline;->tmp3:Lcom/badlogic/gdx/math/Vector;

    int-to-float v3, v1

    int-to-float v4, p1

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float/2addr v4, v5

    div-float/2addr v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/badlogic/gdx/math/BSpline;->valueAt(Lcom/badlogic/gdx/math/Vector;F)Lcom/badlogic/gdx/math/Vector;

    if-lez v1, :cond_0

    .line 303
    iget-object v2, p0, Lcom/badlogic/gdx/math/BSpline;->tmp2:Lcom/badlogic/gdx/math/Vector;

    iget-object v3, p0, Lcom/badlogic/gdx/math/BSpline;->tmp3:Lcom/badlogic/gdx/math/Vector;

    invoke-interface {v2, v3}, Lcom/badlogic/gdx/math/Vector;->dst(Lcom/badlogic/gdx/math/Vector;)F

    move-result v2

    add-float/2addr v0, v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public approximate(Lcom/badlogic/gdx/math/Vector;)F
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)F"
        }
    .end annotation

    .line 257
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/BSpline;->nearest(Lcom/badlogic/gdx/math/Vector;)I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/math/BSpline;->approximate(Lcom/badlogic/gdx/math/Vector;I)F

    move-result p1

    return p1
.end method

.method public approximate(Lcom/badlogic/gdx/math/Vector;I)F
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)F"
        }
    .end annotation

    .line 266
    iget-object v0, p0, Lcom/badlogic/gdx/math/BSpline;->knots:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/math/Vector;

    .line 267
    iget-object v1, p0, Lcom/badlogic/gdx/math/BSpline;->knots:Lcom/badlogic/gdx/utils/Array;

    if-lez p2, :cond_0

    add-int/lit8 v2, p2, -0x1

    goto :goto_0

    :cond_0
    iget v2, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    add-int/lit8 v2, v2, -0x1

    :goto_0
    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/math/Vector;

    .line 268
    iget-object v2, p0, Lcom/badlogic/gdx/math/BSpline;->knots:Lcom/badlogic/gdx/utils/Array;

    add-int/lit8 v3, p2, 0x1

    iget v4, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    rem-int/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/math/Vector;

    .line 269
    invoke-interface {p1, v1}, Lcom/badlogic/gdx/math/Vector;->dst2(Lcom/badlogic/gdx/math/Vector;)F

    move-result v3

    .line 270
    invoke-interface {p1, v2}, Lcom/badlogic/gdx/math/Vector;->dst2(Lcom/badlogic/gdx/math/Vector;)F

    move-result v4

    cmpg-float v3, v4, v3

    if-gez v3, :cond_1

    goto :goto_2

    :cond_1
    if-lez p2, :cond_2

    goto :goto_1

    .line 280
    :cond_2
    iget p2, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    :goto_1
    add-int/lit8 p2, p2, -0x1

    move-object v2, v0

    move-object v0, v1

    .line 282
    :goto_2
    invoke-interface {v0, v2}, Lcom/badlogic/gdx/math/Vector;->dst2(Lcom/badlogic/gdx/math/Vector;)F

    move-result v1

    .line 283
    invoke-interface {p1, v2}, Lcom/badlogic/gdx/math/Vector;->dst2(Lcom/badlogic/gdx/math/Vector;)F

    move-result v2

    .line 284
    invoke-interface {p1, v0}, Lcom/badlogic/gdx/math/Vector;->dst2(Lcom/badlogic/gdx/math/Vector;)F

    move-result p1

    float-to-double v3, v1

    .line 285
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    double-to-float v0, v3

    add-float/2addr v2, v1

    sub-float/2addr v2, p1

    const/high16 p1, 0x40000000    # 2.0f

    mul-float p1, p1, v0

    div-float/2addr v2, p1

    sub-float p1, v0, v2

    div-float/2addr p1, v0

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 287
    invoke-static {p1, v0, v1}, Lcom/badlogic/gdx/math/MathUtils;->clamp(FFF)F

    move-result p1

    int-to-float p2, p2

    add-float/2addr p2, p1

    .line 288
    iget p1, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    int-to-float p1, p1

    div-float/2addr p2, p1

    return p2
.end method

.method public approximate(Lcom/badlogic/gdx/math/Vector;II)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)F"
        }
    .end annotation

    .line 261
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/math/BSpline;->nearest(Lcom/badlogic/gdx/math/Vector;II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/BSpline;->approximate(Lcom/badlogic/gdx/math/Vector;I)F

    move-result p1

    return p1
.end method

.method public bridge synthetic approximate(Ljava/lang/Object;)F
    .locals 0

    .line 22
    check-cast p1, Lcom/badlogic/gdx/math/Vector;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/BSpline;->approximate(Lcom/badlogic/gdx/math/Vector;)F

    move-result p1

    return p1
.end method

.method public derivativeAt(Lcom/badlogic/gdx/math/Vector;F)Lcom/badlogic/gdx/math/Vector;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;F)TT;"
        }
    .end annotation

    .line 221
    iget v0, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    int-to-float v1, v0

    mul-float v1, v1, p2

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float p2, p2, v2

    if-ltz p2, :cond_0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    float-to-int v0, v1

    :goto_0
    int-to-float p2, v0

    sub-float/2addr v1, p2

    .line 225
    invoke-virtual {p0, p1, v0, v1}, Lcom/badlogic/gdx/math/BSpline;->derivativeAt(Lcom/badlogic/gdx/math/Vector;IF)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    return-object p1
.end method

.method public derivativeAt(Lcom/badlogic/gdx/math/Vector;IF)Lcom/badlogic/gdx/math/Vector;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;IF)TT;"
        }
    .end annotation

    .line 230
    iget-boolean v0, p0, Lcom/badlogic/gdx/math/BSpline;->continuous:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/math/BSpline;->degree:I

    int-to-float v0, v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v0, v0, v1

    float-to-int v0, v0

    add-int/2addr p2, v0

    :goto_0
    move v1, p2

    iget-object v3, p0, Lcom/badlogic/gdx/math/BSpline;->controlPoints:[Lcom/badlogic/gdx/math/Vector;

    iget v4, p0, Lcom/badlogic/gdx/math/BSpline;->degree:I

    iget-boolean v5, p0, Lcom/badlogic/gdx/math/BSpline;->continuous:Z

    iget-object v6, p0, Lcom/badlogic/gdx/math/BSpline;->tmp:Lcom/badlogic/gdx/math/Vector;

    move-object v0, p1

    move v2, p3

    invoke-static/range {v0 .. v6}, Lcom/badlogic/gdx/math/BSpline;->derivative(Lcom/badlogic/gdx/math/Vector;IF[Lcom/badlogic/gdx/math/Vector;IZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic derivativeAt(Ljava/lang/Object;F)Ljava/lang/Object;
    .locals 0

    .line 22
    check-cast p1, Lcom/badlogic/gdx/math/Vector;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/BSpline;->derivativeAt(Lcom/badlogic/gdx/math/Vector;F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    return-object p1
.end method

.method public locate(Lcom/badlogic/gdx/math/Vector;)F
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)F"
        }
    .end annotation

    .line 294
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/BSpline;->approximate(Lcom/badlogic/gdx/math/Vector;)F

    move-result p1

    return p1
.end method

.method public bridge synthetic locate(Ljava/lang/Object;)F
    .locals 0

    .line 22
    check-cast p1, Lcom/badlogic/gdx/math/Vector;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/BSpline;->locate(Lcom/badlogic/gdx/math/Vector;)F

    move-result p1

    return p1
.end method

.method public nearest(Lcom/badlogic/gdx/math/Vector;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 235
    iget v0, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/badlogic/gdx/math/BSpline;->nearest(Lcom/badlogic/gdx/math/Vector;II)I

    move-result p1

    return p1
.end method

.method public nearest(Lcom/badlogic/gdx/math/Vector;II)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;II)I"
        }
    .end annotation

    :goto_0
    if-gez p2, :cond_0

    .line 241
    iget v0, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    add-int/2addr p2, v0

    goto :goto_0

    .line 242
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    rem-int v0, p2, v0

    .line 243
    iget-object v1, p0, Lcom/badlogic/gdx/math/BSpline;->knots:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/math/Vector;

    invoke-interface {p1, v1}, Lcom/badlogic/gdx/math/Vector;->dst2(Lcom/badlogic/gdx/math/Vector;)F

    move-result v1

    const/4 v2, 0x1

    :goto_1
    if-ge v2, p3, :cond_2

    add-int v3, p2, v2

    .line 245
    iget v4, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    rem-int/2addr v3, v4

    .line 246
    iget-object v4, p0, Lcom/badlogic/gdx/math/BSpline;->knots:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/math/Vector;

    invoke-interface {p1, v4}, Lcom/badlogic/gdx/math/Vector;->dst2(Lcom/badlogic/gdx/math/Vector;)F

    move-result v4

    cmpg-float v5, v4, v1

    if-gez v5, :cond_1

    move v0, v3

    move v1, v4

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return v0
.end method

.method public set([Lcom/badlogic/gdx/math/Vector;IZ)Lcom/badlogic/gdx/math/BSpline;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;IZ)",
            "Lcom/badlogic/gdx/math/BSpline;"
        }
    .end annotation

    .line 186
    iget-object v0, p0, Lcom/badlogic/gdx/math/BSpline;->tmp:Lcom/badlogic/gdx/math/Vector;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    aget-object v0, p1, v1

    invoke-interface {v0}, Lcom/badlogic/gdx/math/Vector;->cpy()Lcom/badlogic/gdx/math/Vector;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/math/BSpline;->tmp:Lcom/badlogic/gdx/math/Vector;

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/math/BSpline;->tmp2:Lcom/badlogic/gdx/math/Vector;

    if-nez v0, :cond_1

    aget-object v0, p1, v1

    invoke-interface {v0}, Lcom/badlogic/gdx/math/Vector;->cpy()Lcom/badlogic/gdx/math/Vector;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/math/BSpline;->tmp2:Lcom/badlogic/gdx/math/Vector;

    .line 188
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/math/BSpline;->tmp3:Lcom/badlogic/gdx/math/Vector;

    if-nez v0, :cond_2

    aget-object v0, p1, v1

    invoke-interface {v0}, Lcom/badlogic/gdx/math/Vector;->cpy()Lcom/badlogic/gdx/math/Vector;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/math/BSpline;->tmp3:Lcom/badlogic/gdx/math/Vector;

    .line 189
    :cond_2
    iput-object p1, p0, Lcom/badlogic/gdx/math/BSpline;->controlPoints:[Lcom/badlogic/gdx/math/Vector;

    .line 190
    iput p2, p0, Lcom/badlogic/gdx/math/BSpline;->degree:I

    .line 191
    iput-boolean p3, p0, Lcom/badlogic/gdx/math/BSpline;->continuous:Z

    if-eqz p3, :cond_3

    .line 192
    array-length v0, p1

    goto :goto_0

    :cond_3
    array-length v0, p1

    sub-int/2addr v0, p2

    :goto_0
    iput v0, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    .line 193
    iget-object v0, p0, Lcom/badlogic/gdx/math/BSpline;->knots:Lcom/badlogic/gdx/utils/Array;

    if-nez v0, :cond_4

    .line 194
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    iget v2, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/math/BSpline;->knots:Lcom/badlogic/gdx/utils/Array;

    goto :goto_1

    .line 196
    :cond_4
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 197
    iget-object v0, p0, Lcom/badlogic/gdx/math/BSpline;->knots:Lcom/badlogic/gdx/utils/Array;

    iget v2, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    :goto_1
    const/4 v0, 0x0

    .line 199
    :goto_2
    iget v2, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    if-ge v0, v2, :cond_6

    .line 200
    iget-object v2, p0, Lcom/badlogic/gdx/math/BSpline;->knots:Lcom/badlogic/gdx/utils/Array;

    aget-object v3, p1, v1

    invoke-interface {v3}, Lcom/badlogic/gdx/math/Vector;->cpy()Lcom/badlogic/gdx/math/Vector;

    move-result-object v4

    if-eqz p3, :cond_5

    move v5, v0

    goto :goto_3

    :cond_5
    int-to-float v3, v0

    const/high16 v5, 0x3f000000    # 0.5f

    int-to-float v6, p2

    mul-float v6, v6, v5

    add-float/2addr v3, v6

    float-to-int v3, v3

    move v5, v3

    :goto_3
    const/4 v6, 0x0

    iget-object v10, p0, Lcom/badlogic/gdx/math/BSpline;->tmp:Lcom/badlogic/gdx/math/Vector;

    move-object v7, p1

    move v8, p2

    move v9, p3

    invoke-static/range {v4 .. v10}, Lcom/badlogic/gdx/math/BSpline;->calculate(Lcom/badlogic/gdx/math/Vector;IF[Lcom/badlogic/gdx/math/Vector;IZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_6
    return-object p0
.end method

.method public valueAt(Lcom/badlogic/gdx/math/Vector;F)Lcom/badlogic/gdx/math/Vector;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;F)TT;"
        }
    .end annotation

    .line 207
    iget v0, p0, Lcom/badlogic/gdx/math/BSpline;->spanCount:I

    int-to-float v1, v0

    mul-float v1, v1, p2

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float p2, p2, v2

    if-ltz p2, :cond_0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    float-to-int v0, v1

    :goto_0
    int-to-float p2, v0

    sub-float/2addr v1, p2

    .line 211
    invoke-virtual {p0, p1, v0, v1}, Lcom/badlogic/gdx/math/BSpline;->valueAt(Lcom/badlogic/gdx/math/Vector;IF)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    return-object p1
.end method

.method public valueAt(Lcom/badlogic/gdx/math/Vector;IF)Lcom/badlogic/gdx/math/Vector;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;IF)TT;"
        }
    .end annotation

    .line 216
    iget-boolean v0, p0, Lcom/badlogic/gdx/math/BSpline;->continuous:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/math/BSpline;->degree:I

    int-to-float v0, v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v0, v0, v1

    float-to-int v0, v0

    add-int/2addr p2, v0

    :goto_0
    move v1, p2

    iget-object v3, p0, Lcom/badlogic/gdx/math/BSpline;->controlPoints:[Lcom/badlogic/gdx/math/Vector;

    iget v4, p0, Lcom/badlogic/gdx/math/BSpline;->degree:I

    iget-boolean v5, p0, Lcom/badlogic/gdx/math/BSpline;->continuous:Z

    iget-object v6, p0, Lcom/badlogic/gdx/math/BSpline;->tmp:Lcom/badlogic/gdx/math/Vector;

    move-object v0, p1

    move v2, p3

    invoke-static/range {v0 .. v6}, Lcom/badlogic/gdx/math/BSpline;->calculate(Lcom/badlogic/gdx/math/Vector;IF[Lcom/badlogic/gdx/math/Vector;IZLcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic valueAt(Ljava/lang/Object;F)Ljava/lang/Object;
    .locals 0

    .line 22
    check-cast p1, Lcom/badlogic/gdx/math/Vector;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/BSpline;->valueAt(Lcom/badlogic/gdx/math/Vector;F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    return-object p1
.end method
