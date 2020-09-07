.class public Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox;
.source "SelectBoxItem.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/actor/IBaseItem;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox<",
        "TT;>;",
        "Lcom/uwsoft/editor/renderer/actor/IBaseItem;"
    }
.end annotation


# instance fields
.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

.field public dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

.field public essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field private isLockedByLayer:Z

.field protected layerIndex:I

.field public mulX:F

.field public mulY:F

.field private parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;


# direct methods
.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SelectBoxVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 4

    .line 31
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    invoke-interface {v0}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getSkin()Lcom/uwsoft/editor/renderer/utils/MySkin;

    move-result-object v0

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->style:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "default"

    goto :goto_0

    :cond_0
    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->style:Ljava/lang/String;

    :goto_0
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 15
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->mulX:F

    .line 16
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->mulY:F

    const/4 v1, 0x0

    .line 17
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->layerIndex:I

    .line 18
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->isLockedByLayer:Z

    const/4 v2, 0x0

    .line 19
    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 21
    new-instance v2, Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-direct {v2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    .line 32
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    .line 33
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 34
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->x:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setX(F)V

    .line 35
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->y:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setY(F)V

    .line 36
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->scaleX:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setScaleX(F)V

    .line 37
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->scaleY:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setScaleY(F)V

    .line 38
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->customVars:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 39
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->rotation:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setRotation(F)V

    .line 41
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->zIndex:I

    if-gez p1, :cond_1

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iput v1, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->zIndex:I

    .line 43
    :cond_1
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->tint:[F

    if-nez p1, :cond_2

    .line 44
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {p1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    goto :goto_1

    .line 46
    :cond_2
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->tint:[F

    aget p2, p2, v1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->tint:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->tint:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->tint:[F

    const/4 v3, 0x3

    aget v2, v2, v3

    invoke-direct {p1, p2, v0, v1, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    :goto_1
    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SelectBoxVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;-><init>(Lcom/uwsoft/editor/renderer/data/SelectBoxVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 27
    invoke-virtual {p0, p3}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    return-void
.end method


# virtual methods
.method public applyResolution(FF)V
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->scaleX:F

    mul-float v0, v0, p1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setScaleX(F)V

    .line 117
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->scaleY:F

    mul-float v0, v0, p2

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setScaleY(F)V

    .line 118
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->mulX:F

    .line 119
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->mulY:F

    .line 120
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->x:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->mulX:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setX(F)V

    .line 121
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->y:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->mulY:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setY(F)V

    .line 122
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->updateDataVO()V

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 157
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    :cond_0
    const/4 v0, 0x0

    .line 158
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    return-void
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;
    .locals 1

    .line 162
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    return-object v0
.end method

.method public bridge synthetic getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;
    .locals 1

    .line 11
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    move-result-object v0

    return-object v0
.end method

.method public getDataVO()Lcom/uwsoft/editor/renderer/data/SelectBoxVO;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    return-object v0
.end method

.method public getLayerIndex()I
    .locals 1

    .line 127
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->layerIndex:I

    return v0
.end method

.method public getParentItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object v0
.end method

.method public isComposite()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isLockedByLayer()Z
    .locals 1

    .line 85
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->isLockedByLayer:Z

    return v0
.end method

.method public renew()V
    .locals 2

    .line 67
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->pack()V

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->layout()V

    .line 68
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->width:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 69
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->width:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setWidth(F)V

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->height:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    .line 72
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->height:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setHeight(F)V

    .line 75
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setX(F)V

    .line 76
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setY(F)V

    .line 77
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->scaleX:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setScaleX(F)V

    .line 78
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->scaleY:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setScaleY(F)V

    .line 79
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->rotation:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setRotation(F)V

    .line 80
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->customVars:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    return-void
.end method

.method public setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0

    .line 153
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-void
.end method

.method public setLayerIndex(I)V
    .locals 0

    .line 132
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->layerIndex:I

    return-void
.end method

.method public setLockByLayer(Z)V
    .locals 0

    .line 90
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->isLockedByLayer:Z

    return-void
.end method

.method public setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 140
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-void
.end method

.method public setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxStyle;Ljava/lang/String;)V
    .locals 0

    .line 144
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/SelectBox$SelectBoxStyle;)V

    .line 145
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iput-object p2, p1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->style:Ljava/lang/String;

    return-void
.end method

.method public setTint(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 3

    const/4 v0, 0x4

    .line 51
    new-array v0, v0, [F

    .line 52
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 53
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 54
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 55
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 56
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    move-result-object v1

    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->tint:[F

    .line 57
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public updateDataVO()V
    .locals 3

    .line 100
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->getX()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->mulX:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->x:F

    .line 101
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->getY()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->mulY:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->y:F

    .line 102
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->getRotation()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->rotation:F

    .line 104
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->getZIndex()I

    move-result v0

    if-ltz v0, :cond_0

    .line 105
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->getZIndex()I

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->zIndex:I

    .line 108
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->layerName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->layerName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 109
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    const-string v1, "Default"

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->layerName:Ljava/lang/String;

    .line 112
    :cond_2
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-virtual {v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->saveAsString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->customVars:Ljava/lang/String;

    return-void
.end method
