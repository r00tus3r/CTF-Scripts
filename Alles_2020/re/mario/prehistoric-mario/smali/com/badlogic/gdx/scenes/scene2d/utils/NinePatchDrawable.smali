.class public Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;
.super Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;
.source "NinePatchDrawable.java"

# interfaces
.implements Lcom/badlogic/gdx/scenes/scene2d/utils/TransformDrawable;


# instance fields
.field private patch:Lcom/badlogic/gdx/graphics/g2d/NinePatch;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/NinePatch;)V
    .locals 0

    .line 39
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;-><init>()V

    .line 40
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->setPatch(Lcom/badlogic/gdx/graphics/g2d/NinePatch;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V

    .line 45
    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->patch:Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->patch:Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    return-void
.end method


# virtual methods
.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V
    .locals 6

    .line 49
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->patch:Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFFFFFFF)V
    .locals 12

    move-object v0, p0

    .line 54
    iget-object v1, v0, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->patch:Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    invoke-virtual/range {v1 .. v11}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFFFFFFF)V

    return-void
.end method

.method public getPatch()Lcom/badlogic/gdx/graphics/g2d/NinePatch;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->patch:Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    return-object v0
.end method

.method public setPatch(Lcom/badlogic/gdx/graphics/g2d/NinePatch;)V
    .locals 1

    .line 60
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->patch:Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    .line 61
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getTotalWidth()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->setMinWidth(F)V

    .line 62
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getTotalHeight()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->setMinHeight(F)V

    .line 63
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getPadTop()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->setTopHeight(F)V

    .line 64
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getPadRight()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->setRightWidth(F)V

    .line 65
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getPadBottom()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->setBottomHeight(F)V

    .line 66
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;->getPadLeft()F

    move-result p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->setLeftWidth(F)V

    return-void
.end method

.method public tint(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;
    .locals 3

    .line 75
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;)V

    .line 76
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->getPatch()Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lcom/badlogic/gdx/graphics/g2d/NinePatch;-><init>(Lcom/badlogic/gdx/graphics/g2d/NinePatch;Lcom/badlogic/gdx/graphics/Color;)V

    iput-object v1, v0, Lcom/badlogic/gdx/scenes/scene2d/utils/NinePatchDrawable;->patch:Lcom/badlogic/gdx/graphics/g2d/NinePatch;

    return-object v0
.end method
