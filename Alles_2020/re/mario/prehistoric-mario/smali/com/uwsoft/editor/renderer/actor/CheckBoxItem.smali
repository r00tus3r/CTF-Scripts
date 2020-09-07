.class public Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/CheckBox;
.source "CheckBoxItem.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/actor/IBaseItem;


# instance fields
.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

.field public dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

.field public essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field private isLockedByLayer:Z

.field protected layerIndex:I

.field public mulX:F

.field public mulY:F

.field private parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;


# direct methods
.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/CheckBoxVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 4

    .line 32
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->text:Ljava/lang/String;

    iget-object v1, p2, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    invoke-interface {v1}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getSkin()Lcom/uwsoft/editor/renderer/utils/MySkin;

    move-result-object v1

    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->style:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "default"

    goto :goto_0

    :cond_0
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->style:Ljava/lang/String;

    :goto_0
    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/CheckBox;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 15
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->mulX:F

    .line 16
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->mulY:F

    const/4 v1, 0x0

    .line 17
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->layerIndex:I

    .line 19
    new-instance v2, Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-direct {v2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    .line 21
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->isLockedByLayer:Z

    const/4 v2, 0x0

    .line 22
    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 33
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    .line 34
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 35
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->x:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setX(F)V

    .line 36
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->y:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setY(F)V

    .line 37
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->scaleX:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setScaleX(F)V

    .line 38
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->scaleY:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setScaleY(F)V

    .line 39
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->customVars:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 41
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->rotation:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setRotation(F)V

    .line 43
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->zIndex:I

    if-gez p1, :cond_1

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iput v1, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->zIndex:I

    .line 45
    :cond_1
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->tint:[F

    if-nez p1, :cond_2

    .line 46
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {p1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    goto :goto_1

    .line 48
    :cond_2
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->tint:[F

    aget p2, p2, v1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->tint:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->tint:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->tint:[F

    const/4 v3, 0x3

    aget v2, v2, v3

    invoke-direct {p1, p2, v0, v1, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    :goto_1
    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/CheckBoxVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;-><init>(Lcom/uwsoft/editor/renderer/data/CheckBoxVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 28
    invoke-virtual {p0, p3}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    return-void
.end method


# virtual methods
.method public applyResolution(FF)V
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->scaleX:F

    mul-float v0, v0, p1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setScaleX(F)V

    .line 116
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->scaleY:F

    mul-float v0, v0, p2

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setScaleY(F)V

    .line 118
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->mulX:F

    .line 119
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->mulY:F

    .line 120
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->x:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->mulX:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setX(F)V

    .line 121
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->y:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->mulY:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setY(F)V

    .line 122
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->updateDataVO()V

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 159
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    :cond_0
    const/4 v0, 0x0

    .line 160
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    return-void
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    return-object v0
.end method

.method public getDataVO()Lcom/uwsoft/editor/renderer/data/CheckBoxVO;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    return-object v0
.end method

.method public bridge synthetic getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;
    .locals 1

    .line 11
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    move-result-object v0

    return-object v0
.end method

.method public getLayerIndex()I
    .locals 1

    .line 127
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->layerIndex:I

    return v0
.end method

.method public getParentItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object v0
.end method

.method public isComposite()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isLockedByLayer()Z
    .locals 1

    .line 84
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->isLockedByLayer:Z

    return v0
.end method

.method public renew()V
    .locals 5

    .line 69
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->text:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setText(Ljava/lang/String;)V

    .line 70
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->pack()V

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->layout()V

    .line 72
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setX(F)V

    .line 73
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setY(F)V

    .line 74
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->scaleX:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setScaleX(F)V

    .line 75
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->scaleY:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setScaleY(F)V

    .line 76
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->rotation:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setRotation(F)V

    .line 77
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->tint:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->tint:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->tint:[F

    const/4 v3, 0x2

    aget v2, v2, v3

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->tint:[F

    const/4 v4, 0x3

    aget v3, v3, v4

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setColor(FFFF)V

    .line 79
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->customVars:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    return-void
.end method

.method public setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0

    .line 154
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-void
.end method

.method public setLayerIndex(I)V
    .locals 0

    .line 132
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->layerIndex:I

    return-void
.end method

.method public setLockByLayer(Z)V
    .locals 0

    .line 89
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->isLockedByLayer:Z

    return-void
.end method

.method public setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 136
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-void
.end method

.method public setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/CheckBox$CheckBoxStyle;Ljava/lang/String;)V
    .locals 0

    .line 144
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/Button$ButtonStyle;)V

    .line 145
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iput-object p2, p1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->style:Ljava/lang/String;

    return-void
.end method

.method public setTint(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 3

    const/4 v0, 0x4

    .line 53
    new-array v0, v0, [F

    .line 54
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 55
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 56
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 57
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 58
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    move-result-object v1

    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->tint:[F

    .line 59
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public updateDataVO()V
    .locals 3

    .line 99
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->getX()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->mulX:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->x:F

    .line 100
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->getY()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->mulY:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->y:F

    .line 101
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->getRotation()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->rotation:F

    .line 103
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->getZIndex()I

    move-result v0

    if-ltz v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->getZIndex()I

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->zIndex:I

    .line 107
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->layerName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->layerName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 108
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    const-string v1, "Default"

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->layerName:Ljava/lang/String;

    .line 111
    :cond_2
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-virtual {v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->saveAsString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->customVars:Ljava/lang/String;

    return-void
.end method
