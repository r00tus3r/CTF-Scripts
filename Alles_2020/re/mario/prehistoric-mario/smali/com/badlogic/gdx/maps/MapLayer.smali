.class public Lcom/badlogic/gdx/maps/MapLayer;
.super Ljava/lang/Object;
.source "MapLayer.java"


# instance fields
.field private name:Ljava/lang/String;

.field private objects:Lcom/badlogic/gdx/maps/MapObjects;

.field private offsetX:F

.field private offsetY:F

.field private opacity:F

.field private parent:Lcom/badlogic/gdx/maps/MapLayer;

.field private properties:Lcom/badlogic/gdx/maps/MapProperties;

.field private renderOffsetDirty:Z

.field private renderOffsetX:F

.field private renderOffsetY:F

.field private visible:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 23
    iput-object v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->name:Ljava/lang/String;

    const/high16 v0, 0x3f800000    # 1.0f

    .line 24
    iput v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->opacity:F

    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->visible:Z

    .line 30
    iput-boolean v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->renderOffsetDirty:Z

    .line 32
    new-instance v0, Lcom/badlogic/gdx/maps/MapObjects;

    invoke-direct {v0}, Lcom/badlogic/gdx/maps/MapObjects;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->objects:Lcom/badlogic/gdx/maps/MapObjects;

    .line 33
    new-instance v0, Lcom/badlogic/gdx/maps/MapProperties;

    invoke-direct {v0}, Lcom/badlogic/gdx/maps/MapProperties;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->properties:Lcom/badlogic/gdx/maps/MapProperties;

    return-void
.end method


# virtual methods
.method protected calculateRenderOffsets()V
    .locals 2

    .line 126
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->parent:Lcom/badlogic/gdx/maps/MapLayer;

    if-eqz v0, :cond_0

    .line 127
    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/MapLayer;->calculateRenderOffsets()V

    .line 128
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->parent:Lcom/badlogic/gdx/maps/MapLayer;

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/MapLayer;->getRenderOffsetX()F

    move-result v0

    iget v1, p0, Lcom/badlogic/gdx/maps/MapLayer;->offsetX:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->renderOffsetX:F

    .line 129
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->parent:Lcom/badlogic/gdx/maps/MapLayer;

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/MapLayer;->getRenderOffsetY()F

    move-result v0

    iget v1, p0, Lcom/badlogic/gdx/maps/MapLayer;->offsetY:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->renderOffsetY:F

    goto :goto_0

    .line 131
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->offsetX:F

    iput v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->renderOffsetX:F

    .line 132
    iget v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->offsetY:F

    iput v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->renderOffsetY:F

    :goto_0
    const/4 v0, 0x0

    .line 134
    iput-boolean v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->renderOffsetDirty:Z

    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getObjects()Lcom/badlogic/gdx/maps/MapObjects;
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->objects:Lcom/badlogic/gdx/maps/MapObjects;

    return-object v0
.end method

.method public getOffsetX()F
    .locals 1

    .line 57
    iget v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->offsetX:F

    return v0
.end method

.method public getOffsetY()F
    .locals 1

    .line 68
    iget v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->offsetY:F

    return v0
.end method

.method public getOpacity()F
    .locals 1

    .line 47
    iget v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->opacity:F

    return v0
.end method

.method public getParent()Lcom/badlogic/gdx/maps/MapLayer;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->parent:Lcom/badlogic/gdx/maps/MapLayer;

    return-object v0
.end method

.method public getProperties()Lcom/badlogic/gdx/maps/MapProperties;
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->properties:Lcom/badlogic/gdx/maps/MapProperties;

    return-object v0
.end method

.method public getRenderOffsetX()F
    .locals 1

    .line 79
    iget-boolean v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->renderOffsetDirty:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/maps/MapLayer;->calculateRenderOffsets()V

    .line 80
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->renderOffsetX:F

    return v0
.end method

.method public getRenderOffsetY()F
    .locals 1

    .line 85
    iget-boolean v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->renderOffsetDirty:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/maps/MapLayer;->calculateRenderOffsets()V

    .line 86
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->renderOffsetY:F

    return v0
.end method

.method public invalidateRenderOffset()V
    .locals 1

    const/4 v0, 0x1

    .line 91
    iput-boolean v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->renderOffsetDirty:Z

    return-void
.end method

.method public isVisible()Z
    .locals 1

    .line 112
    iget-boolean v0, p0, Lcom/badlogic/gdx/maps/MapLayer;->visible:Z

    return v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 42
    iput-object p1, p0, Lcom/badlogic/gdx/maps/MapLayer;->name:Ljava/lang/String;

    return-void
.end method

.method public setOffsetX(F)V
    .locals 0

    .line 62
    iput p1, p0, Lcom/badlogic/gdx/maps/MapLayer;->offsetX:F

    .line 63
    invoke-virtual {p0}, Lcom/badlogic/gdx/maps/MapLayer;->invalidateRenderOffset()V

    return-void
.end method

.method public setOffsetY(F)V
    .locals 0

    .line 73
    iput p1, p0, Lcom/badlogic/gdx/maps/MapLayer;->offsetY:F

    .line 74
    invoke-virtual {p0}, Lcom/badlogic/gdx/maps/MapLayer;->invalidateRenderOffset()V

    return-void
.end method

.method public setOpacity(F)V
    .locals 0

    .line 52
    iput p1, p0, Lcom/badlogic/gdx/maps/MapLayer;->opacity:F

    return-void
.end method

.method public setParent(Lcom/badlogic/gdx/maps/MapLayer;)V
    .locals 1

    if-eq p1, p0, :cond_0

    .line 102
    iput-object p1, p0, Lcom/badlogic/gdx/maps/MapLayer;->parent:Lcom/badlogic/gdx/maps/MapLayer;

    return-void

    .line 101
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Can\'t set self as the parent"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setVisible(Z)V
    .locals 0

    .line 117
    iput-boolean p1, p0, Lcom/badlogic/gdx/maps/MapLayer;->visible:Z

    return-void
.end method
