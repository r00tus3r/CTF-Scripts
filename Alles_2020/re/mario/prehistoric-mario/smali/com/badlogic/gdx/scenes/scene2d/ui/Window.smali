.class public Lcom/badlogic/gdx/scenes/scene2d/ui/Window;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Table;
.source "Window.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;
    }
.end annotation


# static fields
.field private static final MOVE:I = 0x20

.field private static final tmpPosition:Lcom/badlogic/gdx/math/Vector2;

.field private static final tmpSize:Lcom/badlogic/gdx/math/Vector2;


# instance fields
.field protected dragging:Z

.field drawTitleTable:Z

.field protected edge:I

.field isModal:Z

.field isMovable:Z

.field isResizable:Z

.field keepWithinStage:Z

.field resizeBorder:I

.field private style:Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;

.field titleLabel:Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

.field titleTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    .line 41
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->tmpSize:Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V
    .locals 1

    .line 56
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;)V

    .line 57
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setSkin(Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V
    .locals 1

    .line 61
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;

    invoke-virtual {p2, p3, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;

    invoke-direct {p0, p1, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;)V

    .line 62
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setSkin(Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;)V
    .locals 5

    .line 65
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;-><init>()V

    const/4 v0, 0x1

    .line 45
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isMovable:Z

    const/16 v1, 0x8

    .line 46
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->resizeBorder:I

    .line 47
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->keepWithinStage:Z

    if-eqz p1, :cond_0

    .line 67
    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/Touchable;->enabled:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setTouchable(Lcom/badlogic/gdx/scenes/scene2d/Touchable;)V

    .line 68
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setClip(Z)V

    .line 70
    new-instance v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    new-instance v2, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v3, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;->titleFont:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    iget-object v4, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;->titleFontColor:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v2, v3, v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;-><init>(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Lcom/badlogic/gdx/graphics/Color;)V

    invoke-direct {v1, p1, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;-><init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    iput-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleLabel:Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    .line 71
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleLabel:Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setEllipsis(Z)V

    .line 73
    new-instance p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$1;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$1;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Window;)V

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    .line 78
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleLabel:Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->add(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->expandX()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->fillX()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->minWidth(F)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 79
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 81
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;)V

    const/high16 p1, 0x43160000    # 150.0f

    .line 82
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setWidth(F)V

    .line 83
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setHeight(F)V

    .line 85
    new-instance p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$2;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$2;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Window;)V

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->addCaptureListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    .line 91
    new-instance p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$3;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Window;)V

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    return-void

    .line 66
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "title cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 9

    .line 238
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 239
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getKeyboardFocus()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->setKeyboardFocus(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    .line 241
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->keepWithinStage()V

    .line 243
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;->stageBackground:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-eqz v1, :cond_1

    .line 244
    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->stageToLocalCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 245
    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->tmpSize:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getWidth()F

    move-result v2

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getHeight()F

    move-result v0

    invoke-virtual {v1, v2, v0}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->stageToLocalCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 246
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getX()F

    move-result v0

    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float v5, v0, v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getY()F

    move-result v0

    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->tmpPosition:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-float v6, v0, v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getX()F

    move-result v0

    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->tmpSize:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float v7, v0, v1

    .line 247
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getY()F

    move-result v0

    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->tmpSize:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-float v8, v0, v1

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    .line 246
    invoke-virtual/range {v2 .. v8}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->drawStageBackground(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFFF)V

    .line 250
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V

    return-void
.end method

.method protected drawBackground(Lcom/badlogic/gdx/graphics/g2d/Batch;FFF)V
    .locals 3

    .line 260
    invoke-super {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->drawBackground(Lcom/badlogic/gdx/graphics/g2d/Batch;FFF)V

    .line 263
    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-virtual {p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object p3

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object p4

    iget p4, p4, Lcom/badlogic/gdx/graphics/Color;->a:F

    iput p4, p3, Lcom/badlogic/gdx/graphics/Color;->a:F

    .line 264
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getPadTop()F

    move-result p3

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getPadLeft()F

    move-result p4

    .line 265
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getWidth()F

    move-result v1

    sub-float/2addr v1, p4

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getPadRight()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-virtual {v0, v1, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->setSize(FF)V

    .line 266
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getHeight()F

    move-result v1

    sub-float/2addr v1, p3

    invoke-virtual {v0, p4, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->setPosition(FF)V

    const/4 p3, 0x1

    .line 267
    iput-boolean p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->drawTitleTable:Z

    .line 268
    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-virtual {p3, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V

    const/4 p1, 0x0

    .line 269
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->drawTitleTable:Z

    return-void
.end method

.method protected drawStageBackground(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFFF)V
    .locals 6

    .line 254
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    .line 255
    iget v1, v0, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v2, v0, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, v0, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v0, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v0, v0, p2

    invoke-interface {p1, v1, v2, v3, v0}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setColor(FFFF)V

    .line 256
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;

    iget-object v0, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;->stageBackground:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-object v1, p1

    move v2, p3

    move v3, p4

    move v4, p5

    move v5, p6

    invoke-interface/range {v0 .. v5}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V

    return-void
.end method

.method public getPrefWidth()F
    .locals 3

    .line 325
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->getPrefWidth()F

    move-result v0

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->getPrefWidth()F

    move-result v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getPadLeft()F

    move-result v2

    add-float/2addr v1, v2

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getPadRight()F

    move-result v2

    add-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public getStyle()Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;
    .locals 1

    .line 207
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;

    return-object v0
.end method

.method public getTitleLabel()Lcom/badlogic/gdx/scenes/scene2d/ui/Label;
    .locals 1

    .line 333
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleLabel:Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    return-object v0
.end method

.method public getTitleTable()Lcom/badlogic/gdx/scenes/scene2d/ui/Table;
    .locals 1

    .line 329
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    return-object v0
.end method

.method public hit(FFZ)Lcom/badlogic/gdx/scenes/scene2d/Actor;
    .locals 2

    .line 273
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isVisible()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 274
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->hit(FFZ)Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v0

    if-nez v0, :cond_2

    .line 275
    iget-boolean v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isModal:Z

    if-eqz v1, :cond_2

    if-eqz p3, :cond_1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getTouchable()Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    move-result-object p3

    sget-object v1, Lcom/badlogic/gdx/scenes/scene2d/Touchable;->enabled:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    if-ne p3, v1, :cond_2

    :cond_1
    return-object p0

    .line 276
    :cond_2
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getHeight()F

    move-result p3

    if-eqz v0, :cond_5

    if-ne v0, p0, :cond_3

    goto :goto_1

    :cond_3
    cmpg-float v1, p2, p3

    if-gtz v1, :cond_5

    .line 278
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getPadTop()F

    move-result v1

    sub-float/2addr p3, v1

    cmpl-float p2, p2, p3

    if-ltz p2, :cond_5

    const/4 p2, 0x0

    cmpl-float p2, p1, p2

    if-ltz p2, :cond_5

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getWidth()F

    move-result p2

    cmpg-float p1, p1, p2

    if-gtz p1, :cond_5

    move-object p1, v0

    .line 281
    :goto_0
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getParent()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object p2

    if-eq p2, p0, :cond_4

    .line 282
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getParent()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object p1

    goto :goto_0

    .line 283
    :cond_4
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getCell(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object p1

    if-eqz p1, :cond_5

    return-object p0

    :cond_5
    :goto_1
    return-object v0
.end method

.method public isDragging()Z
    .locals 1

    .line 321
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->dragging:Z

    return v0
.end method

.method public isModal()Z
    .locals 1

    .line 297
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isModal:Z

    return v0
.end method

.method public isMovable()Z
    .locals 1

    .line 289
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isMovable:Z

    return v0
.end method

.method public isResizable()Z
    .locals 1

    .line 309
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isResizable:Z

    return v0
.end method

.method public keepWithinStage()V
    .locals 9

    .line 211
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->keepWithinStage:Z

    if-nez v0, :cond_0

    return-void

    .line 212
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    .line 214
    :cond_1
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getCamera()Lcom/badlogic/gdx/graphics/Camera;

    move-result-object v1

    .line 215
    instance-of v2, v1, Lcom/badlogic/gdx/graphics/OrthographicCamera;

    if-eqz v2, :cond_5

    .line 216
    move-object v2, v1

    check-cast v2, Lcom/badlogic/gdx/graphics/OrthographicCamera;

    .line 217
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getWidth()F

    move-result v3

    .line 218
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getHeight()F

    move-result v0

    const/16 v4, 0x10

    .line 219
    invoke-virtual {p0, v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getX(I)F

    move-result v5

    iget-object v6, v1, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v6, v6, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v5, v6

    const/high16 v6, 0x40000000    # 2.0f

    div-float v7, v3, v6

    iget v8, v2, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    div-float v8, v7, v8

    cmpl-float v5, v5, v8

    if-lez v5, :cond_2

    .line 220
    iget-object v5, v1, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v5, v5, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v8, v2, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    div-float v8, v7, v8

    add-float/2addr v5, v8

    invoke-virtual {p0, v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getY(I)F

    move-result v8

    invoke-virtual {p0, v5, v8, v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setPosition(FFI)V

    :cond_2
    const/16 v4, 0x8

    .line 221
    invoke-virtual {p0, v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getX(I)F

    move-result v5

    iget-object v8, v1, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v5, v8

    neg-float v3, v3

    div-float/2addr v3, v6

    iget v8, v2, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    div-float/2addr v3, v8

    cmpg-float v3, v5, v3

    if-gez v3, :cond_3

    .line 222
    iget-object v3, v1, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v5, v2, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    div-float/2addr v7, v5

    sub-float/2addr v3, v7

    invoke-virtual {p0, v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getY(I)F

    move-result v5

    invoke-virtual {p0, v3, v5, v4}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setPosition(FFI)V

    :cond_3
    const/4 v3, 0x2

    .line 223
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getY(I)F

    move-result v4

    iget-object v5, v1, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v5, v5, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v4, v5

    div-float v5, v0, v6

    iget v7, v2, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    div-float v7, v5, v7

    cmpl-float v4, v4, v7

    if-lez v4, :cond_4

    .line 224
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getX(I)F

    move-result v4

    iget-object v7, v1, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v8, v2, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    div-float v8, v5, v8

    add-float/2addr v7, v8

    invoke-virtual {p0, v4, v7, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setPosition(FFI)V

    :cond_4
    const/4 v3, 0x4

    .line 225
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getY(I)F

    move-result v4

    iget-object v7, v1, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v4, v7

    neg-float v0, v0

    div-float/2addr v0, v6

    iget v6, v2, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    div-float/2addr v0, v6

    cmpg-float v0, v4, v0

    if-gez v0, :cond_9

    .line 226
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getX(I)F

    move-result v0

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v2, v2, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    div-float/2addr v5, v2

    sub-float/2addr v1, v5

    invoke-virtual {p0, v0, v1, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setPosition(FFI)V

    goto :goto_0

    .line 227
    :cond_5
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getParent()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object v1

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getRoot()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object v2

    if-ne v1, v2, :cond_9

    .line 228
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getWidth()F

    move-result v1

    .line 229
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getHeight()F

    move-result v0

    .line 230
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getX()F

    move-result v2

    const/4 v3, 0x0

    cmpg-float v2, v2, v3

    if-gez v2, :cond_6

    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setX(F)V

    .line 231
    :cond_6
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getRight()F

    move-result v2

    cmpl-float v2, v2, v1

    if-lez v2, :cond_7

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getWidth()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setX(F)V

    .line 232
    :cond_7
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getY()F

    move-result v1

    cmpg-float v1, v1, v3

    if-gez v1, :cond_8

    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setY(F)V

    .line 233
    :cond_8
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getTop()F

    move-result v1

    cmpl-float v1, v1, v0

    if-lez v1, :cond_9

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->getHeight()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setY(F)V

    :cond_9
    :goto_0
    return-void
.end method

.method public setKeepWithinStage(Z)V
    .locals 0

    .line 305
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->keepWithinStage:Z

    return-void
.end method

.method public setModal(Z)V
    .locals 0

    .line 301
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isModal:Z

    return-void
.end method

.method public setMovable(Z)V
    .locals 0

    .line 293
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isMovable:Z

    return-void
.end method

.method public setResizable(Z)V
    .locals 0

    .line 313
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->isResizable:Z

    return-void
.end method

.method public setResizeBorder(I)V
    .locals 0

    .line 317
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->resizeBorder:I

    return-void
.end method

.method public setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;)V
    .locals 3

    if-eqz p1, :cond_0

    .line 198
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;

    .line 199
    iget-object v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setBackground(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V

    .line 200
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->titleLabel:Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    new-instance v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v2, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;->titleFont:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;->titleFontColor:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v1, v2, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;-><init>(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Lcom/badlogic/gdx/graphics/Color;)V

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    .line 201
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->invalidateHierarchy()V

    return-void

    .line 197
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "style cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
