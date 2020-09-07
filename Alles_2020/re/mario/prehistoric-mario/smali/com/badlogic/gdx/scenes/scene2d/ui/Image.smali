.class public Lcom/badlogic/gdx/scenes/scene2d/ui/Image;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;
.source "Image.java"


# instance fields
.field private align:I

.field private drawable:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

.field private imageHeight:F

.field private imageWidth:F

.field private imageX:F

.field private imageY:F

.field private scaling:Lcom/badlogic/gdx/utils/Scaling;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 43
    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture;)V
    .locals 2

    .line 60
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;

    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-direct {v1, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/NinePatch;)V
    .locals 2

    .line 49
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;-><init>(Lcom/badlogic/gdx/graphics/g2d/NinePatch;)V

    sget-object p1, Lcom/badlogic/gdx/utils/Scaling;->stretch:Lcom/badlogic/gdx/utils/Scaling;

    const/4 v1, 0x1

    invoke-direct {p0, v0, p1, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/utils/Scaling;I)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 2

    .line 55
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    sget-object p1, Lcom/badlogic/gdx/utils/Scaling;->stretch:Lcom/badlogic/gdx/utils/Scaling;

    const/4 v1, 0x1

    invoke-direct {p0, v0, p1, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/utils/Scaling;I)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V
    .locals 1

    .line 65
    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->getDrawable(Ljava/lang/String;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object p1

    sget-object p2, Lcom/badlogic/gdx/utils/Scaling;->stretch:Lcom/badlogic/gdx/utils/Scaling;

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/utils/Scaling;I)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V
    .locals 2

    .line 71
    sget-object v0, Lcom/badlogic/gdx/utils/Scaling;->stretch:Lcom/badlogic/gdx/utils/Scaling;

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/utils/Scaling;I)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/utils/Scaling;)V
    .locals 1

    const/4 v0, 0x1

    .line 77
    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/utils/Scaling;I)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;Lcom/badlogic/gdx/utils/Scaling;I)V
    .locals 1

    .line 81
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;-><init>()V

    const/4 v0, 0x1

    .line 37
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->align:I

    .line 82
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->setDrawable(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V

    .line 83
    iput-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->scaling:Lcom/badlogic/gdx/utils/Scaling;

    .line 84
    iput p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->align:I

    .line 85
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getPrefWidth()F

    move-result p1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getPrefHeight()F

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->setSize(FF)V

    return-void
.end method


# virtual methods
.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 16

    move-object/from16 v0, p0

    .line 116
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->validate()V

    .line 118
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v1

    .line 119
    iget v2, v1, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v3, v1, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v4, v1, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v1, v1, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v1, v1, p2

    move-object/from16 v6, p1

    invoke-interface {v6, v2, v3, v4, v1}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setColor(FFFF)V

    .line 121
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getX()F

    move-result v1

    .line 122
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getY()F

    move-result v2

    .line 123
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getScaleX()F

    move-result v13

    .line 124
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getScaleY()F

    move-result v14

    .line 126
    iget-object v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->drawable:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    instance-of v3, v3, Lcom/badlogic/gdx/scenes/scene2d/utils/TransformDrawable;

    if-eqz v3, :cond_1

    .line 127
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getRotation()F

    move-result v15

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v4, v13, v3

    if-nez v4, :cond_0

    cmpl-float v3, v14, v3

    if-nez v3, :cond_0

    const/4 v3, 0x0

    cmpl-float v3, v15, v3

    if-eqz v3, :cond_1

    .line 129
    :cond_0
    iget-object v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->drawable:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-object v5, v3

    check-cast v5, Lcom/badlogic/gdx/scenes/scene2d/utils/TransformDrawable;

    iget v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageX:F

    add-float v7, v1, v3

    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageY:F

    add-float v8, v2, v1

    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getOriginX()F

    move-result v1

    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageX:F

    sub-float v9, v1, v2

    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getOriginY()F

    move-result v1

    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageY:F

    sub-float v10, v1, v2

    iget v11, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageWidth:F

    iget v12, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageHeight:F

    move-object/from16 v6, p1

    invoke-interface/range {v5 .. v15}, Lcom/badlogic/gdx/scenes/scene2d/utils/TransformDrawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFFFFFFF)V

    return-void

    .line 134
    :cond_1
    iget-object v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->drawable:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v5, :cond_2

    iget v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageX:F

    add-float v7, v1, v3

    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageY:F

    add-float v8, v2, v1

    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageWidth:F

    mul-float v9, v1, v13

    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageHeight:F

    mul-float v10, v1, v14

    move-object/from16 v6, p1

    invoke-interface/range {v5 .. v10}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    :cond_2
    return-void
