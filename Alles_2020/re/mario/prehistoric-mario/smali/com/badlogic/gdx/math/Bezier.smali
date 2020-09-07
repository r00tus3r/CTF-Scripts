.class public Lcom/badlogic/gdx/math/Bezier;
.super Ljava/lang/Object;
.source "Bezier.java"

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


# instance fields
.field public points:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation
.end field

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
    .locals 1

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/utils/Array;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;II)V"
        }
    .end annotation

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    .line 134
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/math/Bezier;->set(Lcom/badlogic/gdx/utils/Array;II)Lcom/badlogic/gdx/math/Bezier;

    return-void
.end method

.method public varargs constructor <init>([Lcom/badlogic/gdx/math/Vector;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    .line 126
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Bezier;->set([Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Bezier;

    return-void
.end method

.method public constructor <init>([Lcom/badlogic/gdx/math/Vector;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;II)V"
        }
    .end annotation

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    .line 130
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/math/Bezier;->set([Lcom/badlogic/gdx/math/Vector;II)Lcom/badlogic/gdx/math/Bezier;

    return-void
.end method

.method public static cubic(Lcom/badlogic/gdx/math/Vector;FLcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;FTT;TT;TT;TT;TT;)TT;"
        }
    .end annotation

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p1

    mul-float v1, v0, v0

    mul-float v2, p1, p1

    .line 95
    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    mul-float p2, v1, v0

    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    invoke-interface {p6, p3}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p2

    const/high16 p3, 0x40400000    # 3.0f

    mul-float v1, v1, p3

    mul-float v1, v1, p1

    invoke-interface {p2, v1}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p2

    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    invoke-interface {p6, p4}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p2

    mul-float v0, v0, p3

    mul-float v0, v0, v2

    invoke-interface {p2, v0}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p2

    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    .line 96
    invoke-interface {p6, p5}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p2

    mul-float v2, v2, p1

    invoke-interface {p2, v2}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    return-object p0
.end method

.method public static cubic_derivative(Lcom/badlogic/gdx/math/Vector;FLcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;FTT;TT;TT;TT;TT;)TT;"
        }
    .end annotation

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p1

    mul-float v1, v0, v0

    mul-float v2, p1, p1

    .line 114
    invoke-interface {p0, p3}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->sub(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    const/high16 p2, 0x40400000    # 3.0f

    mul-float v1, v1, p2

    invoke-interface {p0, v1}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    invoke-interface {p6, p4}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object v1

    invoke-interface {v1, p3}, Lcom/badlogic/gdx/math/Vector;->sub(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p3

    mul-float v0, v0, p1

    const/high16 p1, 0x40c00000    # 6.0f

    mul-float v0, v0, p1

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    invoke-interface {p6, p5}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    invoke-interface {p1, p4}, Lcom/badlogic/gdx/math/Vector;->sub(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    mul-float v2, v2, p2

    invoke-interface {p1, v2}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    return-object p0
.end method

.method public static linear(Lcom/badlogic/gdx/math/Vector;FLcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;FTT;TT;TT;)TT;"
        }
    .end annotation

    .line 36
    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    const/high16 p2, 0x3f800000    # 1.0f

    sub-float/2addr p2, p1

    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    invoke-interface {p4, p3}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    return-object p0
.end method

.method public static linear_derivative(Lcom/badlogic/gdx/math/Vector;FLcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;FTT;TT;TT;)TT;"
        }
    .end annotation

    .line 48
    invoke-interface {p0, p3}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->sub(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    return-object p0
.end method

.method public static quadratic(Lcom/badlogic/gdx/math/Vector;FLcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;FTT;TT;TT;TT;)TT;"
        }
    .end annotation

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p1

    .line 62
    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    mul-float p2, v0, v0

    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    invoke-interface {p5, p3}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p2

    const/high16 p3, 0x40000000    # 2.0f

    mul-float v0, v0, p3

    mul-float v0, v0, p1

    invoke-interface {p2, v0}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p2

    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    invoke-interface {p5, p4}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p2

    mul-float p1, p1, p1

    invoke-interface {p2, p1}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    return-object p0
.end method

.method public static quadratic_derivative(Lcom/badlogic/gdx/math/Vector;FLcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/math/Vector<",
            "TT;>;>(TT;FTT;TT;TT;TT;)TT;"
        }
    .end annotation

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p1

    .line 77
    invoke-interface {p0, p3}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->sub(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    const/high16 p2, 0x40000000    # 2.0f

    invoke-interface {p0, p2}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    invoke-interface {p0, v0}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p0

    invoke-interface {p5, p4}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p4

    invoke-interface {p4, p3}, Lcom/badlogic/gdx/math/Vector;->sub(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    move-result-object p3

    invoke-interface {p3, p1}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/badlogic/gdx/math/Vector;->scl(F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/badlogic/gdx/math/Vector;->add(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

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

    .line 209
    iget-object v2, p0, Lcom/badlogic/gdx/math/Bezier;->tmp2:Lcom/badlogic/gdx/math/Vector;

    iget-object v3, p0, Lcom/badlogic/gdx/math/Bezier;->tmp3:Lcom/badlogic/gdx/math/Vector;

    invoke-interface {v2, v3}, Lcom/badlogic/gdx/math/Vector;->set(Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    .line 210
    iget-object v2, p0, Lcom/badlogic/gdx/math/Bezier;->tmp3:Lcom/badlogic/gdx/math/Vector;

    int-to-float v3, v1

    int-to-float v4, p1

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float/2addr v4, v5

    div-float/2addr v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/badlogic/gdx/math/Bezier;->valueAt(Lcom/badlogic/gdx/math/Vector;F)Lcom/badlogic/gdx/math/Vector;

    if-lez v1, :cond_0

    .line 211
    iget-object v2, p0, Lcom/badlogic/gdx/math/Bezier;->tmp2:Lcom/badlogic/gdx/math/Vector;

    iget-object v3, p0, Lcom/badlogic/gdx/math/Bezier;->tmp3:Lcom/badlogic/gdx/math/Vector;

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
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)F"
        }
    .end annotation

    .line 188
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/math/Vector;

    .line 189
    iget-object v1, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    iget v2, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/math/Vector;

    .line 191
    invoke-interface {v0, v1}, Lcom/badlogic/gdx/math/Vector;->dst2(Lcom/badlogic/gdx/math/Vector;)F

    move-result v2

    .line 192
    invoke-interface {p1, v1}, Lcom/badlogic/gdx/math/Vector;->dst2(Lcom/badlogic/gdx/math/Vector;)F

    move-result v1

    .line 193
    invoke-interface {p1, v0}, Lcom/badlogic/gdx/math/Vector;->dst2(Lcom/badlogic/gdx/math/Vector;)F

    move-result p1

    float-to-double v3, v2

    .line 194
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    double-to-float v0, v3

    add-float/2addr v1, v2

    sub-float/2addr v1, p1

    const/high16 p1, 0x40000000    # 2.0f

    mul-float p1, p1, v0

    div-float/2addr v1, p1

    sub-float p1, v0, v1

    div-float/2addr p1, v0

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 196
    invoke-static {p1, v0, v1}, Lcom/badlogic/gdx/math/MathUtils;->clamp(FFF)F

    move-result p1

    return p1
.end method

.method public bridge synthetic approximate(Ljava/lang/Object;)F
    .locals 0

    .line 24
    check-cast p1, Lcom/badlogic/gdx/math/Vector;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Bezier;->approximate(Lcom/badlogic/gdx/math/Vector;)F

    move-result p1

    return p1
.end method

.method public derivativeAt(Lcom/badlogic/gdx/math/Vector;F)Lcom/badlogic/gdx/math/Vector;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;F)TT;"
        }
    .end annotation

    .line 176
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_0

    .line 178
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/math/Vector;

    iget-object v2, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/math/Vector;

    iget-object v2, p0, Lcom/badlogic/gdx/math/Bezier;->tmp:Lcom/badlogic/gdx/math/Vector;

    invoke-static {p1, p2, v0, v1, v2}, Lcom/badlogic/gdx/math/Bezier;->linear_derivative(Lcom/badlogic/gdx/math/Vector;FLcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    goto :goto_0

    :cond_0
    const/4 v4, 0x3

    if-ne v0, v4, :cond_1

    .line 180
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/badlogic/gdx/math/Vector;

    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/badlogic/gdx/math/Vector;

    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/badlogic/gdx/math/Vector;

    iget-object v9, p0, Lcom/badlogic/gdx/math/Bezier;->tmp:Lcom/badlogic/gdx/math/Vector;

    move-object v4, p1

    move v5, p2

    invoke-static/range {v4 .. v9}, Lcom/badlogic/gdx/math/Bezier;->quadratic_derivative(Lcom/badlogic/gdx/math/Vector;FLcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    goto :goto_0

    :cond_1
    const/4 v5, 0x4

    if-ne v0, v5, :cond_2

    .line 181
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/badlogic/gdx/math/Vector;

    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/badlogic/gdx/math/Vector;

    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lcom/badlogic/gdx/math/Vector;

    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Lcom/badlogic/gdx/math/Vector;

    iget-object v11, p0, Lcom/badlogic/gdx/math/Bezier;->tmp:Lcom/badlogic/gdx/math/Vector;

    move-object v5, p1

    move v6, p2

    invoke-static/range {v5 .. v11}, Lcom/badlogic/gdx/math/Bezier;->cubic_derivative(Lcom/badlogic/gdx/math/Vector;FLcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    :cond_2
    :goto_0
    return-object p1
.end method

.method public bridge synthetic derivativeAt(Ljava/lang/Object;F)Ljava/lang/Object;
    .locals 0

    .line 24
    check-cast p1, Lcom/badlogic/gdx/math/Vector;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Bezier;->derivativeAt(Lcom/badlogic/gdx/math/Vector;F)Lcom/badlogic/gdx/math/Vector;

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

    .line 202
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Bezier;->approximate(Lcom/badlogic/gdx/math/Vector;)F

    move-result p1

    return p1
.end method

.method public bridge synthetic locate(Ljava/lang/Object;)F
    .locals 0

    .line 24
    check-cast p1, Lcom/badlogic/gdx/math/Vector;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Bezier;->locate(Lcom/badlogic/gdx/math/Vector;)F

    move-result p1

    return p1
.end method

.method public set(Lcom/badlogic/gdx/utils/Array;II)Lcom/badlogic/gdx/math/Bezier;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;II)",
            "Lcom/badlogic/gdx/math/Bezier;"
        }
    .end annotation

    const/4 v0, 0x2

    if-lt p3, v0, :cond_3

    const/4 v0, 0x4

    if-gt p3, v0, :cond_3

    .line 155
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->tmp:Lcom/badlogic/gdx/math/Vector;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/math/Vector;

    invoke-interface {v0}, Lcom/badlogic/gdx/math/Vector;->cpy()Lcom/badlogic/gdx/math/Vector;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->tmp:Lcom/badlogic/gdx/math/Vector;

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->tmp2:Lcom/badlogic/gdx/math/Vector;

    if-nez v0, :cond_1

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/math/Vector;

    invoke-interface {v0}, Lcom/badlogic/gdx/math/Vector;->cpy()Lcom/badlogic/gdx/math/Vector;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->tmp2:Lcom/badlogic/gdx/math/Vector;

    .line 157
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->tmp3:Lcom/badlogic/gdx/math/Vector;

    if-nez v0, :cond_2

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/math/Vector;

    invoke-interface {v0}, Lcom/badlogic/gdx/math/Vector;->cpy()Lcom/badlogic/gdx/math/Vector;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->tmp3:Lcom/badlogic/gdx/math/Vector;

    .line 158
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 159
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/utils/Array;->addAll(Lcom/badlogic/gdx/utils/Array;II)V

    return-object p0

    .line 154
    :cond_3
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Only first, second and third degree Bezier curves are supported."

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public varargs set([Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Bezier;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)",
            "Lcom/badlogic/gdx/math/Bezier;"
        }
    .end annotation

    .line 138
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/badlogic/gdx/math/Bezier;->set([Lcom/badlogic/gdx/math/Vector;II)Lcom/badlogic/gdx/math/Bezier;

    move-result-object p1

    return-object p1
.end method

.method public set([Lcom/badlogic/gdx/math/Vector;II)Lcom/badlogic/gdx/math/Bezier;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;II)",
            "Lcom/badlogic/gdx/math/Bezier;"
        }
    .end annotation

    const/4 v0, 0x2

    if-lt p3, v0, :cond_3

    const/4 v0, 0x4

    if-gt p3, v0, :cond_3

    .line 144
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->tmp:Lcom/badlogic/gdx/math/Vector;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    aget-object v0, p1, v1

    invoke-interface {v0}, Lcom/badlogic/gdx/math/Vector;->cpy()Lcom/badlogic/gdx/math/Vector;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->tmp:Lcom/badlogic/gdx/math/Vector;

    .line 145
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->tmp2:Lcom/badlogic/gdx/math/Vector;

    if-nez v0, :cond_1

    aget-object v0, p1, v1

    invoke-interface {v0}, Lcom/badlogic/gdx/math/Vector;->cpy()Lcom/badlogic/gdx/math/Vector;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->tmp2:Lcom/badlogic/gdx/math/Vector;

    .line 146
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->tmp3:Lcom/badlogic/gdx/math/Vector;

    if-nez v0, :cond_2

    aget-object v0, p1, v1

    invoke-interface {v0}, Lcom/badlogic/gdx/math/Vector;->cpy()Lcom/badlogic/gdx/math/Vector;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->tmp3:Lcom/badlogic/gdx/math/Vector;

    .line 147
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 148
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/utils/Array;->addAll([Ljava/lang/Object;II)V

    return-object p0

    .line 143
    :cond_3
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Only first, second and third degree Bezier curves are supported."

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public valueAt(Lcom/badlogic/gdx/math/Vector;F)Lcom/badlogic/gdx/math/Vector;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;F)TT;"
        }
    .end annotation

    .line 165
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_0

    .line 167
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/math/Vector;

    iget-object v2, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/math/Vector;

    iget-object v2, p0, Lcom/badlogic/gdx/math/Bezier;->tmp:Lcom/badlogic/gdx/math/Vector;

    invoke-static {p1, p2, v0, v1, v2}, Lcom/badlogic/gdx/math/Bezier;->linear(Lcom/badlogic/gdx/math/Vector;FLcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    goto :goto_0

    :cond_0
    const/4 v4, 0x3

    if-ne v0, v4, :cond_1

    .line 169
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/badlogic/gdx/math/Vector;

    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/badlogic/gdx/math/Vector;

    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/badlogic/gdx/math/Vector;

    iget-object v9, p0, Lcom/badlogic/gdx/math/Bezier;->tmp:Lcom/badlogic/gdx/math/Vector;

    move-object v4, p1

    move v5, p2

    invoke-static/range {v4 .. v9}, Lcom/badlogic/gdx/math/Bezier;->quadratic(Lcom/badlogic/gdx/math/Vector;FLcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    goto :goto_0

    :cond_1
    const/4 v5, 0x4

    if-ne v0, v5, :cond_2

    .line 170
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/badlogic/gdx/math/Vector;

    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/badlogic/gdx/math/Vector;

    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lcom/badlogic/gdx/math/Vector;

    iget-object v0, p0, Lcom/badlogic/gdx/math/Bezier;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Lcom/badlogic/gdx/math/Vector;

    iget-object v11, p0, Lcom/badlogic/gdx/math/Bezier;->tmp:Lcom/badlogic/gdx/math/Vector;

    move-object v5, p1

    move v6, p2

    invoke-static/range {v5 .. v11}, Lcom/badlogic/gdx/math/Bezier;->cubic(Lcom/badlogic/gdx/math/Vector;FLcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;Lcom/badlogic/gdx/math/Vector;)Lcom/badlogic/gdx/math/Vector;

    :cond_2
    :goto_0
    return-object p1
.end method

.method public bridge synthetic valueAt(Ljava/lang/Object;F)Ljava/lang/Object;
    .locals 0

    .line 24
    check-cast p1, Lcom/badlogic/gdx/math/Vector;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/Bezier;->valueAt(Lcom/badlogic/gdx/math/Vector;F)Lcom/badlogic/gdx/math/Vector;

    move-result-object p1

    return-object p1
.end method
