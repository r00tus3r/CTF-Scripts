.class public Lcom/badlogic/gdx/math/Ellipse;
.super Ljava/lang/Object;
.source "Ellipse.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Lcom/badlogic/gdx/math/Shape2D;


# static fields
.field private static final serialVersionUID:J = 0x66707957a1178663L


# instance fields
.field public height:F

.field public width:F

.field public x:F

.field public y:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    .line 56
    iput p2, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    .line 57
    iput p3, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    .line 58
    iput p4, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Circle;)V
    .locals 2

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iget v0, p1, Lcom/badlogic/gdx/math/Circle;->x:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    .line 85
    iget v0, p1, Lcom/badlogic/gdx/math/Circle;->y:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    .line 86
    iget v0, p1, Lcom/badlogic/gdx/math/Circle;->radius:F

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v0, v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    .line 87
    iget p1, p1, Lcom/badlogic/gdx/math/Circle;->radius:F

    mul-float p1, p1, v1

    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Ellipse;)V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iget v0, p1, Lcom/badlogic/gdx/math/Ellipse;->x:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    .line 43
    iget v0, p1, Lcom/badlogic/gdx/math/Ellipse;->y:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    .line 44
    iget v0, p1, Lcom/badlogic/gdx/math/Ellipse;->width:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    .line 45
    iget p1, p1, Lcom/badlogic/gdx/math/Ellipse;->height:F

    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Vector2;FF)V
    .locals 1

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    .line 68
    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    .line 69
    iput p2, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    .line 70
    iput p3, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V
    .locals 1

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    .line 75
    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    .line 76
    iget p1, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    .line 77
    iget p1, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    return-void
.end method


# virtual methods
.method public area()F
    .locals 2

    .line 183
    iget v0, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    iget v1, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    mul-float v0, v0, v1

    const v1, 0x40490fdb    # (float)Math.PI

    mul-float v0, v0, v1

    const/high16 v1, 0x40800000    # 4.0f

    div-float/2addr v0, v1

    return v0
.end method

.method public circumference()F
    .locals 9

    .line 191
    iget v0, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 192
    iget v2, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    div-float/2addr v2, v1

    const/high16 v3, 0x40400000    # 3.0f

    mul-float v4, v0, v3

    cmpl-float v5, v4, v2

    if-gtz v5, :cond_1

    mul-float v5, v2, v3

    cmpl-float v5, v5, v0

    if-lez v5, :cond_0

    goto :goto_0

    :cond_0
    const-wide v3, 0x401921fb60000000L    # 6.2831854820251465

    mul-float v0, v0, v0

    mul-float v2, v2, v2

    add-float/2addr v0, v2

    div-float/2addr v0, v1

    float-to-double v0, v0

    .line 198
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    mul-double v0, v0, v3

    double-to-float v0, v0

    return v0

    :cond_1
    :goto_0
    const-wide v5, 0x400921fb60000000L    # 3.1415927410125732

    add-float v1, v0, v2

    mul-float v1, v1, v3

    float-to-double v7, v1

    add-float/2addr v4, v2

    mul-float v2, v2, v3

    add-float/2addr v0, v2

    mul-float v4, v4, v0

    float-to-double v0, v4

    .line 195
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v7, v0

    mul-double v7, v7, v5

    double-to-float v0, v7

    return v0
.end method

.method public contains(FF)Z
    .locals 3

    .line 97
    iget v0, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    sub-float/2addr p1, v0

    .line 98
    iget v0, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    sub-float/2addr p2, v0

    mul-float p1, p1, p1

    .line 100
    iget v0, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float v2, v0, v1

    mul-float v2, v2, v0

    mul-float v2, v2, v1

    div-float/2addr p1, v2

    mul-float p2, p2, p2

    iget v0, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    mul-float v2, v0, v1

    mul-float v2, v2, v0

    mul-float v2, v2, v1

    div-float/2addr p2, v2

    add-float/2addr p1, p2

    const/high16 p2, 0x3f800000    # 1.0f

    cmpg-float p1, p1, p2

    if-gtz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public contains(Lcom/badlogic/gdx/math/Vector2;)Z
    .locals 1

    .line 109
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/math/Ellipse;->contains(FF)Z

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 205
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 206
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/math/Ellipse;

    .line 207
    iget v2, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    iget v3, p1, Lcom/badlogic/gdx/math/Ellipse;->x:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_2

    iget v2, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    iget v3, p1, Lcom/badlogic/gdx/math/Ellipse;->y:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_2

    iget v2, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    iget v3, p1, Lcom/badlogic/gdx/math/Ellipse;->width:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_2

    iget v2, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    iget p1, p1, Lcom/badlogic/gdx/math/Ellipse;->height:F

    cmpl-float p1, v2, p1

    if-nez p1, :cond_2

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

    .line 214
    iget v0, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    invoke-static {v0}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v0

    const/16 v1, 0x35

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x35

    .line 215
    iget v2, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    invoke-static {v2}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x35

    .line 216
    iget v2, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    invoke-static {v2}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x35

    .line 217
    iget v1, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    invoke-static {v1}, Lcom/badlogic/gdx/utils/NumberUtils;->floatToRawIntBits(F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public set(FFFF)V
    .locals 0

    .line 119
    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    .line 120
    iput p2, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    .line 121
    iput p3, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    .line 122
    iput p4, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    return-void
.end method

.method public set(Lcom/badlogic/gdx/math/Circle;)V
    .locals 2

    .line 136
    iget v0, p1, Lcom/badlogic/gdx/math/Circle;->x:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    .line 137
    iget v0, p1, Lcom/badlogic/gdx/math/Circle;->y:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    .line 138
    iget v0, p1, Lcom/badlogic/gdx/math/Circle;->radius:F

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v0, v0, v1

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    .line 139
    iget p1, p1, Lcom/badlogic/gdx/math/Circle;->radius:F

    mul-float p1, p1, v1

    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    return-void
.end method

.method public set(Lcom/badlogic/gdx/math/Ellipse;)V
    .locals 1

    .line 129
    iget v0, p1, Lcom/badlogic/gdx/math/Ellipse;->x:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    .line 130
    iget v0, p1, Lcom/badlogic/gdx/math/Ellipse;->y:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    .line 131
    iget v0, p1, Lcom/badlogic/gdx/math/Ellipse;->width:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    .line 132
    iget p1, p1, Lcom/badlogic/gdx/math/Ellipse;->height:F

    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    return-void
.end method

.method public set(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V
    .locals 1

    .line 143
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    .line 144
    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    .line 145
    iget p1, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    .line 146
    iget p1, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    return-void
.end method

.method public setPosition(FF)Lcom/badlogic/gdx/math/Ellipse;
    .locals 0

    .line 164
    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    .line 165
    iput p2, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    return-object p0
.end method

.method public setPosition(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Ellipse;
    .locals 1

    .line 153
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iput v0, p0, Lcom/badlogic/gdx/math/Ellipse;->x:F

    .line 154
    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->y:F

    return-object p0
.end method

.method public setSize(FF)Lcom/badlogic/gdx/math/Ellipse;
    .locals 0

    .line 175
    iput p1, p0, Lcom/badlogic/gdx/math/Ellipse;->width:F

    .line 176
    iput p2, p0, Lcom/badlogic/gdx/math/Ellipse;->height:F

    return-object p0
.end method
