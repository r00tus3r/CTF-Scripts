.class public Lcom/badlogic/gdx/scenes/scene2d/ui/List;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;
.source "List.java"

# interfaces
.implements Lcom/badlogic/gdx/scenes/scene2d/utils/Cullable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;",
        "Lcom/badlogic/gdx/scenes/scene2d/utils/Cullable;"
    }
.end annotation


# instance fields
.field private alignment:I

.field private cullingArea:Lcom/badlogic/gdx/math/Rectangle;

.field itemHeight:F

.field final items:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation
.end field

.field private keyListener:Lcom/badlogic/gdx/scenes/scene2d/InputListener;

.field overIndex:I

.field private prefHeight:F

.field private prefWidth:F

.field pressedIndex:I

.field selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection<",
            "TT;>;"
        }
    .end annotation
.end field

.field style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

.field typeToSelect:Z


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;)V
    .locals 2

    .line 66
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;-><init>()V

    .line 48
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;-><init>(Lcom/badlogic/gdx/utils/Array;)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    const/16 v0, 0x8

    .line 53
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->alignment:I

    const/4 v0, -0x1

    .line 54
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->pressedIndex:I

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->overIndex:I

    .line 67
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->setActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 68
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->setRequired(Z)V

    .line 70
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;)V

    .line 71
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getPrefWidth()F

    move-result p1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getPrefHeight()F

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->setSize(FF)V

    .line 73
    new-instance p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List$1;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/List;)V

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->keyListener:Lcom/badlogic/gdx/scenes/scene2d/InputListener;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    .line 127
    new-instance p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List$2;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List$2;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/List;)V

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V
    .locals 1

    .line 59
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V
    .locals 1

    .line 63
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    invoke-virtual {p1, p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;)V

    return-void
.end method


