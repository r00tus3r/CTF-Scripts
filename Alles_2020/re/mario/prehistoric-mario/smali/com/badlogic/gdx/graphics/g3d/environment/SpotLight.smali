.class public Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
.super Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;
.source "SpotLight.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight<",
        "Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;",
        ">;"
    }
.end annotation


# instance fields
.field public cutoffAngle:F

.field public final direction:Lcom/badlogic/gdx/math/Vector3;

.field public exponent:F

.field public intensity:F

.field public final position:Lcom/badlogic/gdx/math/Vector3;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;-><init>()V

    .line 26
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->position:Lcom/badlogic/gdx/math/Vector3;

    .line 27
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method


# virtual methods
.method public equals(Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;)Z
    .locals 2

    if-eqz p1, :cond_1

    if-eq p1, p0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->color:Lcom/badlogic/gdx/graphics/Color;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/Color;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->position:Lcom/badlogic/gdx/math/Vector3;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    .line 127
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->intensity:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->intensity:F

    invoke-static {v0, v1}, Lcom/badlogic/gdx/math/MathUtils;->isEqual(FF)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->cutoffAngle:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->cutoffAngle:F

    invoke-static {v0, v1}, Lcom/badlogic/gdx/math/MathUtils;->isEqual(FF)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->exponent:F

    iget p1, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->exponent:F

    .line 128
    invoke-static {v0, p1}, Lcom/badlogic/gdx/math/MathUtils;->isEqual(FF)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 122
    instance-of v0, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->equals(Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public set(FFFFFFFFFFFF)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
    .locals 2

    .line 106
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->color:Lcom/badlogic/gdx/graphics/Color;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    .line 107
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p4, p5, p6}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 108
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p7, p8, p9}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 109
    iput p10, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->intensity:F

    .line 110
    iput p11, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->cutoffAngle:F

    .line 111
    iput p12, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->exponent:F

    return-object p0
.end method

.method public set(FFFLcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;FFF)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
    .locals 2

    .line 84
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->color:Lcom/badlogic/gdx/graphics/Color;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    if-eqz p4, :cond_0

    .line 85
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p4}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    :cond_0
    if-eqz p5, :cond_1

    .line 86
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p5}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 87
    :cond_1
    iput p6, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->intensity:F

    .line 88
    iput p7, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->cutoffAngle:F

    .line 89
    iput p8, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->exponent:F

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/graphics/Color;FFFFFFFFF)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
    .locals 1

    if-eqz p1, :cond_0

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    .line 96
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2, p3, p4}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 97
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p5, p6, p7}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 98
    iput p8, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->intensity:F

    .line 99
    iput p9, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->cutoffAngle:F

    .line 100
    iput p10, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->exponent:F

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;FFF)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
    .locals 1

    if-eqz p1, :cond_0

    .line 73
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    :cond_0
    if-eqz p2, :cond_1

    .line 74
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    :cond_1
    if-eqz p3, :cond_2

    .line 75
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 76
    :cond_2
    iput p4, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->intensity:F

    .line 77
    iput p5, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->cutoffAngle:F

    .line 78
    iput p6, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->exponent:F

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
    .locals 7

    .line 68
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->color:Lcom/badlogic/gdx/graphics/Color;

    iget-object v2, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->position:Lcom/badlogic/gdx/math/Vector3;

    iget-object v3, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    iget v4, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->intensity:F

    iget v5, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->cutoffAngle:F

    iget v6, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->exponent:F

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->set(Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;FFF)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;

    move-result-object p1

    return-object p1
.end method

.method public setCutoffAngle(F)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
    .locals 0

    .line 58
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->cutoffAngle:F

    return-object p0
.end method

.method public setDirection(FFF)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    return-object p0
.end method

.method public setDirection(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    return-object p0
.end method

.method public setExponent(F)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
    .locals 0

    .line 63
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->exponent:F

    return-object p0
.end method

.method public setIntensity(F)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
    .locals 0

    .line 53
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->intensity:F

    return-object p0
.end method

.method public setPosition(FFF)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    return-object p0
.end method

.method public setPosition(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    return-object p0
.end method

.method public setTarget(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Vector3;->sub(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    return-object p0
.end method
