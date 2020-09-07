.class public Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;
.super Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;
.source "TiledDrawable.java"


# static fields
.field private static final temp:Lcom/badlogic/gdx/graphics/Color;


# instance fields
.field private final color:Lcom/badlogic/gdx/graphics/Color;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/Color;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->temp:Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 32
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;-><init>()V

    .line 29
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->color:Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 1

    .line 36
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 29
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->color:Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;)V
    .locals 1

    .line 40
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;)V

    .line 29
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-direct {p1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->color:Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method


# virtual methods
.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V
    .locals 29

    move-object/from16 v10, p1

    .line 44
    invoke-interface/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/g2d/Batch;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    .line 45
    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->temp:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    move-object/from16 v11, p0

    .line 46
    iget-object v1, v11, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/Color;->mul(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    invoke-interface {v10, v0}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    .line 48
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->getRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v12

    .line 49
    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v0

    int-to-float v13, v0

    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v0

    int-to-float v14, v0

    div-float v0, p4, v13

    float-to-int v15, v0

    div-float v0, p5, v14

    float-to-int v9, v0

    int-to-float v0, v15

    mul-float v0, v0, v13

    sub-float v16, p4, v0

    int-to-float v0, v9

    mul-float v0, v0, v14

    sub-float v17, p5, v0

    const/16 v18, 0x0

    move/from16 v19, p2

    move/from16 v0, p3

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v15, :cond_1

    move/from16 v8, p3

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v9, :cond_0

    move-object/from16 v0, p1

    move-object v1, v12

    move/from16 v2, v19

    move v3, v8

    move v4, v13

    move v5, v14

    .line 57
    invoke-interface/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FFFF)V

    add-float/2addr v8, v14

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_0
    add-float v19, v19, v13

    add-int/lit8 v6, v6, 0x1

    move v0, v8

    goto :goto_0

    .line 62
    :cond_1
    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getTexture()Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v20

    .line 63
    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU()F

    move-result v21

    .line 64
    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV2()F

    move-result v22

    const/16 v23, 0x0

    cmpl-float v1, v16, v23

    if-lez v1, :cond_3

    .line 67
    invoke-virtual/range {v20 .. v20}, Lcom/badlogic/gdx/graphics/Texture;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float v0, v16, v0

    add-float v24, v21, v0

    .line 68
    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV()F

    move-result v25

    move/from16 v26, p3

    const/4 v8, 0x0

    :goto_2
    if-ge v8, v9, :cond_2

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move/from16 v2, v19

    move/from16 v3, v26

    move/from16 v4, v16

    move v5, v14

    move/from16 v6, v21

    move/from16 v7, v22

    move/from16 v27, v8

    move/from16 v8, v24

    move/from16 v28, v9

    move/from16 v9, v25

    .line 71
    invoke-interface/range {v0 .. v9}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/Texture;FFFFFFFF)V

    add-float v26, v26, v14

    add-int/lit8 v8, v27, 0x1

    move/from16 v9, v28

    goto :goto_2

    :cond_2
    cmpl-float v0, v17, v23

    if-lez v0, :cond_4

    .line 76
    invoke-virtual/range {v20 .. v20}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float v0, v17, v0

    sub-float v9, v22, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move/from16 v2, v19

    move/from16 v3, v26

    move/from16 v4, v16

    move/from16 v5, v17

    move/from16 v6, v21

    move/from16 v7, v22

    move/from16 v8, v24

    .line 77
    invoke-interface/range {v0 .. v9}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/Texture;FFFFFFFF)V

    goto :goto_3

    :cond_3
    move/from16 v26, v0

    :cond_4
    :goto_3
    cmpl-float v0, v17, v23

    if-lez v0, :cond_5

    .line 82
    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU2()F

    move-result v12

    .line 83
    invoke-virtual/range {v20 .. v20}, Lcom/badlogic/gdx/graphics/Texture;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float v0, v17, v0

    sub-float v14, v22, v0

    move/from16 v16, p2

    const/4 v9, 0x0

    :goto_4
    if-ge v9, v15, :cond_5

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move/from16 v2, v16

    move/from16 v3, v26

    move v4, v13

    move/from16 v5, v17

    move/from16 v6, v21

    move/from16 v7, v22

    move v8, v12

    move/from16 v18, v9

    move v9, v14

    .line 86
    invoke-interface/range {v0 .. v9}, Lcom/badlogic/gdx/graphics/g2d/Batch;->draw(Lcom/badlogic/gdx/graphics/Texture;FFFFFFFF)V

    add-float v16, v16, v13

    add-int/lit8 v9, v18, 0x1

    goto :goto_4

    .line 91
    :cond_5
    sget-object v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->temp:Lcom/badlogic/gdx/graphics/Color;

    invoke-interface {v10, v0}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFFFFFFF)V
    .locals 0

    .line 96
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public getColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->color:Lcom/badlogic/gdx/graphics/Color;

    return-object v0
.end method

.method public bridge synthetic tint(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;
    .locals 0

    .line 26
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->tint(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;

    move-result-object p1

    return-object p1
.end method

.method public tint(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;
    .locals 2

    .line 104
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;-><init>(Lcom/badlogic/gdx/scenes/scene2d/utils/TextureRegionDrawable;)V

    .line 105
    iget-object v1, v0, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    .line 106
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->getLeftWidth()F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->setLeftWidth(F)V

    .line 107
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->getRightWidth()F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->setRightWidth(F)V

    .line 108
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->getTopHeight()F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->setTopHeight(F)V

    .line 109
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->getBottomHeight()F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/TiledDrawable;->setBottomHeight(F)V

    return-object v0
.end method