.end method

.method public getDrawable()Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->drawable:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    return-object v0
.end method

.method public getImageHeight()F
    .locals 1

    .line 200
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageHeight:F

    return v0
.end method

.method public getImageWidth()F
    .locals 1

    .line 196
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageWidth:F

    return v0
.end method

.method public getImageX()F
    .locals 1

    .line 188
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageX:F

    return v0
.end method

.method public getImageY()F
    .locals 1

    .line 192
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageY:F

    return v0
.end method

.method public getMinHeight()F
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getMinWidth()F
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getPrefHeight()F
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->drawable:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getPrefWidth()F
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->drawable:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public layout()V
    .locals 6

    .line 89
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->drawable:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-nez v0, :cond_0

    return-void

    .line 91
    :cond_0
    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v0

    .line 92
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->drawable:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v1

    .line 93
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getWidth()F

    move-result v2

    .line 94
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getHeight()F

    move-result v3

    .line 96
    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->scaling:Lcom/badlogic/gdx/utils/Scaling;

    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/badlogic/gdx/utils/Scaling;->apply(FFFF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    .line 97
    iget v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageWidth:F

    .line 98
    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageHeight:F

    .line 100
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->align:I

    and-int/lit8 v1, v0, 0x8

    const/4 v4, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    if-eqz v1, :cond_1

    .line 101
    iput v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageX:F

    goto :goto_0

    :cond_1
    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_2

    .line 103
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageWidth:F

    sub-float/2addr v2, v0

    float-to-int v0, v2

    int-to-float v0, v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageX:F

    goto :goto_0

    :cond_2
    div-float/2addr v2, v5

    .line 105
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageWidth:F

    div-float/2addr v0, v5

    sub-float/2addr v2, v0

    float-to-int v0, v2

    int-to-float v0, v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageX:F

    .line 107
    :goto_0
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->align:I

    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_3

    .line 108
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageHeight:F

    sub-float/2addr v3, v0

    float-to-int v0, v3

    int-to-float v0, v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageY:F

    goto :goto_1

    :cond_3
    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_4

    .line 110
    iput v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageY:F

    goto :goto_1

    :cond_4
    div-float/2addr v3, v5

    .line 112
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageHeight:F

    div-float/2addr v0, v5

    sub-float/2addr v3, v0

    float-to-int v0, v3

    int-to-float v0, v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->imageY:F

    :goto_1
    return-void
.end method

.method public setAlign(I)V
    .locals 0

    .line 165
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->align:I

    .line 166
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->invalidate()V

    return-void
.end method

.method public setDrawable(Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V
    .locals 0

    .line 138
    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->getDrawable(Ljava/lang/String;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->setDrawable(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V

    return-void
.end method

.method public setDrawable(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V
    .locals 2

    .line 145
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->drawable:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_2

    .line 147
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getPrefWidth()F

    move-result v0

    invoke-interface {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v1

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getPrefHeight()F

    move-result v0

    invoke-interface {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v1

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_3

    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->invalidateHierarchy()V

    goto :goto_0

    .line 149
    :cond_2
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->invalidateHierarchy()V

    .line 150
    :cond_3
    :goto_0
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->drawable:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    return-void
.end method

.method public setScaling(Lcom/badlogic/gdx/utils/Scaling;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 160
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->scaling:Lcom/badlogic/gdx/utils/Scaling;

    .line 161
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->invalidate()V

    return-void

    .line 159
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "scaling cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 204
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 206
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2e

    .line 207
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    add-int/lit8 v1, v1, 0x1

    .line 208
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 209
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x24

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-eq v3, v2, :cond_2

    const-string v2, "Image "

    goto :goto_0

    :cond_2
    const-string v2, ""

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ": "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Image;->drawable:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
