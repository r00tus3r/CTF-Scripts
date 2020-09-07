.class public Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;
.source "ProgressBar.java"

# interfaces
.implements Lcom/badlogic/gdx/scenes/scene2d/utils/Disableable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;
    }
.end annotation


# instance fields
.field private animateDuration:F

.field private animateFromValue:F

.field private animateInterpolation:Lcom/badlogic/gdx/math/Interpolation;

.field private animateTime:F

.field disabled:Z

.field private max:F

.field private min:F

.field position:F

.field private round:Z

.field private stepSize:F

.field private style:Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

.field private value:F

.field final vertical:Z

.field private visualInterpolation:Lcom/badlogic/gdx/math/Interpolation;


# direct methods
.method public constructor <init>(FFFZLcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;)V
    .locals 1

    .line 74
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;-><init>()V

    .line 51
    sget-object v0, Lcom/badlogic/gdx/math/Interpolation;->linear:Lcom/badlogic/gdx/math/Interpolation;

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->animateInterpolation:Lcom/badlogic/gdx/math/Interpolation;

    .line 53
    sget-object v0, Lcom/badlogic/gdx/math/Interpolation;->linear:Lcom/badlogic/gdx/math/Interpolation;

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->visualInterpolation:Lcom/badlogic/gdx/math/Interpolation;

    const/4 v0, 0x1

    .line 54
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->round:Z

    cmpl-float v0, p1, p2

    if-gtz v0, :cond_1

    const/4 v0, 0x0

    cmpg-float v0, p3, v0

    if-lez v0, :cond_0

    .line 77
    invoke-virtual {p0, p5}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;)V

    .line 78
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->min:F

    .line 79
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->max:F

    .line 80
    iput p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->stepSize:F

    .line 81
    iput-boolean p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->vertical:Z

    .line 82
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->value:F

    .line 83
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getPrefWidth()F

    move-result p1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getPrefHeight()F

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->setSize(FF)V

    return-void

    .line 76
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "stepSize must be > 0: "

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 75
    :cond_1
    new-instance p3, Ljava/lang/IllegalArgumentException;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "max must be > min. min,max: "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ", "

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p3
.end method

