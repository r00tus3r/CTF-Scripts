.class public Lbox2dLight/Spinor;
.super Ljava/lang/Object;
.source "Spinor.java"


# static fields
.field private static final COSINE_THRESHOLD:F = 0.001f


# instance fields
.field complex:F

.field real:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(F)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    invoke-virtual {p0, p1}, Lbox2dLight/Spinor;->set(F)Lbox2dLight/Spinor;

    return-void
.end method

.method public constructor <init>(FF)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    invoke-virtual {p0, p1, p2}, Lbox2dLight/Spinor;->set(FF)Lbox2dLight/Spinor;

    return-void
.end method

.method public constructor <init>(Lbox2dLight/Spinor;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-virtual {p0, p1}, Lbox2dLight/Spinor;->set(Lbox2dLight/Spinor;)Lbox2dLight/Spinor;

    return-void
.end method


# virtual methods
.method public add(F)Lbox2dLight/Spinor;
    .locals 6

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p1, v0

    .line 66
    iget v0, p0, Lbox2dLight/Spinor;->real:F

    float-to-double v0, v0

    float-to-double v2, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v0, v4

    double-to-float p1, v0

    iput p1, p0, Lbox2dLight/Spinor;->real:F

    .line 67
    iget p1, p0, Lbox2dLight/Spinor;->complex:F

    float-to-double v0, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v0, v2

    double-to-float p1, v0

    iput p1, p0, Lbox2dLight/Spinor;->complex:F

    return-object p0
.end method

.method public add(Lbox2dLight/Spinor;)Lbox2dLight/Spinor;
    .locals 2

    .line 59
    iget v0, p0, Lbox2dLight/Spinor;->real:F

    iget v1, p1, Lbox2dLight/Spinor;->real:F

    add-float/2addr v0, v1

    iput v0, p0, Lbox2dLight/Spinor;->real:F

    .line 60
    iget v0, p0, Lbox2dLight/Spinor;->complex:F

    iget p1, p1, Lbox2dLight/Spinor;->complex:F

    add-float/2addr v0, p1

    iput v0, p0, Lbox2dLight/Spinor;->complex:F

    return-object p0
.end method

.method public angle()F
    .locals 4

    .line 106
    iget v0, p0, Lbox2dLight/Spinor;->complex:F

    float-to-double v0, v0

    iget v2, p0, Lbox2dLight/Spinor;->real:F

    float-to-double v2, v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    double-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v0, v0, v1

    return v0
.end method

.method public invert()Lbox2dLight/Spinor;
    .locals 1

    .line 53
    iget v0, p0, Lbox2dLight/Spinor;->complex:F

    neg-float v0, v0

    iput v0, p0, Lbox2dLight/Spinor;->complex:F

    .line 54
    invoke-virtual {p0}, Lbox2dLight/Spinor;->len2()F

    move-result v0

    invoke-virtual {p0, v0}, Lbox2dLight/Spinor;->scale(F)Lbox2dLight/Spinor;

    return-object p0
.end method

.method public len()F
    .locals 2

    .line 85
    iget v0, p0, Lbox2dLight/Spinor;->real:F

    mul-float v0, v0, v0

    iget v1, p0, Lbox2dLight/Spinor;->complex:F

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

    .line 89
    iget v0, p0, Lbox2dLight/Spinor;->real:F

    mul-float v0, v0, v0

    iget v1, p0, Lbox2dLight/Spinor;->complex:F

    mul-float v1, v1, v1

    add-float/2addr v0, v1

    return v0
.end method

.method public lerp(Lbox2dLight/Spinor;FLbox2dLight/Spinor;)Lbox2dLight/Spinor;
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p2

    .line 110
    invoke-virtual {p0, v0}, Lbox2dLight/Spinor;->scale(F)Lbox2dLight/Spinor;

    .line 111
    invoke-virtual {p3, p1}, Lbox2dLight/Spinor;->set(Lbox2dLight/Spinor;)Lbox2dLight/Spinor;

    move-result-object p1

    invoke-virtual {p1, p2}, Lbox2dLight/Spinor;->scale(F)Lbox2dLight/Spinor;

    .line 112
    invoke-virtual {p0, p3}, Lbox2dLight/Spinor;->add(Lbox2dLight/Spinor;)Lbox2dLight/Spinor;

    .line 113
    invoke-virtual {p0}, Lbox2dLight/Spinor;->nor()Lbox2dLight/Spinor;

    return-object p0
.end method

.method public mul(Lbox2dLight/Spinor;)Lbox2dLight/Spinor;
    .locals 5

    .line 93
    iget v0, p0, Lbox2dLight/Spinor;->real:F

    iget v1, p1, Lbox2dLight/Spinor;->real:F

    mul-float v2, v0, v1

    iget v3, p0, Lbox2dLight/Spinor;->complex:F

    iget p1, p1, Lbox2dLight/Spinor;->complex:F

    mul-float v4, v3, p1

    sub-float/2addr v2, v4

    mul-float v0, v0, p1

    mul-float v3, v3, v1

    add-float/2addr v0, v3

    invoke-virtual {p0, v2, v0}, Lbox2dLight/Spinor;->set(FF)Lbox2dLight/Spinor;

    return-object p0
.end method

.method public nor()Lbox2dLight/Spinor;
    .locals 2

    .line 99
    invoke-virtual {p0}, Lbox2dLight/Spinor;->len()F

    move-result v0

    .line 100
    iget v1, p0, Lbox2dLight/Spinor;->real:F

    div-float/2addr v1, v0

    iput v1, p0, Lbox2dLight/Spinor;->real:F

    .line 101
    iget v1, p0, Lbox2dLight/Spinor;->complex:F

    div-float/2addr v1, v0

    iput v1, p0, Lbox2dLight/Spinor;->complex:F

    return-object p0
.end method

.method public scale(F)Lbox2dLight/Spinor;
    .locals 1

    .line 47
    iget v0, p0, Lbox2dLight/Spinor;->real:F

    mul-float v0, v0, p1

    iput v0, p0, Lbox2dLight/Spinor;->real:F

    .line 48
    iget v0, p0, Lbox2dLight/Spinor;->complex:F

    mul-float v0, v0, p1

    iput v0, p0, Lbox2dLight/Spinor;->complex:F

    return-object p0
.end method

.method public set(F)Lbox2dLight/Spinor;
    .locals 4

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p1, v0

    float-to-double v0, p1

    .line 30
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float p1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    invoke-virtual {p0, p1, v0}, Lbox2dLight/Spinor;->set(FF)Lbox2dLight/Spinor;

    return-object p0
.end method

.method public set(FF)Lbox2dLight/Spinor;
    .locals 0

    .line 40
    iput p1, p0, Lbox2dLight/Spinor;->real:F

    .line 41
    iput p2, p0, Lbox2dLight/Spinor;->complex:F

    return-object p0
.end method

.method public set(Lbox2dLight/Spinor;)Lbox2dLight/Spinor;
    .locals 1

    .line 35
    iget v0, p1, Lbox2dLight/Spinor;->real:F

    iget p1, p1, Lbox2dLight/Spinor;->complex:F

    invoke-virtual {p0, v0, p1}, Lbox2dLight/Spinor;->set(FF)Lbox2dLight/Spinor;

    return-object p0
.end method

.method public slerp(Lbox2dLight/Spinor;F)Lbox2dLight/Spinor;
    .locals 6

    .line 121
    iget v0, p0, Lbox2dLight/Spinor;->real:F

    iget v1, p1, Lbox2dLight/Spinor;->real:F

    mul-float v0, v0, v1

    iget v2, p0, Lbox2dLight/Spinor;->complex:F

    iget p1, p1, Lbox2dLight/Spinor;->complex:F

    mul-float v2, v2, p1

    add-float/2addr v0, v2

    const/4 v2, 0x0

    cmpg-float v2, v0, v2

    if-gez v2, :cond_0

    neg-float v0, v0

    neg-float p1, p1

    neg-float v1, v1

    :cond_0
    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v3, v2, v0

    const v4, 0x3a83126f    # 0.001f

    cmpl-float v3, v3, v4

    if-lez v3, :cond_1

    float-to-double v3, v0

    .line 135
    invoke-static {v3, v4}, Ljava/lang/Math;->acos(D)D

    move-result-wide v3

    double-to-float v0, v3

    float-to-double v3, v0

    .line 136
    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float v3, v3

    sub-float/2addr v2, p2

    mul-float v2, v2, v0

    float-to-double v4, v2

    .line 137
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v2, v4

    div-float/2addr v2, v3

    mul-float p2, p2, v0

    float-to-double v4, p2

    .line 138
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float p2, v4

    div-float/2addr p2, v3

    goto :goto_0

    :cond_1
    sub-float/2addr v2, p2

    .line 145
    :goto_0
    iget v0, p0, Lbox2dLight/Spinor;->complex:F

    mul-float v0, v0, v2

    mul-float p1, p1, p2

    add-float/2addr v0, p1

    iput v0, p0, Lbox2dLight/Spinor;->complex:F

    .line 146
    iget p1, p0, Lbox2dLight/Spinor;->real:F

    mul-float v2, v2, p1

    mul-float p2, p2, v1

    add-float/2addr v2, p2

    iput v2, p0, Lbox2dLight/Spinor;->real:F

    return-object p0
.end method

.method public sub(F)Lbox2dLight/Spinor;
    .locals 6

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p1, v0

    .line 79
    iget v0, p0, Lbox2dLight/Spinor;->real:F

    float-to-double v0, v0

    float-to-double v2, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v0, v4

    double-to-float p1, v0

    iput p1, p0, Lbox2dLight/Spinor;->real:F

    .line 80
    iget p1, p0, Lbox2dLight/Spinor;->complex:F

    float-to-double v0, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v0, v2

    double-to-float p1, v0

    iput p1, p0, Lbox2dLight/Spinor;->complex:F

    return-object p0
.end method

.method public sub(Lbox2dLight/Spinor;)Lbox2dLight/Spinor;
    .locals 2

    .line 72
    iget v0, p0, Lbox2dLight/Spinor;->real:F

    iget v1, p1, Lbox2dLight/Spinor;->real:F

    sub-float/2addr v0, v1

    iput v0, p0, Lbox2dLight/Spinor;->real:F

    .line 73
    iget v0, p0, Lbox2dLight/Spinor;->complex:F

    iget p1, p1, Lbox2dLight/Spinor;->complex:F

    sub-float/2addr v0, p1

    iput v0, p0, Lbox2dLight/Spinor;->complex:F

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 152
    new-instance v0, Lcom/badlogic/gdx/utils/StringBuilder;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>()V

    .line 153
    invoke-virtual {p0}, Lbox2dLight/Spinor;->angle()F

    move-result v1

    const-string v2, "radians: "

    .line 154
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 155
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(F)Lcom/badlogic/gdx/utils/StringBuilder;

    const-string v2, ", degrees: "

    .line 156
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    const v2, 0x42652ee0

    mul-float v1, v1, v2

    .line 157
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(F)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 158
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
