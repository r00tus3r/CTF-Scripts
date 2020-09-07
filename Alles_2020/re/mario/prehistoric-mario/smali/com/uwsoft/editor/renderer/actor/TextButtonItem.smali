.class public Lcom/uwsoft/editor/renderer/actor/TextButtonItem;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/TextButton;
.source "TextButtonItem.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/actor/IBaseItem;


# instance fields
.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

.field public dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

.field public essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field private isLockedByLayer:Z

.field protected layerIndex:I

.field public mulX:F

.field public mulY:F

.field private parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;


# direct methods
.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/ButtonVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 4

    .line 32
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/ButtonVO;->text:Ljava/lang/String;

    iget-object v1, p2, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    invoke-interface {v1}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getSkin()Lcom/uwsoft/editor/renderer/utils/MySkin;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextButton;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 15
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->mulX:F

    .line 16
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->mulY:F

    const/4 v1, 0x0

    .line 18
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->layerIndex:I

    .line 19
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->isLockedByLayer:Z

    const/4 v2, 0x0

    .line 20
    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 24
    new-instance v2, Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-direct {v2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    .line 33
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    .line 35
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 36
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/ButtonVO;->x:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setX(F)V

    .line 37
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/ButtonVO;->y:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setY(F)V

    .line 40
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/ButtonVO;->customVars:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 41
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->getLabel()Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    move-result-object p1

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget p2, p2, Lcom/uwsoft/editor/renderer/data/ButtonVO;->scaleX:F

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/ButtonVO;->scaleY:F

    invoke-virtual {p1, p2, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setFontScale(FF)V

    .line 42
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/ButtonVO;->rotation:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setRotation(F)V

    .line 44
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/ButtonVO;->zIndex:I

    if-gez p1, :cond_0

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iput v1, p1, Lcom/uwsoft/editor/renderer/data/ButtonVO;->zIndex:I

    .line 46
    :cond_0
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/ButtonVO;->tint:[F

    if-nez p1, :cond_1

    .line 47
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {p1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    goto :goto_0

    .line 49
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/ButtonVO;->tint:[F

    aget p2, p2, v1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/ButtonVO;->tint:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/ButtonVO;->tint:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/ButtonVO;->tint:[F

    const/4 v3, 0x3

    aget v2, v2, v3

    invoke-direct {p1, p2, v0, v1, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    .line 51
    :goto_0
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->pack()V

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->layout()V

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/ButtonVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;-><init>(Lcom/uwsoft/editor/renderer/data/ButtonVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 28
    invoke-virtual {p0, p3}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    return-void
.end method


# virtual methods
.method public applyResolution(FF)V
    .locals 2

    .line 106
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->mulX:F

    .line 107
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->mulY:F

    .line 108
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/ButtonVO;->x:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->mulX:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setX(F)V

    .line 109
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/ButtonVO;->y:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->mulY:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setY(F)V

    .line 110
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->getLabel()Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    move-result-object p1

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget p2, p2, Lcom/uwsoft/editor/renderer/data/ButtonVO;->scaleX:F

    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->mulX:F

    mul-float p2, p2, v0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ButtonVO;->scaleY:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p1, p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setFontScale(FF)V

    .line 111
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->updateDataVO()V

    .line 112
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->pack()V

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->layout()V

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 143
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    :cond_0
    const/4 v0, 0x0

    .line 144
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    return-void
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    return-object v0
.end method

.method public getDataVO()Lcom/uwsoft/editor/renderer/data/ButtonVO;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    return-object v0
.end method

.method public bridge synthetic getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;
    .locals 1

    .line 11
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/ButtonVO;

    move-result-object v0

    return-object v0
.end method

.method public getLayerIndex()I
    .locals 1

    .line 117
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->layerIndex:I

    return v0
.end method

.method public getParentItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

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
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->isLockedByLayer:Z

    return v0
.end method

.method public renew()V
    .locals 4

    .line 78
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/ButtonVO;->text:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setText(Ljava/lang/String;)V

    .line 79
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/ButtonVO;->customVars:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 81
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ButtonVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setX(F)V

    .line 82
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ButtonVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setY(F)V

    .line 85
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->getLabel()Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    move-result-object v0

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/ButtonVO;->scaleX:F

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->mulX:F

    mul-float v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/ButtonVO;->scaleY:F

    iget v3, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->mulY:F

    mul-float v2, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setFontScale(FF)V

    .line 86
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ButtonVO;->rotation:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setRotation(F)V

    .line 87
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->pack()V

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->layout()V

    return-void
.end method

.method public setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0

    .line 139
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-void
.end method

.method public setLayerIndex(I)V
    .locals 0

    .line 122
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->layerIndex:I

    return-void
.end method

.method public setLockByLayer(Z)V
    .locals 0

    .line 97
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->isLockedByLayer:Z

    return-void
.end method

.method public setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 130
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

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
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/ButtonVO;

    move-result-object v1

    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/ButtonVO;->tint:[F

    .line 61
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public updateDataVO()V
    .locals 2

    .line 70
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->getX()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/ButtonVO;->x:F

    .line 71
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->getY()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/ButtonVO;->y:F

    .line 73
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-virtual {v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->saveAsString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/ButtonVO;->customVars:Ljava/lang/String;

    return-void
.end method
