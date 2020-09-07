.class public Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;
.source "HorizontalGroup.java"


# instance fields
.field private align:I

.field private expand:Z

.field private fill:F

.field private lastPrefHeight:F

.field private padBottom:F

.field private padLeft:F

.field private padRight:F

.field private padTop:F

.field private prefHeight:F

.field private prefWidth:F

.field private reverse:Z

.field private round:Z

.field private rowAlign:I

.field private rowSizes:Lcom/badlogic/gdx/utils/FloatArray;

.field private sizeInvalid:Z

.field private space:F

.field private wrap:Z

.field private wrapSpace:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 49
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;-><init>()V

    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->sizeInvalid:Z

    const/16 v1, 0x8

    .line 45
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    .line 46
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->round:Z

    .line 50
    sget-object v0, Lcom/badlogic/gdx/scenes/scene2d/Touchable;->childrenOnly:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->setTouchable(Lcom/badlogic/gdx/scenes/scene2d/Touchable;)V

    return-void
.end method

.method private computeSize()V
    .locals 18

    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 59
    iput-boolean v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->sizeInvalid:Z

    .line 60
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getChildren()Lcom/badlogic/gdx/utils/SnapshotArray;

    move-result-object v2

    .line 61
    iget v3, v2, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    const/4 v4, 0x0

    .line 62
    iput v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefHeight:F

    .line 63
    iget-boolean v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->wrap:Z

    if-eqz v5, :cond_9

    .line 64
    iput v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    .line 65
    iget-object v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowSizes:Lcom/badlogic/gdx/utils/FloatArray;

    if-nez v5, :cond_0

    .line 66
    new-instance v5, Lcom/badlogic/gdx/utils/FloatArray;

    invoke-direct {v5}, Lcom/badlogic/gdx/utils/FloatArray;-><init>()V

    iput-object v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowSizes:Lcom/badlogic/gdx/utils/FloatArray;

    goto :goto_0

    .line 68
    :cond_0
    invoke-virtual {v5}, Lcom/badlogic/gdx/utils/FloatArray;->clear()V

    .line 69
    :goto_0
    iget-object v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowSizes:Lcom/badlogic/gdx/utils/FloatArray;

    .line 70
    iget v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->space:F

    iget v7, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->wrapSpace:F

    .line 71
    iget v8, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padLeft:F

    iget v9, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padRight:F

    add-float/2addr v8, v9

    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getWidth()F

    move-result v9

    sub-float/2addr v9, v8

    .line 73
    iget-boolean v10, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->reverse:Z

    const/4 v11, -0x1

    if-eqz v10, :cond_1

    add-int/lit8 v1, v3, -0x1

    const/4 v3, -0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, -0x1

    goto :goto_1

    :cond_1
    const/4 v11, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    :goto_1
    if-eq v1, v3, :cond_7

    .line 79
    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/SnapshotArray;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 82
    instance-of v15, v14, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    if-eqz v15, :cond_3

    .line 83
    check-cast v14, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    .line 84
    invoke-interface {v14}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getPrefWidth()F

    move-result v15

    cmpl-float v16, v15, v9

    if-lez v16, :cond_2

    .line 85
    invoke-interface {v14}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getMinWidth()F

    move-result v15

    invoke-static {v9, v15}, Ljava/lang/Math;->max(FF)F

    move-result v15

    .line 86
    :cond_2
    invoke-interface {v14}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getPrefHeight()F

    move-result v14

    goto :goto_2

    .line 88
    :cond_3
    invoke-virtual {v14}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getWidth()F

    move-result v15

    .line 89
    invoke-virtual {v14}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getHeight()F

    move-result v14

    :goto_2
    cmpl-float v16, v10, v4

    if-lez v16, :cond_4

    move/from16 v16, v6

    goto :goto_3

    :cond_4
    const/16 v16, 0x0

    :goto_3
    add-float v16, v15, v16

    add-float v17, v10, v16

    cmpl-float v17, v17, v9

    if-lez v17, :cond_6

    cmpl-float v17, v10, v4

    if-lez v17, :cond_6

    .line 94
    invoke-virtual {v5, v10}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 95
    invoke-virtual {v5, v11}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 96
    iget v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    add-float/2addr v10, v8

    invoke-static {v4, v10}, Ljava/lang/Math;->max(FF)F

    move-result v4

    iput v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    const/4 v4, 0x0

    cmpl-float v10, v12, v4

    if-lez v10, :cond_5

    add-float/2addr v12, v7

    :cond_5
    add-float/2addr v12, v11

    const/4 v10, 0x0

    const/4 v11, 0x0

    goto :goto_4

    :cond_6
    move/from16 v15, v16

    :goto_4
    add-float/2addr v10, v15

    .line 104
    invoke-static {v11, v14}, Ljava/lang/Math;->max(FF)F

    move-result v11

    add-int/2addr v1, v13

    const/4 v4, 0x0

    goto :goto_1

    .line 106
    :cond_7
    invoke-virtual {v5, v10}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 107
    invoke-virtual {v5, v11}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 108
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    add-float/2addr v10, v8

    invoke-static {v1, v10}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    const/4 v1, 0x0

    cmpl-float v1, v12, v1

    if-lez v1, :cond_8

    add-float/2addr v12, v7

    .line 110
    :cond_8
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefHeight:F

    add-float/2addr v12, v11

    invoke-static {v1, v12}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefHeight:F

    goto :goto_7

    .line 112
    :cond_9
    iget v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padLeft:F

    iget v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padRight:F

    add-float/2addr v4, v5

    iget v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->space:F

    add-int/lit8 v6, v3, -0x1

    int-to-float v6, v6

    mul-float v5, v5, v6

    add-float/2addr v4, v5

    iput v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    :goto_5
    if-ge v1, v3, :cond_b

    .line 114
    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/SnapshotArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 115
    instance-of v5, v4, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    if-eqz v5, :cond_a

    .line 116
    check-cast v4, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    .line 117
    iget v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getPrefWidth()F

    move-result v6

    add-float/2addr v5, v6

    iput v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    .line 118
    iget v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefHeight:F

    invoke-interface {v4}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getPrefHeight()F

    move-result v4

    invoke-static {v5, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    iput v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefHeight:F

    goto :goto_6

    .line 120
    :cond_a
    iget v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    invoke-virtual {v4}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getWidth()F

    move-result v6

    add-float/2addr v5, v6

    iput v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    .line 121
    iget v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefHeight:F

    invoke-virtual {v4}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getHeight()F

    move-result v4

    invoke-static {v5, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    iput v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefHeight:F

    :goto_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 125
    :cond_b
    :goto_7
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefHeight:F

    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padTop:F

    iget v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padBottom:F

    add-float/2addr v2, v3

    add-float/2addr v1, v2

    iput v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefHeight:F

    .line 126
    iget-boolean v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->round:Z

    if-eqz v1, :cond_c

    .line 127
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    iput v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    .line 128
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefHeight:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    iput v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefHeight:F

    :cond_c
    return-void
.end method

.method private layoutWrapped()V
    .locals 27

    move-object/from16 v0, p0

    .line 206
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getPrefHeight()F

    move-result v1

    .line 207
    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->lastPrefHeight:F

    cmpl-float v2, v1, v2

    if-eqz v2, :cond_0

    .line 208
    iput v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->lastPrefHeight:F

    .line 209
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->invalidateHierarchy()V

    .line 212
    :cond_0
    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    .line 213
    iget-boolean v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->round:Z

    .line 214
    iget v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->space:F

    iget v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padBottom:F

    iget v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->fill:F

    iget v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->wrapSpace:F

    .line 215
    iget v7, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    iget v8, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padLeft:F

    sub-float/2addr v7, v8

    iget v8, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padRight:F

    sub-float/2addr v7, v8

    .line 216
    iget v8, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padTop:F

    sub-float v8, v1, v8

    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getWidth()F

    move-result v9

    iget v10, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padLeft:F

    and-int/lit8 v11, v2, 0x2

    const/high16 v12, 0x40000000    # 2.0f

    if-eqz v11, :cond_1

    .line 219
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getHeight()F

    move-result v11

    sub-float/2addr v11, v1

    :goto_0
    add-float/2addr v8, v11

    goto :goto_1

    :cond_1
    and-int/lit8 v11, v2, 0x4

    if-nez v11, :cond_2

    .line 221
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getHeight()F

    move-result v11

    sub-float/2addr v11, v1

    div-float/2addr v11, v12

    goto :goto_0

    :cond_2
    :goto_1
    and-int/lit8 v1, v2, 0x10

    if-eqz v1, :cond_3

    .line 224
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    sub-float v1, v9, v1

    :goto_2
    add-float/2addr v10, v1

    goto :goto_3

    :cond_3
    and-int/lit8 v1, v2, 0x8

    if-nez v1, :cond_4

    .line 226
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    sub-float v1, v9, v1

    div-float/2addr v1, v12

    goto :goto_2

    .line 228
    :cond_4
    :goto_3
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padRight:F

    sub-float/2addr v9, v1

    .line 229
    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    .line 231
    iget-object v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowSizes:Lcom/badlogic/gdx/utils/FloatArray;

    .line 232
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getChildren()Lcom/badlogic/gdx/utils/SnapshotArray;

    move-result-object v11

    .line 233
    iget v13, v11, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    .line 234
    iget-boolean v14, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->reverse:Z

    const/4 v15, -0x1

    const/16 v16, 0x0

    if-eqz v14, :cond_5

    add-int/lit8 v13, v13, -0x1

    const/4 v14, -0x1

    goto :goto_4

    :cond_5
    const/4 v15, 0x1

    move v15, v13

    const/4 v13, 0x0

    const/4 v14, 0x1

    :goto_4
    const/16 v17, 0x0

    move/from16 v19, v8

    const/4 v8, 0x0

    const/4 v12, 0x0

    const/16 v18, 0x0

    :goto_5
    if-eq v13, v15, :cond_14

    .line 240
    invoke-virtual {v11, v13}, Lcom/badlogic/gdx/utils/SnapshotArray;->get(I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v20

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/Actor;

    const/16 v20, 0x0

    move-object/from16 v21, v11

    .line 244
    instance-of v11, v0, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    if-eqz v11, :cond_7

    .line 245
    move-object/from16 v20, v0

    check-cast v20, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    .line 246
    invoke-interface/range {v20 .. v20}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getPrefWidth()F

    move-result v11

    cmpl-float v22, v11, v9

    if-lez v22, :cond_6

    .line 247
    invoke-interface/range {v20 .. v20}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getMinWidth()F

    move-result v11

    invoke-static {v9, v11}, Ljava/lang/Math;->max(FF)F

    move-result v11

    .line 248
    :cond_6
    invoke-interface/range {v20 .. v20}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getPrefHeight()F

    move-result v22

    goto :goto_6

    .line 250
    :cond_7
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getWidth()F

    move-result v11

    .line 251
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getHeight()F

    move-result v22

    :goto_6
    add-float v23, v8, v11

    cmpl-float v23, v23, v9

    if-gtz v23, :cond_9

    if-nez v12, :cond_8

    goto :goto_7

    :cond_8
    move/from16 v26, v18

    move/from16 v18, v7

    move/from16 v7, v26

    goto :goto_a

    :cond_9
    :goto_7
    and-int/lit8 v8, v1, 0x10

    if-eqz v8, :cond_a

    .line 257
    invoke-virtual {v2, v12}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v8

    sub-float v8, v7, v8

    :goto_8
    add-float/2addr v8, v10

    goto :goto_9

    :cond_a
    and-int/lit8 v8, v1, 0x8

    if-nez v8, :cond_b

    .line 259
    invoke-virtual {v2, v12}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v8

    sub-float v8, v7, v8

    const/high16 v16, 0x40000000    # 2.0f

    div-float v8, v8, v16

    goto :goto_8

    :cond_b
    move v8, v10

    :goto_9
    move/from16 v18, v7

    add-int/lit8 v7, v12, 0x1

    .line 260
    invoke-virtual {v2, v7}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v7

    if-lez v12, :cond_c

    sub-float v19, v19, v6

    :cond_c
    sub-float v19, v19, v7

    add-int/lit8 v12, v12, 0x2

    :goto_a
    cmpl-float v23, v5, v17

    if-lez v23, :cond_d

    mul-float v22, v7, v5

    :cond_d
    move-object/from16 v23, v2

    move/from16 v2, v22

    if-eqz v20, :cond_e

    move/from16 v22, v5

    .line 269
    invoke-interface/range {v20 .. v20}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getMinHeight()F

    move-result v5

    invoke-static {v2, v5}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 270
    invoke-interface/range {v20 .. v20}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getMaxHeight()F

    move-result v5

    cmpl-float v24, v5, v17

    if-lez v24, :cond_f

    cmpl-float v24, v2, v5

    if-lez v24, :cond_f

    move v2, v5

    goto :goto_b

    :cond_e
    move/from16 v22, v5

    :cond_f
    :goto_b
    and-int/lit8 v5, v1, 0x2

    if-eqz v5, :cond_10

    sub-float v5, v7, v2

    add-float v5, v19, v5

    const/high16 v16, 0x40000000    # 2.0f

    goto :goto_c

    :cond_10
    and-int/lit8 v5, v1, 0x4

    if-nez v5, :cond_11

    sub-float v5, v7, v2

    const/high16 v16, 0x40000000    # 2.0f

    div-float v5, v5, v16

    add-float v5, v19, v5

    goto :goto_c

    :cond_11
    const/high16 v16, 0x40000000    # 2.0f

    move/from16 v5, v19

    :goto_c
    if-eqz v3, :cond_12

    move/from16 v24, v1

    .line 281
    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    int-to-float v5, v5

    move/from16 v25, v3

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v5, v3, v2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setBounds(FFFF)V

    goto :goto_d

    :cond_12
    move/from16 v24, v1

    move/from16 v25, v3

    .line 283
    invoke-virtual {v0, v8, v5, v11, v2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setBounds(FFFF)V

    :goto_d
    add-float/2addr v11, v4

    add-float/2addr v8, v11

    if-eqz v20, :cond_13

    .line 286
    invoke-interface/range {v20 .. v20}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->validate()V

    :cond_13
    add-int/2addr v13, v14

    move-object/from16 v0, p0

    move-object/from16 v11, v21

    move/from16 v5, v22

    move-object/from16 v2, v23

    move/from16 v1, v24

    move/from16 v3, v25

    move/from16 v26, v18

    move/from16 v18, v7

    move/from16 v7, v26

    goto/16 :goto_5

    :cond_14
    return-void
.end method


# virtual methods
.method public align(I)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 398
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    return-object p0
.end method

.method public bottom()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    .line 424
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    .line 425
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    return-object p0
.end method

.method public center()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    const/4 v0, 0x1

    .line 404
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    return-object p0
.end method

.method protected drawDebugBounds(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;)V
    .locals 12

    .line 546
    invoke-super {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->drawDebugBounds(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;)V

    .line 547
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getDebug()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 548
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->set(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;)V

    .line 549
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getDebugColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 550
    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getX()F

    move-result v0

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padLeft:F

    add-float v3, v0, v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getY()F

    move-result v0

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padBottom:F

    add-float v4, v0, v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getOriginX()F

    move-result v5

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getOriginY()F

    move-result v6

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getWidth()F

    move-result v0

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padLeft:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padRight:F

    sub-float v7, v0, v1

    .line 551
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getHeight()F

    move-result v0

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padBottom:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padTop:F

    sub-float v8, v0, v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getScaleX()F

    move-result v9

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getScaleY()F

    move-result v10

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getRotation()F

    move-result v11

    move-object v2, p1

    .line 550
    invoke-virtual/range {v2 .. v11}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->rect(FFFFFFFFF)V

    return-void
.end method

.method public expand()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    const/4 v0, 0x1

    .line 456
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->expand:Z

    return-object p0
.end method

.method public expand(Z)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 462
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->expand:Z

    return-object p0
.end method

.method public fill()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    .line 441
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->fill:F

    return-object p0
.end method

.method public fill(F)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 447
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->fill:F

    return-object p0
.end method

.method public getAlign()I
    .locals 1

    .line 437
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    return v0
.end method

.method public getExpand()Z
    .locals 1

    .line 467
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->expand:Z

    return v0
.end method

.method public getFill()F
    .locals 1

    .line 452
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->fill:F

    return v0
.end method

.method public getPadBottom()F
    .locals 1

    .line 388
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padBottom:F

    return v0
.end method

.method public getPadLeft()F
    .locals 1

    .line 384
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padLeft:F

    return v0
.end method

.method public getPadRight()F
    .locals 1

    .line 392
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padRight:F

    return v0
.end method

.method public getPadTop()F
    .locals 1

    .line 380
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padTop:F

    return v0
.end method

.method public getPrefHeight()F
    .locals 1

    .line 297
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->sizeInvalid:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->computeSize()V

    .line 298
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefHeight:F

    return v0
.end method

.method public getPrefWidth()F
    .locals 1

    .line 291
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->wrap:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 292
    :cond_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->sizeInvalid:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->computeSize()V

    .line 293
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    return v0
.end method

.method public getReverse()Z
    .locals 1

    .line 319
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->reverse:Z

    return v0
.end method

.method public getSpace()F
    .locals 1

    .line 329
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->space:F

    return v0
.end method

.method public getWrap()Z
    .locals 1

    .line 498
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->wrap:Z

    return v0
.end method

.method public getWrapSpace()F
    .locals 1

    .line 339
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->wrapSpace:F

    return v0
.end method

.method public grow()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    const/4 v0, 0x1

    .line 472
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->expand:Z

    const/high16 v0, 0x3f800000    # 1.0f

    .line 473
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->fill:F

    return-object p0
.end method

.method public invalidate()V
    .locals 1

    .line 54
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->invalidate()V

    const/4 v0, 0x1

    .line 55
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->sizeInvalid:Z

    return-void
.end method

.method public layout()V
    .locals 19

    move-object/from16 v0, p0

    .line 133
    iget-boolean v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->sizeInvalid:Z

    if-eqz v1, :cond_0

    invoke-direct/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->computeSize()V

    .line 135
    :cond_0
    iget-boolean v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->wrap:Z

    if-eqz v1, :cond_1

    .line 136
    invoke-direct/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->layoutWrapped()V

    return-void

    .line 140
    :cond_1
    iget-boolean v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->round:Z

    .line 141
    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    .line 142
    iget v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->space:F

    iget v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padBottom:F

    iget v5, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->fill:F

    .line 143
    iget-boolean v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->expand:Z

    if-eqz v6, :cond_2

    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getHeight()F

    move-result v6

    goto :goto_0

    :cond_2
    iget v6, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefHeight:F

    :goto_0
    iget v7, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padTop:F

    sub-float/2addr v6, v7

    sub-float/2addr v6, v4

    iget v7, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padLeft:F

    and-int/lit8 v8, v2, 0x10

    const/high16 v9, 0x40000000    # 2.0f

    if-eqz v8, :cond_3

    .line 146
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getWidth()F

    move-result v8

    iget v10, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    sub-float/2addr v8, v10

    :goto_1
    add-float/2addr v7, v8

    goto :goto_2

    :cond_3
    and-int/lit8 v8, v2, 0x8

    if-nez v8, :cond_4

    .line 148
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getWidth()F

    move-result v8

    iget v10, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->prefWidth:F

    sub-float/2addr v8, v10

    div-float/2addr v8, v9

    goto :goto_1

    :cond_4
    :goto_2
    and-int/lit8 v8, v2, 0x4

    if-eqz v8, :cond_5

    goto :goto_3

    :cond_5
    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_6

    .line 154
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getHeight()F

    move-result v2

    iget v4, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padTop:F

    sub-float/2addr v2, v4

    sub-float v4, v2, v6

    goto :goto_3

    .line 156
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getHeight()F

    move-result v2

    sub-float/2addr v2, v4

    iget v8, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padTop:F

    sub-float/2addr v2, v8

    sub-float/2addr v2, v6

    div-float/2addr v2, v9

    add-float/2addr v4, v2

    .line 158
    :goto_3
    iget v2, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    .line 160
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->getChildren()Lcom/badlogic/gdx/utils/SnapshotArray;

    move-result-object v8

    const/4 v10, 0x0

    .line 161
    iget v11, v8, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    .line 162
    iget-boolean v12, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->reverse:Z

    const/4 v13, -0x1

    if-eqz v12, :cond_7

    add-int/lit8 v10, v11, -0x1

    const/4 v11, -0x1

    goto :goto_4

    :cond_7
    const/4 v13, 0x1

    :goto_4
    if-eq v10, v11, :cond_f

    .line 168
    invoke-virtual {v8, v10}, Lcom/badlogic/gdx/utils/SnapshotArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/badlogic/gdx/scenes/scene2d/Actor;

    const/4 v14, 0x0

    .line 172
    instance-of v15, v12, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    if-eqz v15, :cond_8

    .line 173
    move-object v14, v12

    check-cast v14, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    .line 174
    invoke-interface {v14}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getPrefWidth()F

    move-result v15

    .line 175
    invoke-interface {v14}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getPrefHeight()F

    move-result v16

    goto :goto_5

    .line 177
    :cond_8
    invoke-virtual {v12}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getWidth()F

    move-result v15

    .line 178
    invoke-virtual {v12}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getHeight()F

    move-result v16

    :goto_5
    const/16 v17, 0x0

    cmpl-float v18, v5, v17

    if-lez v18, :cond_9

    mul-float v16, v6, v5

    :cond_9
    move/from16 v9, v16

    if-eqz v14, :cond_a

    .line 184
    invoke-interface {v14}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getMinHeight()F

    move-result v0

    invoke-static {v9, v0}, Ljava/lang/Math;->max(FF)F

    move-result v9

    .line 185
    invoke-interface {v14}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->getMaxHeight()F

    move-result v0

    cmpl-float v16, v0, v17

    if-lez v16, :cond_a

    cmpl-float v16, v9, v0

    if-lez v16, :cond_a

    move v9, v0

    :cond_a
    and-int/lit8 v0, v2, 0x2

    if-eqz v0, :cond_b

    sub-float v0, v6, v9

    add-float/2addr v0, v4

    const/high16 v16, 0x40000000    # 2.0f

    goto :goto_6

    :cond_b
    and-int/lit8 v0, v2, 0x4

    if-nez v0, :cond_c

    sub-float v0, v6, v9

    const/high16 v16, 0x40000000    # 2.0f

    div-float v0, v0, v16

    add-float/2addr v0, v4

    goto :goto_6

    :cond_c
    const/high16 v16, 0x40000000    # 2.0f

    move v0, v4

    :goto_6
    if-eqz v1, :cond_d

    move/from16 v17, v1

    .line 196
    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-float v0, v0

    move/from16 v18, v2

    invoke-static {v15}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v12, v1, v0, v2, v9}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setBounds(FFFF)V

    goto :goto_7

    :cond_d
    move/from16 v17, v1

    move/from16 v18, v2

    .line 198
    invoke-virtual {v12, v7, v0, v15, v9}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setBounds(FFFF)V

    :goto_7
    add-float/2addr v15, v3

    add-float/2addr v7, v15

    if-eqz v14, :cond_e

    .line 201
    invoke-interface {v14}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->validate()V

    :cond_e
    add-int/2addr v10, v13

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    const/high16 v9, 0x40000000    # 2.0f

    goto/16 :goto_4

    :cond_f
    return-void
.end method

.method public left()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    .line 417
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    .line 418
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    return-object p0
.end method

.method public pad(F)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 344
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padTop:F

    .line 345
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padLeft:F

    .line 346
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padBottom:F

    .line 347
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padRight:F

    return-object p0
.end method

.method public pad(FFFF)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 352
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padTop:F

    .line 353
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padLeft:F

    .line 354
    iput p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padBottom:F

    .line 355
    iput p4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padRight:F

    return-object p0
.end method

.method public padBottom(F)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 370
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padBottom:F

    return-object p0
.end method

.method public padLeft(F)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 365
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padLeft:F

    return-object p0
.end method

.method public padRight(F)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 375
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padRight:F

    return-object p0
.end method

.method public padTop(F)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 360
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->padTop:F

    return-object p0
.end method

.method public reverse()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    const/4 v0, 0x1

    .line 308
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->reverse:Z

    return-object p0
.end method

.method public reverse(Z)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 314
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->reverse:Z

    return-object p0
.end method

.method public right()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    .line 431
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    .line 432
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    return-object p0
.end method

.method public rowAlign(I)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 505
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    return-object p0
.end method

.method public rowBottom()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    .line 532
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    .line 533
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    return-object p0
.end method

.method public rowCenter()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    const/4 v0, 0x1

    .line 511
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    return-object p0
.end method

.method public rowLeft()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    .line 525
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    .line 526
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    return-object p0
.end method

.method public rowRight()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    .line 540
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    .line 541
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    return-object p0
.end method

.method public rowTop()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    .line 517
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    .line 518
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->rowAlign:I

    return-object p0
.end method

.method public setRound(Z)V
    .locals 0

    .line 303
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->round:Z

    return-void
.end method

.method public space(F)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 324
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->space:F

    return-object p0
.end method

.method public top()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    .line 410
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    .line 411
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->align:I

    return-object p0
.end method

.method public wrap()Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 1

    const/4 v0, 0x1

    .line 488
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->wrap:Z

    return-object p0
.end method

.method public wrap(Z)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 493
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->wrap:Z

    return-object p0
.end method

.method public wrapSpace(F)Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;
    .locals 0

    .line 334
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/HorizontalGroup;->wrapSpace:F

    return-object p0
.end method
