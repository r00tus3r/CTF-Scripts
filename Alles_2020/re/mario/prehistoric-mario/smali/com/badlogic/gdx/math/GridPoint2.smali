.class public Lcom/badlogic/gdx/math/GridPoint2;
.super Ljava/lang/Object;
.source "GridPoint2.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x37c9cd596ac15704L


# instance fields
.field public x:I

.field public y:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    .line 40
    iput p2, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/GridPoint2;)V
    .locals 1

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iget v0, p1, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    .line 48
    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    return-void
.end method


# virtual methods
.method public add(II)Lcom/badlogic/gdx/math/GridPoint2;
    .locals 1

    .line 140
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    .line 141
    iget p1, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    add-int/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    return-object p0
.end method

.method public add(Lcom/badlogic/gdx/math/GridPoint2;)Lcom/badlogic/gdx/math/GridPoint2;
    .locals 2

    .line 127
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    iget v1, p1, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    .line 128
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    return-object p0
.end method

.method public cpy()Lcom/badlogic/gdx/math/GridPoint2;
    .locals 1

    .line 174
    new-instance v0, Lcom/badlogic/gdx/math/GridPoint2;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/math/GridPoint2;-><init>(Lcom/badlogic/gdx/math/GridPoint2;)V

    return-object v0
.end method

.method public dst(II)F
    .locals 1

    .line 114
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    sub-int/2addr p1, v0

    .line 115
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    sub-int/2addr p2, v0

    mul-int p1, p1, p1

    mul-int p2, p2, p2

    add-int/2addr p1, p2

    int-to-double p1, p1

    .line 117
    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p1

    double-to-float p1, p1

    return p1
.end method

.method public dst(Lcom/badlogic/gdx/math/GridPoint2;)F
    .locals 2

    .line 102
    iget v0, p1, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    iget v1, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    sub-int/2addr v0, v1

    .line 103
    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    iget v1, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    sub-int/2addr p1, v1

    mul-int v0, v0, v0

    mul-int p1, p1, p1

    add-int/2addr v0, p1

    int-to-double v0, v0

    .line 105
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p1, v0

    return p1
.end method

.method public dst2(II)F
    .locals 1

    .line 91
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    sub-int/2addr p1, v0

    .line 92
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    sub-int/2addr p2, v0

    mul-int p1, p1, p1

    mul-int p2, p2, p2

    add-int/2addr p1, p2

    int-to-float p1, p1

    return p1
.end method

.method public dst2(Lcom/badlogic/gdx/math/GridPoint2;)F
    .locals 2

    .line 79
    iget v0, p1, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    iget v1, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    sub-int/2addr v0, v1

    .line 80
    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    iget v1, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    sub-int/2addr p1, v1

    mul-int v0, v0, v0

    mul-int p1, p1, p1

    add-int/2addr v0, p1

    int-to-float p1, v0

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 180
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 181
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/math/GridPoint2;

    .line 182
    iget v2, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    iget v3, p1, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    if-ne v2, p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 189
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    const/16 v1, 0x35

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x35

    .line 190
    iget v1, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    add-int/2addr v0, v1

    return v0
.end method

.method public set(II)Lcom/badlogic/gdx/math/GridPoint2;
    .locals 0

    .line 69
    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    .line 70
    iput p2, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/math/GridPoint2;)Lcom/badlogic/gdx/math/GridPoint2;
    .locals 1

    .line 57
    iget v0, p1, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    .line 58
    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    return-object p0
.end method

.method public sub(II)Lcom/badlogic/gdx/math/GridPoint2;
    .locals 1

    .line 165
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    sub-int/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    .line 166
    iget p1, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    return-object p0
.end method

.method public sub(Lcom/badlogic/gdx/math/GridPoint2;)Lcom/badlogic/gdx/math/GridPoint2;
    .locals 2

    .line 152
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    iget v1, p1, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    .line 153
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    sub-int/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 196
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/math/GridPoint2;->x:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/math/GridPoint2;->y:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
