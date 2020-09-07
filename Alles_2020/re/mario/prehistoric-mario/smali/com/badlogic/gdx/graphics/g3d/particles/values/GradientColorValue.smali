.class public Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;
.super Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;
.source "GradientColorValue.java"


# static fields
.field private static temp:[F


# instance fields
.field private colors:[F

.field public timeline:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x3

    .line 25
    new-array v0, v0, [F

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->temp:[F

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 24
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;-><init>()V

    const/4 v0, 0x3

    .line 27
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->colors:[F

    const/4 v0, 0x1

    .line 28
    new-array v0, v0, [F

    const/4 v1, 0x0

    const/4 v2, 0x0

    aput v2, v0, v1

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->timeline:[F

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public getColor(F[FI)V
    .locals 9

    .line 53
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->timeline:[F

    .line 54
    array-length v1, v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    :goto_0
    const/4 v4, -0x1

    if-ge v3, v1, :cond_1

    .line 56
    aget v5, v0, v3

    cmpl-float v5, v5, p1

    if-lez v5, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v3, 0x1

    move v8, v3

    move v3, v2

    move v2, v8

    goto :goto_0

    :cond_1
    const/4 v3, -0x1

    .line 63
    :goto_1
    aget v1, v0, v2

    mul-int/lit8 v2, v2, 0x3

    .line 65
    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->colors:[F

    aget v6, v5, v2

    add-int/lit8 v7, v2, 0x1

    .line 66
    aget v7, v5, v7

    add-int/lit8 v2, v2, 0x2

    .line 67
    aget v2, v5, v2

    if-ne v3, v4, :cond_2

    .line 69
    aput v6, p2, p3

    add-int/lit8 p1, p3, 0x1

    .line 70
    aput v7, p2, p1

    add-int/lit8 p3, p3, 0x2

    .line 71
    aput v2, p2, p3

    return-void

    :cond_2
    sub-float/2addr p1, v1

    .line 74
    aget v0, v0, v3

    sub-float/2addr v0, v1

    div-float/2addr p1, v0

    mul-int/lit8 v3, v3, 0x3

    .line 76
    aget v0, v5, v3

    sub-float/2addr v0, v6

    mul-float v0, v0, p1

    add-float/2addr v6, v0

    aput v6, p2, p3

    add-int/lit8 v0, p3, 0x1

    add-int/lit8 v1, v3, 0x1

    .line 77
    aget v1, v5, v1

    sub-float/2addr v1, v7

    mul-float v1, v1, p1

    add-float/2addr v7, v1

    aput v7, p2, v0

    add-int/lit8 p3, p3, 0x2

    add-int/lit8 v3, v3, 0x2

    .line 78
    aget v0, v5, v3

    sub-float/2addr v0, v2

    mul-float v0, v0, p1

    add-float/2addr v2, v0

    aput v2, p2, p3

    return-void
.end method

.method public getColor(F)[F
    .locals 2

    .line 47
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->temp:[F

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->getColor(F[FI)V

    .line 48
    sget-object p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->temp:[F

    return-object p1
.end method

.method public getColors()[F
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->colors:[F

    return-object v0
.end method

.method public getTimeline()[F
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->timeline:[F

    return-object v0
.end method

.method public load(Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;)V
    .locals 4

    .line 96
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V

    .line 97
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->colors:[F

    array-length v0, v0

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->colors:[F

    .line 98
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->colors:[F

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->colors:[F

    array-length v2, v1

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 99
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->timeline:[F

    array-length v0, v0

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->timeline:[F

    .line 100
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->timeline:[F

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->timeline:[F

    array-length v1, v0

    invoke-static {p1, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 2

    .line 90
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;->read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V

    .line 91
    const-class v0, [F

    const-string v1, "colors"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->colors:[F

    .line 92
    const-class v0, [F

    const-string v1, "timeline"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [F

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->timeline:[F

    return-void
.end method

.method public setColors([F)V
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->colors:[F

    return-void
.end method

.method public setTimeline([F)V
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->timeline:[F

    return-void
.end method

.method public write(Lcom/badlogic/gdx/utils/Json;)V
    .locals 2

    .line 83
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;->write(Lcom/badlogic/gdx/utils/Json;)V

    .line 84
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->colors:[F

    const-string v1, "colors"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 85
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/GradientColorValue;->timeline:[F

    const-string v1, "timeline"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
