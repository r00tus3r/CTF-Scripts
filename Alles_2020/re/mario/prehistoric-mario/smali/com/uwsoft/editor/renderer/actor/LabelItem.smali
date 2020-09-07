.class public Lcom/uwsoft/editor/renderer/actor/LabelItem;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Label;
.source "LabelItem.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/actor/IBaseItem;


# static fields
.field private static font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont; = null

.field private static labelDefaultSize:I = 0xc

.field private static style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;


# instance fields
.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

.field public dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

.field public essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field private fontName:Ljava/lang/String;

.field private fontSize:I

.field private isLockedByLayer:Z

.field protected layerIndex:I

.field public mulX:F

.field public mulY:F

.field private parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/LabelVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 5

    .line 39
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->text:Ljava/lang/String;

    iget-object v1, p2, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->style:Ljava/lang/String;

    iget v3, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->size:I

    invoke-static {v1, v2, v3}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->generateStyle(Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;Ljava/lang/String;I)Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;-><init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 21
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulX:F

    .line 22
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulY:F

    const/4 v1, 0x0

    .line 23
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->layerIndex:I

    .line 24
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->isLockedByLayer:Z

    const/4 v2, 0x0

    .line 25
    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 28
    new-instance v2, Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-direct {v2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    .line 40
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    .line 41
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 42
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->x:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setX(F)V

    .line 43
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->y:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setY(F)V

    .line 45
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->rotation:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setRotation(F)V

    .line 47
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->zIndex:I

    if-gez p1, :cond_0

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iput v1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->zIndex:I

    .line 49
    :cond_0
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->tint:[F

    const/4 p2, 0x1

    if-nez p1, :cond_1

    .line 50
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {p1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    goto :goto_0

    .line 52
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->tint:[F

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/LabelVO;->tint:[F

    aget v1, v1, p2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/LabelVO;->tint:[F

    const/4 v3, 0x2

    aget v2, v2, v3

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/LabelVO;->tint:[F

    const/4 v4, 0x3

    aget v3, v3, v4

    invoke-direct {p1, v0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    .line 54
    :goto_0
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->align:I

    if-nez p1, :cond_2

    .line 55
    invoke-virtual {p0, p2}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setAlignment(I)V

    goto :goto_1

    .line 57
    :cond_2
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->align:I

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setAlignment(I)V

    .line 62
    :goto_1
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->width:F

    const/4 p2, 0x0

    cmpl-float p1, p1, p2

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getWidth()F

    move-result v0

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulX:F

    div-float/2addr v0, v1

    iput v0, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->width:F

    .line 63
    :cond_3
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->height:F

    cmpl-float p1, p1, p2

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getHeight()F

    move-result p2

    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulY:F

    div-float/2addr p2, v0

    iput p2, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->height:F

    .line 65
    :cond_4
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->renew()V

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/LabelVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/LabelItem;-><init>(Lcom/uwsoft/editor/renderer/data/LabelVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 34
    invoke-virtual {p0, p3}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    return-void
.end method

.method private static generateStyle(Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;Ljava/lang/String;I)Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;
    .locals 1

    if-nez p2, :cond_0

    .line 71
    sget p2, Lcom/uwsoft/editor/renderer/actor/LabelItem;->labelDefaultSize:I

    .line 73
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-interface {p0, p1, p2}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getBitmapFont(Ljava/lang/String;I)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object p0

    const/4 p1, 0x0

    invoke-direct {v0, p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;-><init>(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Lcom/badlogic/gdx/graphics/Color;)V

    sput-object v0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    .line 74
    sget-object p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    return-object p0
.end method


# virtual methods
.method public applyResolution(FF)V
    .locals 2

    .line 196
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulX:F

    .line 197
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulY:F

    .line 198
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setX(F)V

    .line 199
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setY(F)V

    .line 200
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->scaleX:F

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/LabelVO;->scaleY:F

    invoke-virtual {p0, v0, v1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setScale(FF)V

    .line 201
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->width:F

    mul-float v0, v0, p1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setWidth(F)V

    .line 202
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/LabelVO;->height:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setHeight(F)V

    .line 203
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->updateDataVO()V

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 244
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    :cond_0
    const/4 v0, 0x0

    .line 245
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    return-void
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 236
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;
    .locals 1

    .line 249
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    return-object v0
.end method

.method public getDataVO()Lcom/uwsoft/editor/renderer/data/LabelVO;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    return-object v0
.end method

.method public bridge synthetic getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/LabelVO;

    move-result-object v0

    return-object v0
.end method

.method public getLayerIndex()I
    .locals 1

    .line 211
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->layerIndex:I

    return v0
.end method

.method public getParentItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object v0
.end method

.method public getScaleX()F
    .locals 1

    .line 127
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getFontScaleX()F

    move-result v0

    return v0
.end method

.method public getScaleY()F
    .locals 1

    .line 132
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getFontScaleY()F

    move-result v0

    return v0
.end method

.method public isComposite()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isLockedByLayer()Z
    .locals 1

    .line 159
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->isLockedByLayer:Z

    return v0
.end method

.method public renew()V
    .locals 6

    .line 94
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->fontName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/LabelVO;->style:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->fontSize:I

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/LabelVO;->size:I

    if-eq v0, v1, :cond_3

    .line 95
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->size:I

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    sget v1, Lcom/uwsoft/editor/renderer/actor/LabelItem;->labelDefaultSize:I

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->size:I

    .line 96
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/LabelVO;->style:Ljava/lang/String;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/LabelVO;->size:I

    invoke-interface {v0, v1, v2}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getBitmapFont(Ljava/lang/String;I)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object v0

    sput-object v0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    .line 97
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    sget-object v1, Lcom/uwsoft/editor/renderer/actor/LabelItem;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;-><init>(Lcom/badlogic/gdx/graphics/g2d/BitmapFont;Lcom/badlogic/gdx/graphics/Color;)V

    sput-object v0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    .line 98
    sget-object v0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    .line 99
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->style:Ljava/lang/String;

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->fontName:Ljava/lang/String;

    .line 100
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->size:I

    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->fontSize:I

    .line 102
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->width:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getWidth()F

    move-result v2

    iget v3, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulX:F

    div-float/2addr v2, v3

    iput v2, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->width:F

    .line 103
    :cond_2
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->height:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getHeight()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulY:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->height:F

    .line 106
    :cond_3
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->text:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setText(Ljava/lang/CharSequence;)V

    .line 107
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/LabelVO;->customVars:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 108
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setX(F)V

    .line 109
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setY(F)V

    .line 110
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->rotation:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setRotation(F)V

    .line 111
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->tint:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/LabelVO;->tint:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/LabelVO;->tint:[F

    const/4 v4, 0x2

    aget v3, v3, v4

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v4, v4, Lcom/uwsoft/editor/renderer/data/LabelVO;->tint:[F

    const/4 v5, 0x3

    aget v4, v4, v5

    invoke-virtual {p0, v0, v1, v3, v4}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setColor(FFFF)V

    .line 112
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->scaleX:F

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/LabelVO;->scaleY:F

    invoke-virtual {p0, v0, v1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setScale(FF)V

    .line 113
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->align:I

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setAlignment(I)V

    .line 115
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->width:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setWidth(F)V

    .line 116
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->height:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setHeight(F)V

    .line 119
    invoke-virtual {p0, v2}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setWrap(Z)V

    return-void
.end method

.method public setAlign(I)V
    .locals 1

    .line 224
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iput p1, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->align:I

    return-void
.end method

.method public setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0

    .line 240
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-void
.end method

.method public setLayerIndex(I)V
    .locals 0

    .line 216
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->layerIndex:I

    return-void
.end method

.method public setLockByLayer(Z)V
    .locals 0

    .line 164
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->isLockedByLayer:Z

    return-void
.end method

.method public setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 232
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-void
.end method

.method public setScale(FF)V
    .locals 2

    const/4 v0, 0x0

    cmpg-float v1, p1, v0

    if-lez v1, :cond_1

    cmpg-float v0, p2, v0

    if-gtz v0, :cond_0

    goto :goto_0

    .line 153
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setFontScale(FF)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setScaleX(F)V
    .locals 1

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    return-void

    .line 139
    :cond_0
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setFontScaleX(F)V

    return-void
.end method

.method public setScaleY(F)V
    .locals 1

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    return-void

    .line 146
    :cond_0
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setFontScaleY(F)V

    return-void
.end method

.method public setStyle(Ljava/lang/String;I)V
    .locals 1

    .line 220
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iput-object p1, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->style:Ljava/lang/String;

    .line 221
    iput p2, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->size:I

    return-void
.end method

.method public setTint(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 3

    const/4 v0, 0x4

    .line 78
    new-array v0, v0, [F

    .line 79
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 80
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 81
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 82
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 83
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/LabelVO;

    move-result-object v1

    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/LabelVO;->tint:[F

    .line 84
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public updateDataVO()V
    .locals 3

    .line 174
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getY()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulY:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->y:F

    .line 175
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getX()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->mulX:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->x:F

    .line 176
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getRotation()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->rotation:F

    .line 178
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getZIndex()I

    move-result v0

    if-ltz v0, :cond_0

    .line 179
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getZIndex()I

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->zIndex:I

    .line 182
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->layerName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->layerName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 183
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    const-string v1, "Default"

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->layerName:Ljava/lang/String;

    .line 186
    :cond_2
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-virtual {v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->saveAsString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->customVars:Ljava/lang/String;

    .line 188
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getScaleX()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->scaleX:F

    .line 189
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getScaleY()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/LabelVO;->scaleY:F

    return-void
.end method