.method public constructor <init>(FFFZLcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V
    .locals 6

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "default-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p4, :cond_0

    const-string v1, "vertical"

    goto :goto_0

    :cond_0
    const-string v1, "horizontal"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-class v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    invoke-virtual {p5, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p5

    move-object v5, p5

    check-cast v5, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;-><init>(FFFZLcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;)V

    return-void
.end method

.method public constructor <init>(FFFZLcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V
    .locals 6

    .line 61
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    invoke-virtual {p5, p6, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p5

    move-object v5, p5

    check-cast v5, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;-><init>(FFFZLcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;)V

    return-void
.end method


# virtual methods
.method public act(F)V
    .locals 2

    .line 100
    invoke-super {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->act(F)V

    .line 101
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->animateTime:F

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    sub-float/2addr v0, p1

    .line 102
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->animateTime:F

    .line 103
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 104
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getActionsRequestRendering()Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {p1}, Lcom/badlogic/gdx/Graphics;->requestRendering()V

    :cond_0
    return-void
.end method

.method protected clamp(F)F
    .locals 2

    .line 289
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->min:F

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->max:F

    invoke-static {p1, v0, v1}, Lcom/badlogic/gdx/math/MathUtils;->clamp(FFF)F

    move-result p1

    return p1
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 20

    move-object/from16 v0, p0

    .line 110
    iget-object v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    .line 111
    iget-boolean v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->disabled:Z

    .line 112
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getKnobDrawable()Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object v3

    if-eqz v2, :cond_0

    .line 113
    iget-object v4, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->disabledBackground:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v4, :cond_0

    iget-object v4, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->disabledBackground:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    goto :goto_0

    :cond_0
    iget-object v4, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    :goto_0
    if-eqz v2, :cond_1

    .line 114
    iget-object v5, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->disabledKnobBefore:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v5, :cond_1

    iget-object v5, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->disabledKnobBefore:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    goto :goto_1

    :cond_1
    iget-object v5, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->knobBefore:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    :goto_1
    move-object v11, v5

    if-eqz v2, :cond_2

    .line 115
    iget-object v2, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->disabledKnobAfter:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v2, :cond_2

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->disabledKnobAfter:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    goto :goto_2

    :cond_2
    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->knobAfter:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    .line 117
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v2

    .line 118
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getX()F

    move-result v12

    .line 119
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getY()F

    move-result v13

    .line 120
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getWidth()F

    move-result v14

    .line 121
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getHeight()F

    move-result v15

    const/4 v10, 0x0

    if-nez v3, :cond_3

    const/16 v16, 0x0

    goto :goto_3

    .line 122
    :cond_3
    invoke-interface {v3}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v5

    move/from16 v16, v5

    :goto_3
    if-nez v3, :cond_4

    const/16 v17, 0x0

    goto :goto_4

    .line 123
    :cond_4
    invoke-interface {v3}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v5

    move/from16 v17, v5

    .line 124
    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getVisualPercent()F

    move-result v18

    .line 126
    iget v5, v2, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v6, v2, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v7, v2, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v2, v2, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v2, v2, p2

    move-object/from16 v9, p1

    invoke-interface {v9, v5, v6, v7, v2}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setColor(FFFF)V

    .line 128
    iget-boolean v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->vertical:Z

    const/high16 v19, 0x3f000000    # 0.5f

    if-eqz v2, :cond_e

    if-eqz v4, :cond_6

    .line 133
    iget-boolean v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->round:Z

    if-eqz v2, :cond_5

    .line 134
    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v2

    sub-float v2, v14, v2

    mul-float v2, v2, v19

    add-float/2addr v2, v12

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v7, v2

    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v2, v2

    move-object v5, v4

    move-object/from16 v6, p1

    move v8, v13

    move v9, v2

    const/4 v2, 0x0

    move v10, v15

    invoke-interface/range {v5 .. v10}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    goto :goto_5

    :cond_5
    const/4 v2, 0x0

    add-float v5, v12, v14

    .line 136
    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v6

    mul-float v6, v6, v19

    sub-float v7, v5, v6

    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v9

    move-object v5, v4

    move-object/from16 v6, p1

    move v8, v13

    move v10, v15

    invoke-interface/range {v5 .. v10}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    .line 137
    :goto_5
    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getTopHeight()F

    move-result v10

    .line 138
    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getBottomHeight()F

    move-result v4

    add-float v5, v10, v4

    sub-float v5, v15, v5

    goto :goto_6

    :cond_6
    const/4 v2, 0x0

    move v5, v15

    const/4 v4, 0x0

    const/4 v10, 0x0

    :goto_6
    if-nez v3, :cond_8

    if-nez v11, :cond_7

    const/4 v6, 0x0

    goto :goto_7

    .line 144
    :cond_7
    invoke-interface {v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v6

    mul-float v6, v6, v19

    :goto_7
    sub-float/2addr v5, v6

    mul-float v7, v5, v18

    .line 145
    iput v7, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    .line 146
    iget v7, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    invoke-static {v5, v7}, Ljava/lang/Math;->min(FF)F

    move-result v5

    iput v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    goto :goto_8

    :cond_8
    mul-float v6, v16, v19

    sub-float v5, v5, v16

    mul-float v7, v5, v18

    .line 149
    iput v7, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    .line 150
    iget v7, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    invoke-static {v5, v7}, Ljava/lang/Math;->min(FF)F

    move-result v5

    add-float/2addr v5, v4

    iput v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    :goto_8
    move v5, v6

    .line 152
    invoke-static {v2, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iget v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    if-eqz v11, :cond_a

    .line 155
    iget-boolean v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->round:Z

    if-eqz v2, :cond_9

    .line 156
    invoke-interface {v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v2

    sub-float v2, v14, v2

    mul-float v2, v2, v19

    add-float/2addr v2, v12

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v8, v2

    add-float/2addr v10, v13

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v9, v2

    .line 157
    invoke-interface {v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v10, v2

    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    add-float/2addr v2, v5

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v2, v2

    move-object v6, v11

    move-object/from16 v7, p1

    move v11, v2

    .line 156
    invoke-interface/range {v6 .. v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    goto :goto_9

    .line 159
    :cond_9
    invoke-interface {v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v2

    sub-float v2, v14, v2

    mul-float v2, v2, v19

    add-float v8, v12, v2

    add-float v9, v13, v10

    invoke-interface {v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v10

    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    add-float/2addr v2, v5

    move-object v6, v11

    move-object/from16 v7, p1

    move v11, v2

    invoke-interface/range {v6 .. v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    :cond_a
    :goto_9
    if-eqz v1, :cond_c

    .line 164
    iget-boolean v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->round:Z

    if-eqz v2, :cond_b

    .line 165
    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v2

    sub-float v2, v14, v2

    mul-float v2, v2, v19

    add-float/2addr v2, v12

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v7, v2

    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    add-float/2addr v2, v13

    add-float/2addr v2, v5

    .line 166
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v8, v2

    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v9, v2

    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    sub-float/2addr v15, v2

    sub-float/2addr v15, v5

    .line 167
    invoke-static {v15}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v10, v2

    move-object v5, v1

    move-object/from16 v6, p1

    .line 165
    invoke-interface/range {v5 .. v10}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    goto :goto_a

    .line 169
    :cond_b
    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v2

    sub-float v2, v14, v2

    mul-float v2, v2, v19

    add-float v7, v12, v2

    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    add-float/2addr v2, v13

    add-float v8, v2, v5

    .line 170
    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v9

    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    sub-float/2addr v15, v2

    sub-float v10, v15, v5

    move-object v5, v1

    move-object/from16 v6, p1

    .line 169
    invoke-interface/range {v5 .. v10}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    :cond_c
    :goto_a
    if-eqz v3, :cond_18

    .line 174
    iget-boolean v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->round:Z

    if-eqz v1, :cond_d

    sub-float v14, v14, v17

    mul-float v14, v14, v19

    add-float/2addr v12, v14

    .line 175
    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v5, v1

    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    add-float/2addr v13, v1

    invoke-static {v13}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v6, v1

    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v7, v1

    .line 176
    invoke-static/range {v16 .. v16}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v8, v1

    move-object/from16 v4, p1

    .line 175
    invoke-interface/range {v3 .. v8}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    goto/16 :goto_11

    :cond_d
    sub-float v14, v14, v17

    mul-float v14, v14, v19

    add-float v5, v12, v14

    .line 178
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    add-float v6, v13, v1

    move-object/from16 v4, p1

    move/from16 v7, v17

    move/from16 v8, v16

    invoke-interface/range {v3 .. v8}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    goto/16 :goto_11

    :cond_e
    const/4 v2, 0x0

    if-eqz v4, :cond_10

    .line 185
    iget-boolean v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->round:Z

    if-eqz v5, :cond_f

    .line 186
    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v5

    sub-float v5, v15, v5

    mul-float v5, v5, v19

    add-float/2addr v5, v13

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    int-to-float v8, v5

    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    int-to-float v10, v5

    move-object v5, v4

    move-object/from16 v6, p1

    move v7, v12

    move v9, v14

    invoke-interface/range {v5 .. v10}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    goto :goto_b

    .line 188
    :cond_f
    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v5

    sub-float v5, v15, v5

    mul-float v5, v5, v19

    add-float v8, v13, v5

    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v10

    move-object v5, v4

    move-object/from16 v6, p1

    move v7, v12

    move v9, v14

    invoke-interface/range {v5 .. v10}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    .line 189
    :goto_b
    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getLeftWidth()F

    move-result v10

    .line 190
    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getRightWidth()F

    move-result v4

    add-float/2addr v4, v10

    sub-float v4, v14, v4

    goto :goto_c

    :cond_10
    move v4, v14

    const/4 v10, 0x0

    :goto_c
    if-nez v3, :cond_12

    if-nez v11, :cond_11

    const/4 v5, 0x0

    goto :goto_d

    .line 196
    :cond_11
    invoke-interface {v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v5

    mul-float v5, v5, v19

    :goto_d
    sub-float/2addr v4, v5

    mul-float v6, v4, v18

    .line 197
    iput v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    .line 198
    iget v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    invoke-static {v4, v6}, Ljava/lang/Math;->min(FF)F

    move-result v4

    iput v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    goto :goto_e

    :cond_12
    mul-float v5, v17, v19

    sub-float v4, v4, v17

    mul-float v6, v4, v18

    .line 201
    iput v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    .line 202
    iget v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    invoke-static {v4, v6}, Ljava/lang/Math;->min(FF)F

    move-result v4

    add-float/2addr v4, v10

    iput v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    .line 204
    :goto_e
    invoke-static {v2, v10}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iget v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    if-eqz v11, :cond_14

    .line 207
    iget-boolean v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->round:Z

    if-eqz v2, :cond_13

    add-float/2addr v10, v12

    .line 208
    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v8, v2

    invoke-interface {v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v2

    sub-float v2, v15, v2

    mul-float v2, v2, v19

    add-float/2addr v2, v13

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v9, v2

    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    add-float/2addr v2, v5

    .line 209
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v10, v2

    invoke-interface {v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v2, v2

    move-object v6, v11

    move-object/from16 v7, p1

    move v11, v2

    .line 208
    invoke-interface/range {v6 .. v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    goto :goto_f

    :cond_13
    add-float v8, v12, v10

    .line 211
    invoke-interface {v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v2

    sub-float v2, v15, v2

    mul-float v2, v2, v19

    add-float v9, v13, v2

    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    add-float v10, v2, v5

    .line 212
    invoke-interface {v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v2

    move-object v6, v11

    move-object/from16 v7, p1

    move v11, v2

    .line 211
    invoke-interface/range {v6 .. v11}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    :cond_14
    :goto_f
    if-eqz v1, :cond_16

    .line 216
    iget-boolean v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->round:Z

    if-eqz v2, :cond_15

    .line 217
    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    add-float/2addr v2, v12

    add-float/2addr v2, v5

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v7, v2

    .line 218
    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v2

    sub-float v2, v15, v2

    mul-float v2, v2, v19

    add-float/2addr v2, v13

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v8, v2

    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    sub-float/2addr v14, v2

    sub-float/2addr v14, v5

    invoke-static {v14}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v9, v2

    .line 219
    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v10, v2

    move-object v5, v1

    move-object/from16 v6, p1

    .line 217
    invoke-interface/range {v5 .. v10}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    goto :goto_10

    .line 221
    :cond_15
    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    add-float/2addr v2, v12

    add-float v7, v2, v5

    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v2

    sub-float v2, v15, v2

    mul-float v2, v2, v19

    add-float v8, v13, v2

    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    sub-float/2addr v14, v2

    sub-float v9, v14, v5

    .line 222
    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v10

    move-object v5, v1

    move-object/from16 v6, p1

    .line 221
    invoke-interface/range {v5 .. v10}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    :cond_16
    :goto_10
    if-eqz v3, :cond_18

    .line 226
    iget-boolean v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->round:Z

    if-eqz v1, :cond_17

    .line 227
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    add-float/2addr v12, v1

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v5, v1

    sub-float v15, v15, v16

    mul-float v15, v15, v19

    add-float/2addr v13, v15

    invoke-static {v13}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v6, v1

    invoke-static/range {v17 .. v17}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v7, v1

    .line 228
    invoke-static/range {v16 .. v16}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v8, v1

    move-object/from16 v4, p1

    .line 227
    invoke-interface/range {v3 .. v8}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    goto :goto_11

    .line 230
    :cond_17
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    add-float v5, v12, v1

    sub-float v15, v15, v16

    mul-float v15, v15, v19

    add-float v6, v13, v15

    move-object/from16 v4, p1

    move/from16 v7, v17

    move/from16 v8, v16

    invoke-interface/range {v3 .. v8}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    :cond_18
    :goto_11
    return-void
.end method

.method protected getKnobDrawable()Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    .locals 1

    .line 256
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->disabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->disabledKnob:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->disabledKnob:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->knob:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    :goto_0
    return-object v0
.end method

.method protected getKnobPosition()F
    .locals 1

    .line 261
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->position:F

    return v0
.end method

.method public getMaxValue()F
    .locals 1

    .line 331
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->max:F

    return v0
.end method

.method public getMinValue()F
    .locals 1

    .line 327
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->min:F

    return v0
.end method

.method public getPercent()F
    .locals 3

    .line 246
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->min:F

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->max:F

    cmpl-float v2, v0, v1

    if-nez v2, :cond_0

    const/4 v0, 0x0

    return v0

    .line 247
    :cond_0
    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->value:F

    sub-float/2addr v2, v0

    sub-float/2addr v1, v0

    div-float/2addr v2, v1

    return v2
.end method

.method public getPrefHeight()F
    .locals 3

    .line 317
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->vertical:Z

    if-eqz v0, :cond_0

    const/high16 v0, 0x430c0000    # 140.0f

    return v0

    .line 320
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getKnobDrawable()Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object v0

    .line 321
    iget-boolean v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->disabled:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->disabledBackground:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->disabledBackground:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    :goto_0
    const/4 v2, 0x0

    if-nez v0, :cond_2

    const/4 v0, 0x0

    goto :goto_1

    .line 322
    :cond_2
    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v0

    :goto_1
    if-nez v1, :cond_3

    goto :goto_2

    :cond_3
    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result v2

    :goto_2
    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public getPrefWidth()F
    .locals 3

    .line 308
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->vertical:Z

    if-eqz v0, :cond_3

    .line 309
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getKnobDrawable()Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object v0

    .line 310
    iget-boolean v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->disabled:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->disabledBackground:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->disabledBackground:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    :goto_0
    const/4 v2, 0x0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_1

    .line 311
    :cond_1
    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v0

    :goto_1
    if-nez v1, :cond_2

    goto :goto_2

    :cond_2
    invoke-interface {v1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v2

    :goto_2
    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0

    :cond_3
    const/high16 v0, 0x430c0000    # 140.0f

    return v0
.end method

.method public getStepSize()F
    .locals 1

    .line 335
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->stepSize:F

    return v0
.end method

.method public getStyle()Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    return-object v0
.end method

.method public getValue()F
    .locals 1

    .line 236
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->value:F

    return v0
.end method

.method public getVisualPercent()F
    .locals 4

    .line 251
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->min:F

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->max:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 252
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->visualInterpolation:Lcom/badlogic/gdx/math/Interpolation;

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getVisualValue()F

    move-result v1

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->min:F

    sub-float/2addr v1, v2

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->max:F

    sub-float/2addr v3, v2

    div-float/2addr v1, v3

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Interpolation;->apply(F)F

    move-result v0

    return v0
.end method

.method public getVisualValue()F
    .locals 6

    .line 241
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->animateTime:F

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->animateInterpolation:Lcom/badlogic/gdx/math/Interpolation;

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->animateFromValue:F

    iget v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->value:F

    const/high16 v4, 0x3f800000    # 1.0f

    iget v5, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->animateDuration:F

    div-float/2addr v0, v5

    sub-float/2addr v4, v0

    invoke-virtual {v1, v2, v3, v4}, Lcom/badlogic/gdx/math/Interpolation;->apply(FFF)F

    move-result v0

    return v0

    .line 242
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->value:F

    return v0
.end method

.method public isDisabled()Z
    .locals 1

    .line 364
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->disabled:Z

    return v0
.end method

.method public isVertical()Z
    .locals 1

    .line 369
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->vertical:Z

    return v0
.end method

.method public setAnimateDuration(F)V
    .locals 0

    .line 340
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->animateDuration:F

    return-void
.end method

.method public setAnimateInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 346
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->animateInterpolation:Lcom/badlogic/gdx/math/Interpolation;

    return-void

    .line 345
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "animateInterpolation cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setDisabled(Z)V
    .locals 0

    .line 360
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->disabled:Z

    return-void
.end method

.method public setRange(FF)V
    .locals 3

    cmpl-float v0, p1, p2

    if-gtz v0, :cond_2

    .line 295
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->min:F

    .line 296
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->max:F

    .line 297
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->value:F

    cmpg-float v1, v0, p1

    if-gez v1, :cond_0

    .line 298
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->setValue(F)Z

    goto :goto_0

    :cond_0
    cmpl-float p1, v0, p2

    if-lez p1, :cond_1

    .line 299
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->setValue(F)Z

    :cond_1
    :goto_0
    return-void

    .line 294
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "min must be <= max: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, " <= "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRound(Z)V
    .locals 0

    .line 356
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->round:Z

    return-void
.end method

.method public setStepSize(F)V
    .locals 3

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-lez v0, :cond_0

    .line 304
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->stepSize:F

    return-void

    .line 303
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "steps must be > 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 88
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar$ProgressBarStyle;

    .line 89
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->invalidateHierarchy()V

    return-void

    .line 87
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "style cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setValue(F)Z
    .locals 4

    .line 269
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->stepSize:F

    div-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    int-to-float p1, p1

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->stepSize:F

    mul-float p1, p1, v0

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->clamp(F)F

    move-result p1

    .line 270
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->value:F

    cmpl-float v1, p1, v0

    if-nez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 272
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->getVisualValue()F

    move-result v1

    .line 273
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->value:F

    .line 274
    const-class p1, Lcom/badlogic/gdx/scenes/scene2d/utils/ChangeListener$ChangeEvent;

    invoke-static {p1}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/scenes/scene2d/utils/ChangeListener$ChangeEvent;

    .line 275
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->fire(Lcom/badlogic/gdx/scenes/scene2d/Event;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 277
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->value:F

    goto :goto_0

    .line 278
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->animateDuration:F

    const/4 v3, 0x0

    cmpl-float v3, v0, v3

    if-lez v3, :cond_2

    .line 279
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->animateFromValue:F

    .line 280
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->animateTime:F

    .line 282
    :cond_2
    :goto_0
    invoke-static {p1}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    xor-int/lit8 p1, v2, 0x1

    return p1
.end method

.method public setVisualInterpolation(Lcom/badlogic/gdx/math/Interpolation;)V
    .locals 0

    .line 351
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ProgressBar;->visualInterpolation:Lcom/badlogic/gdx/math/Interpolation;

    return-void
.end method
