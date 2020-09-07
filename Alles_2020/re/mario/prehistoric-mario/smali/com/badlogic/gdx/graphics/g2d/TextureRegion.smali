.class public Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
.super Ljava/lang/Object;
.source "TextureRegion.java"


# instance fields
.field regionHeight:I

.field regionWidth:I

.field texture:Lcom/badlogic/gdx/graphics/Texture;

.field u:F

.field u2:F

.field v:F

.field v2:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture;)V
    .locals 2

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 38
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 39
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result p1

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v1, v0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setRegion(IIII)V

    return-void

    .line 37
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "texture cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture;FFFF)V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 58
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setRegion(FFFF)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture;II)V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    const/4 p1, 0x0

    .line 46
    invoke-virtual {p0, p1, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setRegion(IIII)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture;IIII)V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 53
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setRegion(IIII)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    invoke-virtual/range {p0 .. p5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V

    return-void
.end method

.method public static split(Lcom/badlogic/gdx/graphics/Texture;II)[[Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 1

    .line 285
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    .line 286
    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->split(II)[[Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public flip(ZZ)V
    .locals 1

    if-eqz p1, :cond_0

    .line 211
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 212
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 213
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    :cond_0
    if-eqz p2, :cond_1

    .line 216
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 217
    iget p2, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 218
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    :cond_1
    return-void
.end method

.method public getRegionHeight()I
    .locals 1

    .line 198
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionHeight:I

    return v0
.end method

.method public getRegionWidth()I
    .locals 1

    .line 185
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionWidth:I

    return v0
.end method

.method public getRegionX()I
    .locals 2

    .line 168
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float v0, v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method public getRegionY()I
    .locals 2

    .line 176
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float v0, v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method public getTexture()Lcom/badlogic/gdx/graphics/Texture;
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    return-object v0
.end method

.method public getU()F
    .locals 1

    .line 132
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    return v0
.end method

.method public getU2()F
    .locals 1

    .line 150
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    return v0
.end method

.method public getV()F
    .locals 1

    .line 141
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    return v0
.end method

.method public getV2()F
    .locals 1

    .line 159
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    return v0
.end method

.method public isFlipX()Z
    .locals 2

    .line 223
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFlipY()Z
    .locals 2

    .line 227
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public scroll(FF)V
    .locals 4

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    cmpl-float v2, p1, v1

    if-eqz v2, :cond_0

    .line 236
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    sub-float/2addr v2, v3

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float v2, v2, v3

    .line 237
    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    add-float/2addr v3, p1

    rem-float/2addr v3, v0

    iput v3, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 238
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    add-float/2addr p1, v2

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    :cond_0
    cmpl-float p1, p2, v1

    if-eqz p1, :cond_1

    .line 241
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    sub-float/2addr p1, v1

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v1

    int-to-float v1, v1

    mul-float p1, p1, v1

    .line 242
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    add-float/2addr v1, p2

    rem-float/2addr v1, v0

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 243
    iget p2, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p1, v0

    add-float/2addr p2, p1

    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    :cond_1
    return-void
.end method

.method public setRegion(FFFF)V
    .locals 4

    .line 91
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v1

    sub-float v2, p3, p1

    .line 92
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    int-to-float v0, v0

    mul-float v2, v2, v0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionWidth:I

    sub-float v2, p4, p2

    .line 93
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    int-to-float v1, v1

    mul-float v2, v2, v1

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionHeight:I

    .line 96
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionWidth:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionHeight:I

    if-ne v2, v3, :cond_0

    const/high16 v2, 0x3e800000    # 0.25f

    div-float v0, v2, v0

    add-float/2addr p1, v0

    sub-float/2addr p3, v0

    div-float/2addr v2, v1

    add-float/2addr p2, v2

    sub-float/2addr p4, v2

    .line 105
    :cond_0
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 106
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 107
    iput p3, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 108
    iput p4, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    return-void
.end method

.method public setRegion(IIII)V
    .locals 4

    .line 83
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    div-float v0, v1, v0

    .line 84
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    int-to-float v2, p1

    mul-float v2, v2, v0

    int-to-float v3, p2

    mul-float v3, v3, v1

    add-int/2addr p1, p3

    int-to-float p1, p1

    mul-float p1, p1, v0

    add-int/2addr p2, p4

    int-to-float p2, p2

    mul-float p2, p2, v1

    .line 85
    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setRegion(FFFF)V

    .line 86
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionWidth:I

    .line 87
    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionHeight:I

    return-void
.end method

.method public setRegion(Lcom/badlogic/gdx/graphics/Texture;)V
    .locals 2

    .line 76
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 77
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result p1

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v1, v0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setRegion(IIII)V

    return-void
.end method

.method public setRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 3

    .line 113
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 114
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    iget v2, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setRegion(FFFF)V

    return-void
.end method

.method public setRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IIII)V
    .locals 1

    .line 119
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 120
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionX()I

    move-result v0

    add-int/2addr v0, p2

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionY()I

    move-result p1

    add-int/2addr p1, p3

    invoke-virtual {p0, v0, p1, p4, p5}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setRegion(IIII)V

    return-void
.end method

.method public setRegionHeight(I)V
    .locals 2

    .line 202
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->isFlipY()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 203
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    int-to-float p1, p1

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr p1, v1

    add-float/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setV(F)V

    goto :goto_0

    .line 205
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    int-to-float p1, p1

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr p1, v1

    add-float/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setV2(F)V

    :goto_0
    return-void
.end method

.method public setRegionWidth(I)V
    .locals 2

    .line 189
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->isFlipX()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    int-to-float p1, p1

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr p1, v1

    add-float/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setU(F)V

    goto :goto_0

    .line 192
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    int-to-float p1, p1

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr p1, v1

    add-float/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setU2(F)V

    :goto_0
    return-void
.end method

.method public setRegionX(I)V
    .locals 1

    int-to-float p1, p1

    .line 172
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setU(F)V

    return-void
.end method

.method public setRegionY(I)V
    .locals 1

    int-to-float p1, p1

    .line 180
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->setV(F)V

    return-void
.end method

.method public setTexture(Lcom/badlogic/gdx/graphics/Texture;)V
    .locals 0

    .line 128
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    return-void
.end method

.method public setU(F)V
    .locals 1

    .line 136
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    .line 137
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float p1, p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionWidth:I

    return-void
.end method

.method public setU2(F)V
    .locals 1

    .line 154
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    .line 155
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float p1, p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionWidth:I

    return-void
.end method

.method public setV(F)V
    .locals 1

    .line 145
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 146
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v0

    int-to-float v0, v0

    mul-float p1, p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionHeight:I

    return-void
.end method

.method public setV2(F)V
    .locals 1

    .line 163
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    .line 164
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    sub-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v0

    int-to-float v0, v0

    mul-float p1, p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionHeight:I

    return-void
.end method

.method public split(II)[[Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 18

    move-object/from16 v0, p0

    .line 256
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionX()I

    move-result v7

    .line 257
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionY()I

    move-result v1

    .line 258
    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionWidth:I

    .line 259
    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionHeight:I

    .line 261
    div-int v8, v3, p2

    .line 262
    div-int v9, v2, p1

    .line 265
    filled-new-array {v8, v9}, [I

    move-result-object v2

    const-class v3, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    move-object v10, v2

    check-cast v10, [[Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    const/4 v11, 0x0

    move v13, v1

    const/4 v12, 0x0

    :goto_0
    if-ge v12, v8, :cond_1

    move v15, v7

    const/4 v14, 0x0

    :goto_1
    if-ge v14, v9, :cond_0

    .line 269
    aget-object v16, v10, v12

    new-instance v17, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->texture:Lcom/badlogic/gdx/graphics/Texture;

    move-object/from16 v1, v17

    move v3, v15

    move v4, v13

    move/from16 v5, p1

    move/from16 v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/Texture;IIII)V

    aput-object v17, v16, v14

    add-int/lit8 v14, v14, 0x1

    add-int v15, v15, p1

    goto :goto_1

    :cond_0
    add-int/lit8 v12, v12, 0x1

    add-int v13, v13, p2

    goto :goto_0

    :cond_1
    return-object v10
.end method
