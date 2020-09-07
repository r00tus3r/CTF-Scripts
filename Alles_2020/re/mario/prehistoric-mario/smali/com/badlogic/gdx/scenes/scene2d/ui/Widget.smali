.class public Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;
.super Lcom/badlogic/gdx/scenes/scene2d/Actor;
.source "Widget.java"

# interfaces
.implements Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;


# instance fields
.field private fillParent:Z

.field private layoutEnabled:Z

.field private needsLayout:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;-><init>()V

    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->needsLayout:Z

    .line 38
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->layoutEnabled:Z

    return-void
.end method


# virtual methods
.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 0

    .line 122
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->validate()V

    return-void
.end method

.method public getMaxHeight()F
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getMaxWidth()F
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getMinHeight()F
    .locals 1

    .line 45
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->getPrefHeight()F

    move-result v0

    return v0
.end method

.method public getMinWidth()F
    .locals 1

    .line 41
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->getPrefWidth()F

    move-result v0

    return v0
.end method

.method public getPrefHeight()F
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getPrefWidth()F
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public invalidate()V
    .locals 1

    const/4 v0, 0x1

    .line 97
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->needsLayout:Z

    return-void
.end method

.method public invalidateHierarchy()V
    .locals 2

    .line 101
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->layoutEnabled:Z

    if-nez v0, :cond_0

    return-void

    .line 102
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->invalidate()V

    .line 103
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->getParent()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object v0

    .line 104
    instance-of v1, v0, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->invalidateHierarchy()V

    :cond_1
    return-void
.end method

.method public layout()V
    .locals 0

    return-void
.end method

.method public needsLayout()Z
    .locals 1

    .line 93
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->needsLayout:Z

    return v0
.end method

.method public pack()V
    .locals 2

    .line 112
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->getPrefWidth()F

    move-result v0

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->getPrefHeight()F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->setSize(FF)V

    .line 113
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->validate()V

    return-void
.end method

.method public setFillParent(Z)V
    .locals 0

    .line 117
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->fillParent:Z

    return-void
.end method

.method public setLayoutEnabled(Z)V
    .locals 0

    .line 65
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->layoutEnabled:Z

    if-eqz p1, :cond_0

    .line 66
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->invalidateHierarchy()V

    :cond_0
    return-void
.end method

.method protected sizeChanged()V
    .locals 0

    .line 108
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->invalidate()V

    return-void
.end method

.method public validate()V
    .locals 4

    .line 70
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->layoutEnabled:Z

    if-nez v0, :cond_0

    return-void

    .line 72
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->getParent()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object v0

    .line 73
    iget-boolean v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->fillParent:Z

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    .line 75
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 76
    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getRoot()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object v2

    if-ne v0, v2, :cond_1

    .line 77
    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getWidth()F

    move-result v0

    .line 78
    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getHeight()F

    move-result v1

    goto :goto_0

    .line 80
    :cond_1
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Group;->getWidth()F

    move-result v1

    .line 81
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Group;->getHeight()F

    move-result v0

    move v3, v1

    move v1, v0

    move v0, v3

    .line 83
    :goto_0
    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->setSize(FF)V

    .line 86
    :cond_2
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->needsLayout:Z

    if-nez v0, :cond_3

    return-void

    :cond_3
    const/4 v0, 0x0

    .line 87
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->needsLayout:Z

    .line 88
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Widget;->layout()V

    return-void
.end method
