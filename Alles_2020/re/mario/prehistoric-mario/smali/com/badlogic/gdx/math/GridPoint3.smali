.class public Lcom/badlogic/gdx/math/GridPoint3;
.super Ljava/lang/Object;
.source "GridPoint3.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x522fd697dcb5173eL


# instance fields
.field public x:I

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(III)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    .line 42
    iput p2, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    .line 43
    iput p3, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/GridPoint3;)V
    .locals 1

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iget v0, p1, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    .line 51
    iget v0, p1, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    .line 52
    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    return-void
.end method


# virtual methods
.method public add(III)Lcom/badlogic/gdx/math/GridPoint3;
    .locals 1

    .line 155
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    .line 156
    iget p1, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    add-int/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    .line 157
    iget p1, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    return-object p0
.end method

.method public add(Lcom/badlogic/gdx/math/GridPoint3;)Lcom/badlogic/gdx/math/GridPoint3;
    .locals 2

    .line 140
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    iget v1, p1, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    .line 141
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    iget v1, p1, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    .line 142
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    return-object p0
.end method

.method public cpy()Lcom/badlogic/gdx/math/GridPoint3;
    .locals 1

    .line 193
    new-instance v0, Lcom/badlogic/gdx/math/GridPoint3;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/math/GridPoint3;-><init>(Lcom/badlogic/gdx/math/GridPoint3;)V

    return-object v0
.end method

.method public dst(III)F
    .locals 1

    .line 126
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    sub-int/2addr p1, v0

    .line 127
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    sub-int/2addr p2, v0

    .line 128
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    sub-int/2addr p3, v0

    mul-int p1, p1, p1

    mul-int p2, p2, p2

    add-int/2addr p1, p2

    mul-int p3, p3, p3

    add-int/2addr p1, p3

    int-to-double p1, p1

    .line 130
    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p1

    double-to-float p1, p1

    return p1
.end method

.method public dst(Lcom/badlogic/gdx/math/GridPoint3;)F
    .locals 3

    .line 112
    iget v0, p1, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    iget v1, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    sub-int/2addr v0, v1

    .line 113
    iget v1, p1, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    iget v2, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    sub-int/2addr v1, v2

    .line 114
    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    iget v2, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    sub-int/2addr p1, v2

    mul-int v0, v0, v0

    mul-int v1, v1, v1

    add-int/2addr v0, v1

    mul-int p1, p1, p1

    add-int/2addr v0, p1

    int-to-double v0, v0

    .line 116
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p1, v0

    return p1
.end method

.method public dst2(III)F
    .locals 1

    .line 100
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    sub-int/2addr p1, v0

    .line 101
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    sub-int/2addr p2, v0

    .line 102
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    sub-int/2addr p3, v0

    mul-int p1, p1, p1

    mul-int p2, p2, p2

    add-int/2addr p1, p2

    mul-int p3, p3, p3

    add-int/2addr p1, p3

    int-to-float p1, p1

    return p1
.end method

.method public dst2(Lcom/badlogic/gdx/math/GridPoint3;)F
    .locals 3

    .line 86
    iget v0, p1, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    iget v1, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    sub-int/2addr v0, v1

    .line 87
    iget v1, p1, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    iget v2, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    sub-int/2addr v1, v2

    .line 88
    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    iget v2, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    sub-int/2addr p1, v2

    mul-int v0, v0, v0

    mul-int v1, v1, v1

    add-int/2addr v0, v1

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

    .line 199
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 200
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/math/GridPoint3;

    .line 201
    iget v2, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    iget v3, p1, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    iget v3, p1, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint3;->z:I

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
    .locals 3

    .line 208
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    const/16 v1, 0x11

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x11

    .line 209
    iget v2, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x11

    .line 210
    iget v1, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    add-int/2addr v0, v1

    return v0
.end method

.method public set(III)Lcom/badlogic/gdx/math/GridPoint3;
    .locals 0

    .line 75
    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    .line 76
    iput p2, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    .line 77
    iput p3, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/math/GridPoint3;)Lcom/badlogic/gdx/math/GridPoint3;
    .locals 1

    .line 61
    iget v0, p1, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    .line 62
    iget v0, p1, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    .line 63
    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    return-object p0
.end method

.method public sub(III)Lcom/badlogic/gdx/math/GridPoint3;
    .locals 1

    .line 183
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    sub-int/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    .line 184
    iget p1, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    .line 185
    iget p1, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    sub-int/2addr p1, p3

    iput p1, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    return-object p0
.end method

.method public sub(Lcom/badlogic/gdx/math/GridPoint3;)Lcom/badlogic/gdx/math/GridPoint3;
    .locals 2

    .line 168
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    iget v1, p1, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    .line 169
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    iget v1, p1, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    .line 170
    iget v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    iget p1, p1, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    sub-int/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 216
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/math/GridPoint3;->x:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/badlogic/gdx/math/GridPoint3;->y:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/math/GridPoint3;->z:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
