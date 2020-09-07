.class public Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;
.super Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;
.source "ScaledNumericValue.java"


# instance fields
.field private highMax:F

.field private highMin:F

.field private relative:Z

.field private scaling:[F

.field public timeline:[F


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 25
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;-><init>()V

    const/4 v0, 0x1

    .line 26
    new-array v1, v0, [F

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    aput v3, v1, v2

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->scaling:[F

    .line 27
    new-array v0, v0, [F

    const/4 v1, 0x0

    aput v1, v0, v2

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->timeline:[F

    .line 29
    iput-boolean v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->relative:Z

    return-void
.end method


# virtual methods
.method public getHighMax()F
    .locals 1

    .line 54
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMax:F

    return v0
.end method

.method public getHighMin()F
    .locals 1

    .line 46
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMin:F

    return v0
.end method

.method public getScale(F)F
    .locals 5

    .line 87
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->timeline:[F

    array-length v0, v0

    const/4 v1, 0x1

    const/4 v2, 0x1

    :goto_0
    const/4 v3, -0x1

    if-ge v2, v0, :cond_1

    .line 91
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->timeline:[F

    aget v4, v4, v2

    cmpl-float v4, v4, p1

    if-lez v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, -0x1

    :goto_1
    if-ne v2, v3, :cond_2

    .line 97
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->scaling:[F

    sub-int/2addr v0, v1

    aget p1, p1, v0

    return p1

    :cond_2
    add-int/lit8 v0, v2, -0x1

    .line 99
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->scaling:[F

    aget v3, v1, v0

    .line 100
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->timeline:[F

    aget v0, v4, v0

    .line 101
    aget v1, v1, v2

    sub-float/2addr v1, v3

    sub-float/2addr p1, v0

    aget v2, v4, v2

    sub-float/2addr v2, v0

    div-float/2addr p1, v2

    mul-float v1, v1, p1

    add-float/2addr v3, v1

    return v3
.end method

.method public getScaling()[F
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->scaling:[F

    return-object v0
.end method

.method public getTimeline()[F
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->timeline:[F

    return-object v0
.end method

.method public isRelative()Z
    .locals 1

    .line 78
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->relative:Z

    return v0
.end method

.method public load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;)V
    .locals 4

    .line 105
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;)V

    .line 106
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMax:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMax:F

    .line 107
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMin:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMin:F

    .line 108
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->scaling:[F

    array-length v0, v0

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->scaling:[F

    .line 109
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->scaling:[F

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->scaling:[F

    array-length v2, v1

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 110
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->timeline:[F

    array-length v0, v0

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->timeline:[F

    .line 111
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->timeline:[F

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->timeline:[F

    array-length v2, v1

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 112
    iget-boolean p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->relative:Z

    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->relative:Z

    return-void
.end method

.method public newHighValue()F
    .locals 3

    .line 32
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMin:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMax:F

    sub-float/2addr v1, v0

    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result v2

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method public read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 2

    .line 127
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V

    .line 128
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const-string v1, "highMin"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMin:F

    .line 129
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const-string v1, "highMax"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMax:F

    .line 130
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const-string v1, "relative"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->relative:Z

    .line 131
    const-class v0, [F

    const-string v1, "scaling"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->scaling:[F

    .line 132
    const-class v0, [F

    const-string v1, "timeline"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [F

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->timeline:[F

    return-void
.end method

.method public setHigh(F)V
    .locals 0

    .line 36
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMin:F

    .line 37
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMax:F

    return-void
.end method

.method public setHigh(FF)V
    .locals 0

    .line 41
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMin:F

    .line 42
    iput p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMax:F

    return-void
.end method

.method public setHighMax(F)V
    .locals 0

    .line 58
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMax:F

    return-void
.end method

.method public setHighMin(F)V
    .locals 0

    .line 50
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMin:F

    return-void
.end method

.method public setRelative(Z)V
    .locals 0

    .line 82
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->relative:Z

    return-void
.end method

.method public setScaling([F)V
    .locals 0

    .line 66
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->scaling:[F

    return-void
.end method

.method public setTimeline([F)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->timeline:[F

    return-void
.end method

.method public write(Lcom/badlogic/gdx/utils/Json;)V
    .locals 2

    .line 117
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->write(Lcom/badlogic/gdx/utils/Json;)V

    .line 118
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMin:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "highMin"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 119
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->highMax:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "highMax"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 120
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->relative:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "relative"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 121
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->scaling:[F

    const-string v1, "scaling"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 122
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/ScaledNumericValue;->timeline:[F

    const-string v1, "timeline"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
