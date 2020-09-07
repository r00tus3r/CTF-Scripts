.class public Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;
.super Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;
.source "TextureRegionDrawable.java"

# interfaces
.implements Lcom/badlogic/gdx/scenes/scene2d/utils/TransformDrawable;


# instance fields
.field private region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Texture;)V
    .locals 1

    .line 36
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;-><init>()V

    .line 37
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->setRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;-><init>()V

    .line 41
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->setRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V

    .line 46
    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->setRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    return-void
.end method


# virtual methods
.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V
    .locals 6

    .line 50
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-object v0, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFF)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFFFFFFF)V
    .locals 12

    move-object v0, p0

    .line 55
    iget-object v2, v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-object v1, p1

    move v3, p2

    move v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    invoke-interface/range {v1 .. v11}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFFFFFFF)V

    return-void
.end method

.method public getRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    return-object v0
.end method

.method public setRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 1

    .line 59
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    if-eqz p1, :cond_0

    .line 61
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->setMinWidth(F)V

    .line 62
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->setMinHeight(F)V

    :cond_0
    return-void
.end method

.method public tint(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    .locals 2

    .line 73
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    instance-of v1, v0, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    if-eqz v1, :cond_0

    .line 74
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasSprite;

    check-cast v0, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    invoke-direct {v1, v0}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasSprite;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;)V

    goto :goto_0

    .line 76
    :cond_0
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    invoke-direct {v1, v0}, Lcom/badlogic/gdx/graphics/g2d/Sprite;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 77
    :goto_0
    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 78
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->getMinWidth()F

    move-result p1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->getMinHeight()F

    move-result v0

    invoke-virtual {v1, p1, v0}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->setSize(FF)V

    .line 79
    new-instance p1, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;

    invoke-direct {p1, v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;-><init>(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V

    .line 80
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->getLeftWidth()F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;->setLeftWidth(F)V

    .line 81
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->getRightWidth()F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;->setRightWidth(F)V

    .line 82
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->getTopHeight()F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;->setTopHeight(F)V

    .line 83
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;->getBottomHeight()F

    move-result v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/SpriteDrawable;->setBottomHeight(F)V

    return-object p1
.end method
