.class public Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;
.super Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;
.source "RangedNumericValue.java"


# instance fields
.field private lowMax:F

.field private lowMin:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;-><init>()V

    return-void
.end method


# virtual methods
.method public getLowMax()F
    .locals 1

    .line 51
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMax:F

    return v0
.end method

.method public getLowMin()F
    .locals 1

    .line 43
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMin:F

    return v0
.end method

.method public load(Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;)V
    .locals 1

    .line 59
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V

    .line 60
    iget v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMax:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMax:F

    .line 61
    iget p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMin:F

    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMin:F

    return-void
.end method

.method public newLowValue()F
    .locals 3

    .line 29
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMin:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMax:F

    sub-float/2addr v1, v0

    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result v2

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method public read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 2

    .line 73
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;->read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V

    .line 74
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const-string v1, "lowMin"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMin:F

    .line 75
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    const-string v1, "lowMax"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMax:F

    return-void
.end method

.method public setLow(F)V
    .locals 0

    .line 33
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMin:F

    .line 34
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMax:F

    return-void
.end method

.method public setLow(FF)V
    .locals 0

    .line 38
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMin:F

    .line 39
    iput p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMax:F

    return-void
.end method

.method public setLowMax(F)V
    .locals 0

    .line 55
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMax:F

    return-void
.end method

.method public setLowMin(F)V
    .locals 0

    .line 47
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMin:F

    return-void
.end method

.method public write(Lcom/badlogic/gdx/utils/Json;)V
    .locals 2

    .line 66
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;->write(Lcom/badlogic/gdx/utils/Json;)V

    .line 67
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMin:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "lowMin"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 68
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->lowMax:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "lowMax"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
