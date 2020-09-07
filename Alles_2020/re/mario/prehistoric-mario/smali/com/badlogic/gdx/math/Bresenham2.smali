.class public Lcom/badlogic/gdx/math/Bresenham2;
.super Ljava/lang/Object;
.source "Bresenham2.java"


# instance fields
.field private final points:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/math/GridPoint2;",
            ">;"
        }
    .end annotation
.end field

.field private final pool:Lcom/badlogic/gdx/utils/Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Pool<",
            "Lcom/badlogic/gdx/math/GridPoint2;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/math/Bresenham2;->points:Lcom/badlogic/gdx/utils/Array;

    .line 30
    new-instance v0, Lcom/badlogic/gdx/math/Bresenham2$1;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/math/Bresenham2$1;-><init>(Lcom/badlogic/gdx/math/Bresenham2;)V

    iput-object v0, p0, Lcom/badlogic/gdx/math/Bresenham2;->pool:Lcom/badlogic/gdx/utils/Pool;

    return-void
.end method


# virtual methods
.method public line(IIII)Lcom/badlogic/gdx/utils/Array;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII)",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/math/GridPoint2;",
            ">;"
        }
    .end annotation

    .line 52
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bresenham2;->pool:Lcom/badlogic/gdx/utils/Pool;

    iget-object v1, p0, Lcom/badlogic/gdx/math/Bresenham2;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Pool;->freeAll(Lcom/badlogic/gdx/utils/Array;)V

    .line 53
    iget-object v0, p0, Lcom/badlogic/gdx/math/Bresenham2;->points:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 54
    iget-object v6, p0, Lcom/badlogic/gdx/math/Bresenham2;->pool:Lcom/badlogic/gdx/utils/Pool;

    iget-object v7, p0, Lcom/badlogic/gdx/math/Bresenham2;->points:Lcom/badlogic/gdx/utils/Array;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v1 .. v7}, Lcom/badlogic/gdx/math/Bresenham2;->line(IIIILcom/badlogic/gdx/utils/Pool;Lcom/badlogic/gdx/utils/Array;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public line(IIIILcom/badlogic/gdx/utils/Pool;Lcom/badlogic/gdx/utils/Array;)Lcom/badlogic/gdx/utils/Array;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII",
            "Lcom/badlogic/gdx/utils/Pool<",
            "Lcom/badlogic/gdx/math/GridPoint2;",
            ">;",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/math/GridPoint2;",
            ">;)",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/math/GridPoint2;",
            ">;"
        }
    .end annotation

    sub-int/2addr p3, p1

    sub-int/2addr p4, p2

    const/4 v0, -0x1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-gez p3, :cond_0

    const/4 v3, -0x1

    const/4 v4, -0x1

    goto :goto_0

    :cond_0
    if-lez p3, :cond_1

    const/4 v3, 0x1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-gez p4, :cond_2

    const/4 v5, -0x1

    goto :goto_1

    :cond_2
    if-lez p4, :cond_3

    const/4 v5, 0x1

    goto :goto_1

    :cond_3
    const/4 v5, 0x0

    .line 80
    :goto_1
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result v6

    .line 81
    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result v7

    if-gt v6, v7, :cond_6

    .line 83
    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result v6

    .line 84
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result v7

    if-gez p4, :cond_4

    goto :goto_2

    :cond_4
    if-lez p4, :cond_5

    const/4 v0, 0x1

    goto :goto_2

    :cond_5
    const/4 v0, 0x0

    :goto_2
    const/4 v4, 0x0

    goto :goto_3

    :cond_6
    const/4 v0, 0x0

    :goto_3
    shr-int/lit8 p3, v6, 0x1

    :goto_4
    if-gt v2, v6, :cond_8

    .line 92
    invoke-virtual {p5}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/badlogic/gdx/math/GridPoint2;

    .line 93
    invoke-virtual {p4, p1, p2}, Lcom/badlogic/gdx/math/GridPoint2;->set(II)Lcom/badlogic/gdx/math/GridPoint2;

    .line 94
    invoke-virtual {p6, p4}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    add-int/2addr p3, v7

    if-le p3, v6, :cond_7

    sub-int/2addr p3, v6

    add-int/2addr p1, v3

    add-int/2addr p2, v5

    goto :goto_5

    :cond_7
    add-int/2addr p1, v4

    add-int/2addr p2, v0

    :goto_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_8
    return-object p6
.end method

.method public line(Lcom/badlogic/gdx/math/GridPoint2;Lcom/badlogic/gdx/math/GridPoint2;)Lcom/badlogic/gdx/utils/Array;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/math/GridPoint2;",
            "Lcom/badlogic/gdx/math/GridPoint2;",
            ")",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/math/GridPoint2;",
            ">;"
        }
    .end annotation

    .line 42
    iget v0, p1, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    iget v1, p2, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    iget p2, p2, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    invoke-virtual {p0, v0, p1, v1, p2}, Lcom/badlogic/gdx/math/Bresenham2;->line(IIII)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method
