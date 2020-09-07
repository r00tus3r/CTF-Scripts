.class public Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;
.super Lcom/badlogic/gdx/scenes/scene2d/Group;
.source "WidgetGroup.java"

# interfaces
.implements Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;


# instance fields
.field private fillParent:Z

.field private layoutEnabled:Z

.field private needsLayout:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Group;-><init>()V

    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->needsLayout:Z

    .line 39
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->layoutEnabled:Z

    return-void
.end method

.method public varargs constructor <init>([Lcom/badlogic/gdx/scenes/scene2d/Actor;)V
    .locals 3

    .line 45
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Group;-><init>()V

    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->needsLayout:Z

    .line 39
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->layoutEnabled:Z

    .line 46
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 47
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private setLayoutEnabled(Lcom/badlogic/gdx/scenes/scene2d/Group;Z)V
    .locals 4

    .line 80
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Group;->getChildren()Lcom/badlogic/gdx/utils/SnapshotArray;

    move-result-object p1

    .line 81
    iget v0, p1, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 82
    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/SnapshotArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 83
    instance-of v3, v2, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    if-eqz v3, :cond_0

    .line 84
    check-cast v2, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    invoke-interface {v2, p2}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->setLayoutEnabled(Z)V

    goto :goto_1

    .line 85
    :cond_0
    instance-of v3, v2, Lcom/badlogic/gdx/scenes/scene2d/Group;

    if-eqz v3, :cond_1

    .line 86
    check-cast v2, Lcom/badlogic/gdx/scenes/scene2d/Group;

    invoke-direct {p0, v2, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->setLayoutEnabled(Lcom/badlogic/gdx/scenes/scene2d/Group;Z)V

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method


# virtual methods
.method protected childrenChanged()V
    .locals 0

    .line 143
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->invalidateHierarchy()V

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 0

    .line 169
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->validate()V

    .line 170
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/Group;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V

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

    .line 55
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->getPrefHeight()F

    move-result v0

    return v0
.end method

.method public getMinWidth()F
    .locals 1

    .line 51
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->getPrefWidth()F

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

    .line 133
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->needsLayout:Z

    return-void
.end method

.method public invalidateHierarchy()V
    .locals 2

    .line 137
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->invalidate()V

    .line 138
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->getParent()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object v0

    .line 139
    instance-of v1, v0, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;

    invoke-interface {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/Layout;->invalidateHierarchy()V

    :cond_0
    return-void
.end method

.method public layout()V
    .locals 0

    return-void
.end method

.method public needsLayout()Z
    .locals 1

    .line 129
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->needsLayout:Z

    return v0
.end method

.method public pack()V
    .locals 2

    .line 151
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->getPrefWidth()F

    move-result v0

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->getPrefHeight()F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->setSize(FF)V

    .line 152
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->validate()V

    .line 155
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->getPrefWidth()F

    move-result v0

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->getPrefHeight()F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->setSize(FF)V

    .line 156
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->validate()V

    return-void
.end method

.method public setFillParent(Z)V
    .locals 0

    .line 160
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->fillParent:Z

    return-void
.end method

.method public setLayoutEnabled(Z)V
    .locals 0

    .line 75
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->layoutEnabled:Z

    .line 76
    invoke-direct {p0, p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->setLayoutEnabled(Lcom/badlogic/gdx/scenes/scene2d/Group;Z)V

    return-void
.end method

.method protected sizeChanged()V
    .locals 0

    .line 147
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->invalidate()V

    return-void
.end method

.method public validate()V
    .locals 4

    .line 91
    iget-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->layoutEnabled:Z

    if-nez v0, :cond_0

    return-void

    .line 93
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->getParent()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object v0

    .line 94
    iget-boolean v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->fillParent:Z

    if-eqz v1, :cond_3

    if-eqz v0, :cond_3

    .line 96
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 97
    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getRoot()Lcom/badlogic/gdx/scenes/scene2d/Group;

    move-result-object v2

    if-ne v0, v2, :cond_1

    .line 98
    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getWidth()F

    move-result v2

    .line 99
    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getHeight()F

    move-result v1

    goto :goto_0

    .line 101
    :cond_1
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Group;->getWidth()F

    move-result v2

    .line 102
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Group;->getHeight()F

    move-result v1

    .line 104
    :goto_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->getWidth()F

    move-result v3

    cmpl-float v3, v3, v2

    if-nez v3, :cond_2

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->getHeight()F

    move-result v3

    cmpl-float v3, v3, v1

    if-eqz v3, :cond_3

    .line 105
    :cond_2
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->setWidth(F)V

    .line 106
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->setHeight(F)V

    .line 107
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->invalidate()V

    .line 111
    :cond_3
    iget-boolean v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->needsLayout:Z

    if-nez v1, :cond_4

    return-void

    :cond_4
    const/4 v1, 0x0

    .line 112
    iput-boolean v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->needsLayout:Z

    .line 113
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->layout()V

    .line 117
    iget-boolean v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->needsLayout:Z

    if-eqz v2, :cond_7

    .line 118
    instance-of v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    :goto_1
    const/4 v2, 0x5

    if-ge v0, v2, :cond_7

    .line 120
    iput-boolean v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->needsLayout:Z

    .line 121
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->layout()V

    .line 122
    iget-boolean v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/WidgetGroup;->needsLayout:Z

    if-nez v2, :cond_6

    goto :goto_2

    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_7
    :goto_2
    return-void
.end method
