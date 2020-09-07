.class public Lcom/uwsoft/editor/renderer/actor/TextBoxItem;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
.source "TextBoxItem.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/actor/IBaseItem;


# instance fields
.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

.field public dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

.field public essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field private isLockedByLayer:Z

.field protected layerIndex:I

.field public mulX:F

.field public mulY:F

.field private parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;


# direct methods
.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/TextBoxVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 5

    .line 31
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->defaultText:Ljava/lang/String;

    iget-object v1, p2, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    invoke-interface {v1}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getSkin()Lcom/uwsoft/editor/renderer/utils/MySkin;

    move-result-object v1

    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->style:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "default"

    goto :goto_0

    :cond_0
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->style:Ljava/lang/String;

    :goto_0
    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 15
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->mulX:F

    .line 16
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->mulY:F

    const/4 v1, 0x0

    .line 17
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->layerIndex:I

    .line 18
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->isLockedByLayer:Z

    const/4 v2, 0x0

    .line 19
    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 23
    new-instance v2, Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-direct {v2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    .line 33
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 34
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    .line 35
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->x:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setX(F)V

    .line 36
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->y:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setY(F)V

    .line 37
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->scaleX:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setScaleX(F)V

    .line 38
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->scaleY:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setScaleY(F)V

    .line 39
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->customVars:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 40
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->rotation:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setRotation(F)V

    .line 42
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->zIndex:I

    if-gez p1, :cond_1

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iput v1, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->zIndex:I

    .line 44
    :cond_1
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->tint:[F

    if-nez p1, :cond_2

    .line 45
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {p1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    goto :goto_1

    .line 47
    :cond_2
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->tint:[F

    aget p2, p2, v1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->tint:[F

    const/4 v2, 0x1

    aget v0, v0, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->tint:[F

    const/4 v3, 0x2

    aget v2, v2, v3

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->tint:[F

    const/4 v4, 0x3

    aget v3, v3, v4

    invoke-direct {p1, p2, v0, v2, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    .line 50
    :goto_1
    invoke-virtual {p0, v1}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setFocusTraversal(Z)V

    .line 51
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->renew()V

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/TextBoxVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;-><init>(Lcom/uwsoft/editor/renderer/data/TextBoxVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 27
    invoke-virtual {p0, p3}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    return-void
.end method


# virtual methods
.method public applyResolution(FF)V
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->scaleX:F

    mul-float v0, v0, p1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setScaleX(F)V

    .line 124
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->scaleY:F

    mul-float v0, v0, p2

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setScaleY(F)V

    .line 125
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->mulX:F

    .line 126
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->mulY:F

    .line 127
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->x:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->mulX:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setX(F)V

    .line 128
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->y:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->mulY:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setY(F)V

    .line 129
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->updateDataVO()V

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 165
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    :cond_0
    const/4 v0, 0x0

    .line 166
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    return-void
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    return-object v0
.end method

.method public bridge synthetic getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;
    .locals 1

    .line 11
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    move-result-object v0

    return-object v0
.end method

.method public getDataVO()Lcom/uwsoft/editor/renderer/data/TextBoxVO;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    return-object v0
.end method

.method public getLayerIndex()I
    .locals 1

    .line 134
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->layerIndex:I

    return v0
.end method

.method public getParentItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object v0
.end method

.method public isComposite()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isLockedByLayer()Z
    .locals 1

    .line 92
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->isLockedByLayer:Z

    return v0
.end method

.method public renew()V
    .locals 2

    .line 72
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->defaultText:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setText(Ljava/lang/String;)V

    .line 73
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->width:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->width:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setWidth(F)V

    .line 76
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->height:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    .line 77
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->height:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setHeight(F)V

    .line 79
    :cond_1
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->invalidate()V

    .line 81
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setX(F)V

    .line 82
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setY(F)V

    .line 83
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->scaleX:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setScaleX(F)V

    .line 84
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->scaleY:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setScaleY(F)V

    .line 85
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->rotation:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setRotation(F)V

    .line 86
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->customVars:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    return-void
.end method

.method public setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0

    .line 161
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-void
.end method

.method public setLayerIndex(I)V
    .locals 0

    .line 139
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->layerIndex:I

    return-void
.end method

.method public setLockByLayer(Z)V
    .locals 0

    .line 97
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->isLockedByLayer:Z

    return-void
.end method

.method public setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 147
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-void
.end method

.method public setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;Ljava/lang/String;)V
    .locals 0

    .line 151
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;)V

    .line 152
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iput-object p2, p1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->style:Ljava/lang/String;

    return-void
.end method

.method public setTint(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 3

    const/4 v0, 0x4

    .line 55
    new-array v0, v0, [F

    .line 56
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 57
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 58
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 59
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 60
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    move-result-object v1

    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->tint:[F

    .line 61
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public updateDataVO()V
    .locals 3

    .line 107
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->getX()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->mulX:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->x:F

    .line 108
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->getY()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->mulY:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->y:F

    .line 109
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->getRotation()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->rotation:F

    .line 111
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->getZIndex()I

    move-result v0

    if-ltz v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->getZIndex()I

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->zIndex:I

    .line 115
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->layerName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->layerName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 116
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    const-string v1, "Default"

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->layerName:Ljava/lang/String;

    .line 119
    :cond_2
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-virtual {v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->saveAsString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->customVars:Ljava/lang/String;

    return-void
.end method
