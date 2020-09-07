.class public Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;
.super Ljava/lang/Object;
.source "BaseDrawable.java"

# interfaces
.implements Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;


# instance fields
.field private bottomHeight:F

.field private leftWidth:F

.field private minHeight:F

.field private minWidth:F

.field private name:Ljava/lang/String;

.field private rightWidth:F

.field private topHeight:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    instance-of v0, p1, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->name:Ljava/lang/String;

    .line 34
    :cond_0
    invoke-interface {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getLeftWidth()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->leftWidth:F

    .line 35
    invoke-interface {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getRightWidth()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->rightWidth:F

    .line 36
    invoke-interface {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getTopHeight()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->topHeight:F

    .line 37
    invoke-interface {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getBottomHeight()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->bottomHeight:F

    .line 38
    invoke-interface {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinWidth()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->minWidth:F

    .line 39
    invoke-interface {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getMinHeight()F

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->minHeight:F

    return-void
.end method


# virtual methods
.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;FFFF)V
    .locals 0

    return-void
.end method

.method public getBottomHeight()F
    .locals 1

    .line 70
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->bottomHeight:F

    return v0
.end method

.method public getLeftWidth()F
    .locals 1

    .line 46
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->leftWidth:F

    return v0
.end method

.method public getMinHeight()F
    .locals 1

    .line 93
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->minHeight:F

    return v0
.end method

.method public getMinWidth()F
    .locals 1

    .line 85
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->minWidth:F

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getRightWidth()F
    .locals 1

    .line 54
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->rightWidth:F

    return v0
.end method

.method public getTopHeight()F
    .locals 1

    .line 62
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->topHeight:F

    return v0
.end method

.method public setBottomHeight(F)V
    .locals 0

    .line 74
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->bottomHeight:F

    return-void
.end method

.method public setLeftWidth(F)V
    .locals 0

    .line 50
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->leftWidth:F

    return-void
.end method

.method public setMinHeight(F)V
    .locals 0

    .line 97
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->minHeight:F

    return-void
.end method

.method public setMinSize(FF)V
    .locals 0

    .line 101
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->setMinWidth(F)V

    .line 102
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->setMinHeight(F)V

    return-void
.end method

.method public setMinWidth(F)V
    .locals 0

    .line 89
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->minWidth:F

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 110
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->name:Ljava/lang/String;

    return-void
.end method

.method public setPadding(FFFF)V
    .locals 0

    .line 78
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->setTopHeight(F)V

    .line 79
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->setLeftWidth(F)V

    .line 80
    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->setBottomHeight(F)V

    .line 81
    invoke-virtual {p0, p4}, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->setRightWidth(F)V

    return-void
.end method

.method public setRightWidth(F)V
    .locals 0

    .line 58
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->rightWidth:F

    return-void
.end method

.method public setTopHeight(F)V
    .locals 0

    .line 66
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->topHeight:F

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/utils/BaseDrawable;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->getSimpleName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method