# virtual methods
.method public clearItems()V
    .locals 1

    .line 372
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-nez v0, :cond_0

    return-void

    .line 373
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    const/4 v0, -0x1

    .line 374
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->overIndex:I

    .line 375
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->pressedIndex:I

    .line 376
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->clear()V

    .line 377
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->invalidateHierarchy()V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 27

    move-object/from16 v8, p0

    .line 200
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->validate()V

    .line 202
    invoke-virtual/range {p0 .. p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->drawBackground(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V

    .line 204
    iget-object v0, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v9, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    .line 205
    iget-object v0, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v10, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    .line 206
    iget-object v0, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v11, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->fontColorSelected:Lcom/badlogic/gdx/graphics/Color;

    .line 207
    iget-object v0, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v12, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->fontColorUnselected:Lcom/badlogic/gdx/graphics/Color;

    .line 209
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    .line 210
    iget v1, v0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v2, v0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, v0, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v0, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v0, v0, p2

    move-object/from16 v7, p1

    invoke-interface {v7, v1, v2, v3, v0}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setColor(FFFF)V

    .line 212
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getX()F

    move-result v0

    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getY()F

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getWidth()F

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getHeight()F

    move-result v2

    .line 215
    iget-object v3, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v3, v3, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v3, :cond_0

    .line 217
    invoke-interface {v3}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getLeftWidth()F

    move-result v4

    add-float/2addr v0, v4

    .line 219
    invoke-interface {v3}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getTopHeight()F

    move-result v5

    sub-float/2addr v2, v5

    .line 220
    invoke-interface {v3}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getRightWidth()F

    move-result v3

    add-float/2addr v4, v3

    sub-float/2addr v1, v4

    :cond_0
    move/from16 v21, v0

    move/from16 v20, v1

    .line 223
    invoke-interface {v10}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getLeftWidth()F

    move-result v22

    sub-float v0, v20, v22

    invoke-interface {v10}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getRightWidth()F

    move-result v1

    sub-float v23, v0, v1

    .line 224
    invoke-interface {v10}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getTopHeight()F

    move-result v0

    invoke-virtual {v9}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getDescent()F

    move-result v1

    sub-float v24, v0, v1

    .line 226
    iget v0, v12, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, v12, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, v12, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v4, v12, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v4, v4, p2

    invoke-virtual {v9, v0, v1, v3, v4}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->setColor(FFFF)V

    const/4 v0, 0x0

    move/from16 v25, v2

    const/4 v6, 0x0

    .line 227
    :goto_0
    iget-object v0, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v6, v0, :cond_9

    .line 228
    iget-object v0, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->cullingArea:Lcom/badlogic/gdx/math/Rectangle;

    if-eqz v0, :cond_3

    iget v1, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->itemHeight:F

    sub-float v1, v25, v1

    iget v0, v0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget-object v2, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->cullingArea:Lcom/badlogic/gdx/math/Rectangle;

    iget v2, v2, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v0, v2

    cmpg-float v0, v1, v0

    if-gtz v0, :cond_1

    iget-object v0, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->cullingArea:Lcom/badlogic/gdx/math/Rectangle;

    iget v0, v0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    cmpl-float v0, v25, v0

    if-ltz v0, :cond_1

    goto :goto_1

    .line 245
    :cond_1
    iget-object v0, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->cullingArea:Lcom/badlogic/gdx/math/Rectangle;

    iget v0, v0, Lcom/badlogic/gdx/math/Rectangle;->y:F

    cmpg-float v0, v25, v0

    if-gez v0, :cond_2

    goto/16 :goto_5

    :cond_2
    move v14, v6

    goto/16 :goto_4

    .line 229
    :cond_3
    :goto_1
    iget-object v0, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 230
    iget-object v0, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->contains(Ljava/lang/Object;)Z

    move-result v26

    const/4 v0, 0x0

    .line 232
    iget v1, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->pressedIndex:I

    if-ne v1, v6, :cond_4

    iget-object v1, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->down:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v1, :cond_4

    .line 233
    iget-object v0, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->down:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    goto :goto_2

    :cond_4
    if-eqz v26, :cond_5

    .line 236
    iget v0, v11, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, v11, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v2, v11, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v3, v11, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v3, v3, p2

    invoke-virtual {v9, v0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->setColor(FFFF)V

    move-object v13, v10

    goto :goto_3

    .line 237
    :cond_5
    iget v1, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->overIndex:I

    if-ne v1, v6, :cond_6

    iget-object v1, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->over:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v1, :cond_6

    .line 238
    iget-object v0, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->over:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    :cond_6
    :goto_2
    move-object v13, v0

    :goto_3
    if-eqz v13, :cond_7

    add-float v0, v19, v25

    .line 239
    iget v1, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->itemHeight:F

    sub-float v16, v0, v1

    move-object/from16 v14, p1

    move/from16 v15, v21

    move/from16 v17, v20

    move/from16 v18, v1

    invoke-interface/range {v13 .. v18}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    :cond_7
    add-float v5, v21, v22

    add-float v0, v19, v25

    sub-float v13, v0, v24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v2, v9

    move v3, v6

    move v14, v6

    move v6, v13

    move/from16 v7, v23

    .line 240
    invoke-virtual/range {v0 .. v7}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->drawItem(Lcom/badlogic/gdx/graphics/g2d/Batch;Lcom/badlogic/gdx/graphics/g2d/BitmapFont;ILjava/lang/Object;FFF)Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    if-eqz v26, :cond_8

    .line 242
    iget v0, v12, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, v12, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v2, v12, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v3, v12, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v3, v3, p2

    invoke-virtual {v9, v0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->setColor(FFFF)V

    .line 248
    :cond_8
    :goto_4
    iget v0, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->itemHeight:F

    sub-float v25, v25, v0

    add-int/lit8 v6, v14, 0x1

    move-object/from16 v7, p1

    goto/16 :goto_0

    :cond_9
    :goto_5
    return-void
.end method

.method protected drawBackground(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 6

    .line 254
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v0, :cond_0

    .line 255
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    .line 256
    iget v1, v0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v2, v0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, v0, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v0, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v0, v0, p2

    invoke-interface {p1, v1, v2, v3, v0}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setColor(FFFF)V

    .line 257
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v0, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getX()F

    move-result v2

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getY()F

    move-result v3

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getWidth()F

    move-result v4

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getHeight()F

    move-result v5

    move-object v1, p1

    invoke-interface/range {v0 .. v5}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    :cond_0
    return-void
.end method

.method protected drawItem(Lcom/badlogic/gdx/graphics/g2d/Batch;Lcom/badlogic/gdx/graphics/g2d/BitmapFont;ILjava/lang/Object;FFF)Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/g2d/Batch;",
            "Lcom/badlogic/gdx/graphics/g2d/BitmapFont;",
            "ITT;FFF)",
            "Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;"
        }
    .end annotation

    move-object v0, p0

    move-object/from16 v1, p4

    .line 262
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 263
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    iget v9, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->alignment:I

    const/4 v6, 0x0

    const/4 v10, 0x0

    const-string v11, "..."

    move-object v1, p2

    move-object v2, p1

    move/from16 v4, p5

    move/from16 v5, p6

    move/from16 v8, p7

    invoke-virtual/range {v1 .. v11}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;Ljava/lang/CharSequence;FFIIFIZLjava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    move-result-object v1

    return-object v1
.end method

.method public getCullingArea()Lcom/badlogic/gdx/math/Rectangle;
    .locals 1

    .line 410
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->cullingArea:Lcom/badlogic/gdx/math/Rectangle;

    return-object v0
.end method

.method public getItemAt(F)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)TT;"
        }
    .end annotation

    .line 320
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getItemIndexAt(F)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 322
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemHeight()F
    .locals 1

    .line 386
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->itemHeight:F

    return v0
.end method

.method public getItemIndexAt(F)I
    .locals 4

    .line 327
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getHeight()F

    move-result v0

    .line 328
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v1, :cond_0

    .line 330
    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getTopHeight()F

    move-result v2

    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getBottomHeight()F

    move-result v3

    add-float/2addr v2, v3

    sub-float/2addr v0, v2

    .line 331
    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getBottomHeight()F

    move-result v1

    sub-float/2addr p1, v1

    :cond_0
    sub-float/2addr v0, p1

    .line 333
    iget p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->itemHeight:F

    div-float/2addr v0, p1

    float-to-int p1, v0

    if-ltz p1, :cond_2

    .line 334
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lt p1, v0, :cond_1

    goto :goto_0

    :cond_1
    return p1

    :cond_2
    :goto_0
    const/4 p1, -0x1

    return p1
.end method

.method public getItems()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation

    .line 382
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public getKeyListener()Lcom/badlogic/gdx/scenes/scene2d/InputListener;
    .locals 1

    .line 424
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->keyListener:Lcom/badlogic/gdx/scenes/scene2d/InputListener;

    return-object v0
.end method

.method public getOverItem()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 310
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->overIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getPrefHeight()F
    .locals 1

    .line 395
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->validate()V

    .line 396
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->prefHeight:F

    return v0
.end method

.method public getPrefWidth()F
    .locals 1

    .line 390
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->validate()V

    .line 391
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->prefWidth:F

    return v0
.end method

.method public getPressedItem()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 315
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->pressedIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getSelected()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 276
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->first()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getSelectedIndex()I
    .locals 3

    .line 292
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->items()Lcom/badlogic/gdx/utils/OrderedSet;

    move-result-object v0

    .line 293
    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectSet;->size:I

    if-nez v1, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectSet;->first()Ljava/lang/Object;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/badlogic/gdx/utils/Array;->indexOf(Ljava/lang/Object;Z)I

    move-result v0

    :goto_0
    return v0
.end method

.method public getSelection()Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection<",
            "TT;>;"
        }
    .end annotation

    .line 267
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    return-object v0
.end method

.method public getStyle()Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    return-object v0
.end method

.method public layout()V
    .locals 7

    .line 174
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    .line 175
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    .line 177
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getCapHeight()F

    move-result v2

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getDescent()F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    mul-float v3, v3, v4

    sub-float/2addr v2, v3

    iput v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->itemHeight:F

    .line 178
    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->itemHeight:F

    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getTopHeight()F

    move-result v3

    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getBottomHeight()F

    move-result v4

    add-float/2addr v3, v4

    add-float/2addr v2, v3

    iput v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->itemHeight:F

    const/4 v2, 0x0

    .line 180
    iput v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->prefWidth:F

    .line 181
    const-class v2, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    invoke-static {v2}, Lcom/badlogic/gdx/utils/Pools;->get(Ljava/lang/Class;)Lcom/badlogic/gdx/utils/Pool;

    move-result-object v2

    .line 182
    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    const/4 v4, 0x0

    .line 183
    :goto_0
    iget-object v5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget v5, v5, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v4, v5, :cond_0

    .line 184
    iget-object v5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v5, v4}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v0, v5}, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->setText(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Ljava/lang/CharSequence;)V

    .line 185
    iget v5, v3, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->width:F

    iget v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->prefWidth:F

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v5

    iput v5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->prefWidth:F

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 187
    :cond_0
    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    .line 188
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->prefWidth:F

    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getLeftWidth()F

    move-result v2

    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getRightWidth()F

    move-result v1

    add-float/2addr v2, v1

    add-float/2addr v0, v2

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->prefWidth:F

    .line 189
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    int-to-float v0, v0

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->itemHeight:F

    mul-float v0, v0, v1

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->prefHeight:F

    .line 191
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v0, :cond_1

    .line 193
    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->prefWidth:F

    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getLeftWidth()F

    move-result v2

    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getRightWidth()F

    move-result v3

    add-float/2addr v2, v3

    add-float/2addr v1, v2

    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->prefWidth:F

    .line 194
    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->prefHeight:F

    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getTopHeight()F

    move-result v2

    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getBottomHeight()F

    move-result v0

    add-float/2addr v2, v0

    add-float/2addr v1, v2

    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->prefHeight:F

    :cond_1
    return-void
