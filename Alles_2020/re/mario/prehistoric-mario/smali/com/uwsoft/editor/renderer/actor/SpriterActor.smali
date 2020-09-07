.class public Lcom/uwsoft/editor/renderer/actor/SpriterActor;
.super Lcom/badlogic/gdx/scenes/scene2d/Actor;
.source "SpriterActor.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/actor/IBaseItem;


# instance fields
.field private animations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private currentAnimationIndex:I

.field private currentAnimationName:Ljava/lang/String;

.field private currentEntityIndex:I

.field private customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

.field private data:Lcom/brashmonkey/spriter/Data;

.field public dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

.field private drawer:Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;

.field private entities:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field private frameHeight:I

.field private frameWidth:I

.field private isLockedByLayer:Z

.field protected layerIndex:I

.field public mulX:F

.field public mulY:F

.field private parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

.field private player:Lcom/brashmonkey/spriter/Player;

.field protected reverse:Z


# direct methods
.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SpriterVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 4

    .line 55
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 26
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->mulX:F

    .line 27
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->mulY:F

    const/4 v1, 0x0

    .line 29
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->layerIndex:I

    .line 30
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->reverse:Z

    .line 31
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->isLockedByLayer:Z

    const/4 v2, 0x0

    .line 32
    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 37
    new-instance v2, Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-direct {v2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    const-string v2, ""

    .line 38
    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentAnimationName:Ljava/lang/String;

    .line 45
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->animations:Ljava/util/ArrayList;

    .line 46
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->entities:Ljava/util/ArrayList;

    .line 47
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentEntityIndex:I

    .line 56
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 57
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    .line 58
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->x:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setX(F)V

    .line 59
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->y:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setY(F)V

    .line 60
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/SpriterVO;->customVars:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 61
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->rotation:F

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setRotation(F)V

    .line 63
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->zIndex:I

    if-gez p1, :cond_0

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iput v1, p1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->zIndex:I

    .line 65
    :cond_0
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->tint:[F

    if-nez p1, :cond_1

    .line 66
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {p1, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    goto :goto_0

    .line 68
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/graphics/Color;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/SpriterVO;->tint:[F

    aget p2, p2, v1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->tint:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->tint:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/SpriterVO;->tint:[F

    const/4 v3, 0x3

    aget v2, v2, v3

    invoke-direct {p1, p2, v0, v1, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    .line 70
    :goto_0
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->initSpriteAnimation()V

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SpriterVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;-><init>(Lcom/uwsoft/editor/renderer/data/SpriterVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 52
    invoke-virtual {p0, p3}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    return-void
.end method

.method private initPlayer()V
    .locals 3

    .line 89
    new-instance v0, Lcom/brashmonkey/spriter/Player;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->data:Lcom/brashmonkey/spriter/Data;

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentEntityIndex:I

    invoke-virtual {v1, v2}, Lcom/brashmonkey/spriter/Data;->getEntity(I)Lcom/brashmonkey/spriter/Entity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/brashmonkey/spriter/Player;-><init>(Lcom/brashmonkey/spriter/Entity;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->player:Lcom/brashmonkey/spriter/Player;

    .line 91
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->player:Lcom/brashmonkey/spriter/Player;

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentAnimationIndex:I

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Player;->setAnimation(I)V

    .line 92
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->player:Lcom/brashmonkey/spriter/Player;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->scale:F

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->mulX:F

    mul-float v1, v1, v2

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Player;->setScale(F)Lcom/brashmonkey/spriter/Player;

    .line 94
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setRectangle()V

    return-void
.end method

.method private initSpriteAnimation()V
    .locals 3

    const/4 v0, 0x0

    .line 74
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setOriginX(F)V

    .line 75
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setOriginY(F)V

    .line 77
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->animationName:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getSCMLFile(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v0

    .line 78
    new-instance v1, Lcom/brashmonkey/spriter/SCMLReader;

    invoke-virtual {v0}, Lcom/badlogic/gdx/files/FileHandle;->read()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/brashmonkey/spriter/SCMLReader;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v1}, Lcom/brashmonkey/spriter/SCMLReader;->getData()Lcom/brashmonkey/spriter/Data;

    move-result-object v1

    iput-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->data:Lcom/brashmonkey/spriter/Data;

    .line 79
    new-instance v1, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->data:Lcom/brashmonkey/spriter/Data;

    invoke-direct {v1, v2}, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;-><init>(Lcom/brashmonkey/spriter/Data;)V

    .line 80
    invoke-virtual {v0}, Lcom/badlogic/gdx/files/FileHandle;->file()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;->load(Ljava/io/File;)V

    .line 81
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;-><init>()V

    .line 82
    new-instance v2, Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;

    invoke-direct {v2, v1, v0}, Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;-><init>(Lcom/brashmonkey/spriter/Loader;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;)V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->drawer:Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;

    .line 83
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->animation:I

    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentAnimationIndex:I

    .line 84
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->entity:I

    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentEntityIndex:I

    .line 85
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->initPlayer()V

    return-void
.end method

.method private setRectangle()V
    .locals 2

    .line 98
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->player:Lcom/brashmonkey/spriter/Player;

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Player;->update()V

    .line 99
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->player:Lcom/brashmonkey/spriter/Player;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Player;->getBoundingRectangle(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)Lcom/brashmonkey/spriter/Rectangle;

    move-result-object v0

    .line 100
    iget-object v1, v0, Lcom/brashmonkey/spriter/Rectangle;->size:Lcom/brashmonkey/spriter/Dimension;

    iget v1, v1, Lcom/brashmonkey/spriter/Dimension;->width:F

    float-to-int v1, v1

    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->frameWidth:I

    .line 101
    iget-object v0, v0, Lcom/brashmonkey/spriter/Rectangle;->size:Lcom/brashmonkey/spriter/Dimension;

    iget v0, v0, Lcom/brashmonkey/spriter/Dimension;->height:F

    float-to-int v0, v0

    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->frameHeight:I

    .line 102
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->frameWidth:I

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setWidth(F)V

    .line 103
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->frameHeight:I

    int-to-float v0, v0

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setHeight(F)V

    return-void
.end method


# virtual methods
.method public act(F)V
    .locals 0

    .line 109
    invoke-super {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->act(F)V

    return-void
.end method

.method public applyResolution(FF)V
    .locals 0

    .line 204
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->mulX:F

    .line 205
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->mulY:F

    .line 206
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->x:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->mulX:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setX(F)V

    .line 207
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->y:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->mulY:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setY(F)V

    .line 208
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->updateDataVO()V

    .line 209
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->initPlayer()V

    return-void
.end method

.method public dispose()V
    .locals 0

    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 3

    .line 115
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->getColor()Lcom/badlogic/gdx/graphics/Color;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/graphics/Color;->a:F

    mul-float v0, v0, p2

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-interface {p1, v1, v1, v1, v0}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setColor(FFFF)V

    .line 116
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V

    .line 118
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->player:Lcom/brashmonkey/spriter/Player;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->getY()F

    move-result v1

    invoke-virtual {p2, v0, v1}, Lcom/brashmonkey/spriter/Player;->setPosition(FF)Lcom/brashmonkey/spriter/Player;

    .line 119
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->player:Lcom/brashmonkey/spriter/Player;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->getWidth()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->getHeight()F

    move-result v2

    div-float/2addr v2, v1

    invoke-virtual {p2, v0, v2}, Lcom/brashmonkey/spriter/Player;->setPivot(FF)Lcom/brashmonkey/spriter/Player;

    .line 120
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->player:Lcom/brashmonkey/spriter/Player;

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->scale:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p2, v0}, Lcom/brashmonkey/spriter/Player;->setScale(F)Lcom/brashmonkey/spriter/Player;

    .line 121
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->player:Lcom/brashmonkey/spriter/Player;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->getRotation()F

    move-result v0

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->player:Lcom/brashmonkey/spriter/Player;

    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Player;->getAngle()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-virtual {p2, v0}, Lcom/brashmonkey/spriter/Player;->rotate(F)Lcom/brashmonkey/spriter/Player;

    .line 122
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->player:Lcom/brashmonkey/spriter/Player;

    invoke-virtual {p2}, Lcom/brashmonkey/spriter/Player;->update()V

    .line 123
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->drawer:Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->player:Lcom/brashmonkey/spriter/Player;

    invoke-virtual {p2, v0, p1}, Lcom/uwsoft/editor/renderer/utils/LibGdxDrawer;->beforeDraw(Lcom/brashmonkey/spriter/Player;Lcom/badlogic/gdx/graphics/g2d/Batch;)V

    return-void
.end method

.method public getAnimations()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 247
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->animations:Ljava/util/ArrayList;

    const/4 v0, 0x0

    .line 249
    :goto_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->data:Lcom/brashmonkey/spriter/Data;

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentEntityIndex:I

    invoke-virtual {v1, v2}, Lcom/brashmonkey/spriter/Data;->getEntity(I)Lcom/brashmonkey/spriter/Entity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Entity;->animations()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 250
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->animations:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->data:Lcom/brashmonkey/spriter/Data;

    iget v3, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentEntityIndex:I

    invoke-virtual {v2, v3}, Lcom/brashmonkey/spriter/Data;->getEntity(I)Lcom/brashmonkey/spriter/Entity;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/brashmonkey/spriter/Entity;->getAnimation(I)Lcom/brashmonkey/spriter/Animation;

    move-result-object v2

    iget-object v2, v2, Lcom/brashmonkey/spriter/Animation;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 252
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->animations:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getCurrentAnimationIndex()I
    .locals 1

    .line 282
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentAnimationIndex:I

    return v0
.end method

.method public getCurrentAnimationName()Ljava/lang/String;
    .locals 1

    .line 279
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentAnimationName:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrentEntityIndex()I
    .locals 1

    .line 276
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentEntityIndex:I

    return v0
.end method

.method public getCurrentEntityName()Ljava/lang/String;
    .locals 2

    .line 273
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->entities:Ljava/util/ArrayList;

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentEntityIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;
    .locals 1

    .line 225
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    return-object v0
.end method

.method public getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    return-object v0
.end method

.method public getEntities()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 268
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->data:Lcom/brashmonkey/spriter/Data;

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Data;->getEntities()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->entities:Ljava/util/ArrayList;

    .line 269
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->entities:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getLayerIndex()I
    .locals 1

    .line 175
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->layerIndex:I

    return v0
.end method

.method public getParentItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 214
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object v0
.end method

.method public isComposite()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isLockedByLayer()Z
    .locals 1

    .line 158
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->isLockedByLayer:Z

    return v0
.end method

.method public renew()V
    .locals 3

    .line 128
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setX(F)V

    .line 129
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setY(F)V

    .line 130
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->player:Lcom/brashmonkey/spriter/Player;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->scale:F

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->mulX:F

    mul-float v1, v1, v2

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Player;->setScale(F)Lcom/brashmonkey/spriter/Player;

    .line 131
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->rotation:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setRotation(F)V

    .line 132
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SpriterVO;->customVars:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 133
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setRectangle()V

    return-void
.end method

.method public setAnimation(I)V
    .locals 0

    .line 256
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentAnimationIndex:I

    .line 257
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->updateDataVO()V

    .line 258
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->initPlayer()V

    return-void
.end method

.method public setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0

    return-void
.end method

.method public setEntity(I)V
    .locals 0

    .line 261
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentEntityIndex:I

    const/4 p1, 0x0

    .line 262
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setAnimation(I)V

    .line 263
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->updateDataVO()V

    .line 264
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->initPlayer()V

    return-void
.end method

.method public setLayerIndex(I)V
    .locals 0

    .line 180
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->layerIndex:I

    return-void
.end method

.method public setLockByLayer(Z)V
    .locals 0

    .line 163
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->isLockedByLayer:Z

    return-void
.end method

.method public setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 219
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-void
.end method

.method public setSpriterScale(F)V
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iput p1, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->scale:F

    .line 138
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->renew()V

    return-void
.end method

.method public setTint(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 3

    const/4 v0, 0x4

    .line 142
    new-array v0, v0, [F

    .line 143
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 144
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 145
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 146
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 147
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v1

    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->tint:[F

    .line 148
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public updateDataVO()V
    .locals 3

    .line 185
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->getX()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->mulX:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->x:F

    .line 186
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->getY()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->mulY:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->y:F

    .line 187
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->getRotation()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->rotation:F

    .line 189
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->getZIndex()I

    move-result v0

    if-ltz v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->getZIndex()I

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->zIndex:I

    .line 193
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->layerName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->layerName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 194
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    const-string v1, "Default"

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->layerName:Ljava/lang/String;

    .line 197
    :cond_2
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentEntityIndex:I

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->entity:I

    .line 198
    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->currentAnimationIndex:I

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->animation:I

    .line 199
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-virtual {v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->saveAsString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->customVars:Ljava/lang/String;

    return-void
.end method