.end method

.method public setAlignment(I)V
    .locals 0

    .line 416
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->alignment:I

    return-void
.end method

.method public setCullingArea(Lcom/badlogic/gdx/math/Rectangle;)V
    .locals 0

    .line 404
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->cullingArea:Lcom/badlogic/gdx/math/Rectangle;

    return-void
.end method

.method public setItems(Lcom/badlogic/gdx/utils/Array;)V
    .locals 3

    if-eqz p1, :cond_3

    .line 357
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getPrefWidth()F

    move-result v0

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getPrefHeight()F

    move-result v1

    .line 359
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    if-eq p1, v2, :cond_0

    .line 360
    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 361
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, p1}, Lcom/badlogic/gdx/utils/Array;->addAll(Lcom/badlogic/gdx/utils/Array;)V

    :cond_0
    const/4 p1, -0x1

    .line 363
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->overIndex:I

    .line 364
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->pressedIndex:I

    .line 365
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->validate()V

    .line 367
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->invalidate()V

    .line 368
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getPrefWidth()F

    move-result p1

    cmpl-float p1, v0, p1

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getPrefHeight()F

    move-result p1

    cmpl-float p1, v1, p1

    if-eqz p1, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->invalidateHierarchy()V

    :cond_2
    return-void

    .line 356
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "newItems cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public varargs setItems([Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    if-eqz p1, :cond_2

    .line 340
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getPrefWidth()F

    move-result v0

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getPrefHeight()F

    move-result v1

    .line 342
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 343
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, p1}, Lcom/badlogic/gdx/utils/Array;->addAll([Ljava/lang/Object;)V

    const/4 p1, -0x1

    .line 344
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->overIndex:I

    .line 345
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->pressedIndex:I

    .line 346
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->validate()V

    .line 348
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->invalidate()V

    .line 349
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getPrefWidth()F

    move-result p1

    cmpl-float p1, v0, p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->getPrefHeight()F

    move-result p1

    cmpl-float p1, v1, p1

    if-eqz p1, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->invalidateHierarchy()V

    :cond_1
    return-void

    .line 339
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "newItems cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setSelected(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 282
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Array;->contains(Ljava/lang/Object;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 283
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->set(Ljava/lang/Object;)V

    goto :goto_0

    .line 284
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->getRequired()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lez p1, :cond_1

    .line 285
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->first()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->set(Ljava/lang/Object;)V

    goto :goto_0

    .line 287
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->clear()V

    :goto_0
    return-void
.end method

.method public setSelectedIndex(I)V
    .locals 3

    const/4 v0, -0x1

    if-lt p1, v0, :cond_1

    .line 299
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge p1, v1, :cond_1

    if-ne p1, v0, :cond_0

    .line 302
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->clear()V

    goto :goto_0

    .line 304
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;->set(Ljava/lang/Object;)V

    :goto_0
    return-void

    .line 300
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "index must be >= -1 and < "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->items:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSelection(Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection<",
            "TT;>;)V"
        }
    .end annotation

    .line 271
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->selection:Lcom/badlogic/gdx/scenes/scene2d/utils/ArraySelection;

    return-void
.end method

.method public setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 163
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/List$ListStyle;

    .line 164
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->invalidateHierarchy()V

    return-void

    .line 162
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "style cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setTypeToSelect(Z)V
    .locals 0

    .line 420
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/List;->typeToSelect:Z

    return-void
.end method

.method public toString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 400
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
