.class public Lcom/uwsoft/editor/renderer/data/CompositeVO;
.super Ljava/lang/Object;
.source "CompositeVO.java"


# instance fields
.field public layers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/LayerItemVO;",
            ">;"
        }
    .end annotation
.end field

.field public sButtons:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/ButtonVO;",
            ">;"
        }
    .end annotation
.end field

.field public sCheckBoxes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/CheckBoxVO;",
            ">;"
        }
    .end annotation
.end field

.field public sComposites:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/CompositeItemVO;",
            ">;"
        }
    .end annotation
.end field

.field public sImage9patchs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/Image9patchVO;",
            ">;"
        }
    .end annotation
.end field

.field public sImages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/SimpleImageVO;",
            ">;"
        }
    .end annotation
.end field

.field public sLabels:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/LabelVO;",
            ">;"
        }
    .end annotation
.end field

.field public sLights:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/LightVO;",
            ">;"
        }
    .end annotation
.end field

.field public sParticleEffects:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;",
            ">;"
        }
    .end annotation
.end field

.field public sSelectBoxes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/SelectBoxVO;",
            ">;"
        }
    .end annotation
.end field

.field public sSpineAnimations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/SpineVO;",
            ">;"
        }
    .end annotation
.end field

.field public sSpriteAnimations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;",
            ">;"
        }
    .end annotation
.end field

.field public sSpriterAnimations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/SpriterVO;",
            ">;"
        }
    .end annotation
.end field

.field public sTextBox:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/TextBoxVO;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImage9patchs:Ljava/util/ArrayList;

    .line 14
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sTextBox:Ljava/util/ArrayList;

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sButtons:Ljava/util/ArrayList;

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLabels:Ljava/util/ArrayList;

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sCheckBoxes:Ljava/util/ArrayList;

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSelectBoxes:Ljava/util/ArrayList;

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sParticleEffects:Ljava/util/ArrayList;

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLights:Ljava/util/ArrayList;

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpineAnimations:Ljava/util/ArrayList;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriterAnimations:Ljava/util/ArrayList;

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/CompositeVO;)V
    .locals 2

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImage9patchs:Ljava/util/ArrayList;

    .line 14
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sTextBox:Ljava/util/ArrayList;

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sButtons:Ljava/util/ArrayList;

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLabels:Ljava/util/ArrayList;

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sCheckBoxes:Ljava/util/ArrayList;

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSelectBoxes:Ljava/util/ArrayList;

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sParticleEffects:Ljava/util/ArrayList;

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLights:Ljava/util/ArrayList;

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpineAnimations:Ljava/util/ArrayList;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriterAnimations:Ljava/util/ArrayList;

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    if-nez p1, :cond_0

    return-void

    .line 36
    :cond_0
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->update(Lcom/uwsoft/editor/renderer/data/CompositeVO;)V

    return-void
.end method

.method private getAllItemsRecursive(Ljava/util/ArrayList;Lcom/uwsoft/editor/renderer/data/CompositeVO;)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/MainItemVO;",
            ">;",
            "Lcom/uwsoft/editor/renderer/data/CompositeVO;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/MainItemVO;",
            ">;"
        }
    .end annotation

    .line 298
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sButtons:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;

    .line 299
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 301
    :cond_0
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sCheckBoxes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;

    .line 302
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 304
    :cond_1
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImage9patchs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;

    .line 305
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 307
    :cond_2
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;

    .line 308
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 310
    :cond_3
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLabels:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;

    .line 311
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 313
    :cond_4
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLights:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;

    .line 314
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 316
    :cond_5
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sParticleEffects:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;

    .line 317
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 319
    :cond_6
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSelectBoxes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;

    .line 320
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 322
    :cond_7
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpineAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;

    .line 323
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 325
    :cond_8
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;

    .line 326
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 328
    :cond_9
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriterAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;

    .line 329
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .line 331
    :cond_a
    iget-object v0, p2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sTextBox:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;

    .line 332
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 334
    :cond_b
    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_c
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    .line 335
    iget-object v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-direct {p0, p1, v1}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getAllItemsRecursive(Ljava/util/ArrayList;Lcom/uwsoft/editor/renderer/data/CompositeVO;)Ljava/util/ArrayList;

    move-result-object p1

    .line 336
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_c

    :cond_c
    return-object p1
.end method


# virtual methods
.method public addItem(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V
    .locals 3

    .line 96
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SimpleImageVO"

    .line 98
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 99
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    const-string v1, "Image9patchVO"

    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 102
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImage9patchs:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    const-string v1, "TextBoxVO"

    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 105
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sTextBox:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    const-string v1, "ButtonVO"

    .line 107
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 108
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sButtons:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/ButtonVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    const-string v1, "LabelVO"

    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 111
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLabels:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/LabelVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_4
    const-string v1, "CompositeItemVO"

    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 114
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5
    const-string v1, "CheckBoxVO"

    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 117
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sCheckBoxes:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_6
    const-string v1, "SelectBoxVO"

    .line 119
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 120
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSelectBoxes:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7
    const-string v1, "ParticleEffectVO"

    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 123
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sParticleEffects:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_8
    const-string v1, "LightVO"

    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 126
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLights:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/LightVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_9
    const-string v1, "SpineVO"

    .line 128
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 129
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpineAnimations:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SpineVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_a
    const-string v1, "SpriterVO"

    .line 131
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 132
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriterAnimations:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SpriterVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_b
    const-string v1, "SpriteAnimationVO"

    .line 134
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 135
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    check-cast p1, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_c
    return-void
.end method

.method public clear()V
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 184
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sTextBox:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 185
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sButtons:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 186
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLabels:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 187
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 188
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sCheckBoxes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 189
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSelectBoxes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 190
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sParticleEffects:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 191
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLights:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 192
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpineAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 193
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 194
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriterAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public getAllItems()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/MainItemVO;",
            ">;"
        }
    .end annotation

    .line 291
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 292
    invoke-direct {p0, v0, p0}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getAllItemsRecursive(Ljava/util/ArrayList;Lcom/uwsoft/editor/renderer/data/CompositeVO;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getRecursiveFontList()[Lcom/uwsoft/editor/renderer/resources/FontSizePair;
    .locals 6

    .line 276
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 277
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLabels:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/LabelVO;

    .line 278
    new-instance v3, Lcom/uwsoft/editor/renderer/resources/FontSizePair;

    iget-object v4, v2, Lcom/uwsoft/editor/renderer/data/LabelVO;->style:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "arial"

    goto :goto_1

    :cond_0
    iget-object v4, v2, Lcom/uwsoft/editor/renderer/data/LabelVO;->style:Ljava/lang/String;

    :goto_1
    iget v5, v2, Lcom/uwsoft/editor/renderer/data/LabelVO;->size:I

    if-nez v5, :cond_1

    const/16 v2, 0xc

    goto :goto_2

    :cond_1
    iget v2, v2, Lcom/uwsoft/editor/renderer/data/LabelVO;->size:I

    :goto_2
    invoke-direct {v3, v4, v2}, Lcom/uwsoft/editor/renderer/resources/FontSizePair;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 280
    :cond_2
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    .line 281
    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-virtual {v2}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getRecursiveFontList()[Lcom/uwsoft/editor/renderer/resources/FontSizePair;

    move-result-object v2

    .line 282
    invoke-static {v0, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_3

    .line 284
    :cond_3
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v1

    new-array v1, v1, [Lcom/uwsoft/editor/renderer/resources/FontSizePair;

    .line 285
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    return-object v1
.end method

.method public getRecursiveParticleEffectsList()[Ljava/lang/String;
    .locals 3

    .line 216
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 217
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sParticleEffects:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    .line 218
    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->particleName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 220
    :cond_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    .line 221
    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-virtual {v2}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getRecursiveParticleEffectsList()[Ljava/lang/String;

    move-result-object v2

    .line 222
    invoke-static {v0, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_1

    .line 224
    :cond_1
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    .line 225
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    return-object v1
.end method

.method public getRecursiveSpineAnimationList()[Ljava/lang/String;
    .locals 3

    .line 231
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 232
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpineAnimations:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SpineVO;

    .line 233
    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/SpineVO;->animationName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 235
    :cond_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    .line 236
    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-virtual {v2}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getRecursiveSpineAnimationList()[Ljava/lang/String;

    move-result-object v2

    .line 237
    invoke-static {v0, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_1

    .line 239
    :cond_1
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    .line 240
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    return-object v1
.end method

.method public getRecursiveSpriteAnimationList()[Ljava/lang/String;
    .locals 3

    .line 246
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 247
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    .line 248
    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->animationName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 250
    :cond_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    .line 251
    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-virtual {v2}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getRecursiveSpriteAnimationList()[Ljava/lang/String;

    move-result-object v2

    .line 252
    invoke-static {v0, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_1

    .line 254
    :cond_1
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    .line 255
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    return-object v1
.end method

.method public getRecursiveSpriterAnimationList()[Ljava/lang/String;
    .locals 3

    .line 261
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 262
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriterAnimations:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SpriterVO;

    .line 263
    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/SpriterVO;->animationName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 265
    :cond_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    .line 266
    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-virtual {v2}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getRecursiveSpriterAnimationList()[Ljava/lang/String;

    move-result-object v2

    .line 267
    invoke-static {v0, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_1

    .line 269
    :cond_1
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    .line 270
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    return-object v1
.end method

.method public isEmpty()Z
    .locals 1

    .line 198
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImage9patchs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sButtons:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sCheckBoxes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLabels:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLights:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sParticleEffects:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sCheckBoxes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriterAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpineAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSelectBoxes:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sTextBox:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public removeItem(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V
    .locals 3

    .line 140
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SimpleImageVO"

    .line 141
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 142
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_0
    const-string v1, "Image9patchVO"

    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 145
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImage9patchs:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_1
    const-string v1, "TextBoxVO"

    .line 147
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 148
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sTextBox:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_2
    const-string v1, "ButtonVO"

    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 151
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sButtons:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/ButtonVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_3
    const-string v1, "LabelVO"

    .line 153
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 154
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLabels:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/LabelVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_4
    const-string v1, "CompositeItemVO"

    .line 156
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 157
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_5
    const-string v1, "CheckBoxVO"

    .line 159
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 160
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sCheckBoxes:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_6
    const-string v1, "SelectBoxVO"

    .line 162
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 163
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSelectBoxes:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_7
    const-string v1, "ParticleEffectVO"

    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 166
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sParticleEffects:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_8
    const-string v1, "LightVO"

    .line 168
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 169
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLights:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/LightVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_9
    const-string v1, "SpineVO"

    .line 171
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 172
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpineAnimations:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SpineVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_a
    const-string v1, "SpriteAnimationVO"

    .line 174
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 175
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    move-object v2, p1

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_b
    const-string v1, "SpriterVO"

    .line 177
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 178
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriterAnimations:Ljava/util/ArrayList;

    check-cast p1, Lcom/uwsoft/editor/renderer/data/SpriterVO;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_c
    return-void
.end method

.method public update(Lcom/uwsoft/editor/renderer/data/CompositeVO;)V
    .locals 5

    .line 40
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->clear()V

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 41
    :goto_0
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 42
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    new-instance v3, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    iget-object v4, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    invoke-direct {v3, v4}, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;-><init>(Lcom/uwsoft/editor/renderer/data/SimpleImageVO;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 44
    :goto_1
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImage9patchs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 45
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImage9patchs:Ljava/util/ArrayList;

    new-instance v3, Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    iget-object v4, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImage9patchs:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    invoke-direct {v3, v4}, Lcom/uwsoft/editor/renderer/data/Image9patchVO;-><init>(Lcom/uwsoft/editor/renderer/data/Image9patchVO;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    .line 47
    :goto_2
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sTextBox:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 48
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sTextBox:Ljava/util/ArrayList;

    new-instance v3, Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget-object v4, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sTextBox:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    invoke-direct {v3, v4}, Lcom/uwsoft/editor/renderer/data/TextBoxVO;-><init>(Lcom/uwsoft/editor/renderer/data/TextBoxVO;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    .line 50
    :goto_3
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sButtons:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 51
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sButtons:Ljava/util/ArrayList;

    new-instance v3, Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget-object v4, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sButtons:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/uwsoft/editor/renderer/data/ButtonVO;

    invoke-direct {v3, v4}, Lcom/uwsoft/editor/renderer/data/ButtonVO;-><init>(Lcom/uwsoft/editor/renderer/data/ButtonVO;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_3
    const/4 v1, 0x0

    .line 53
    :goto_4
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLabels:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 54
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLabels:Ljava/util/ArrayList;

    new-instance v3, Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget-object v4, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLabels:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/uwsoft/editor/renderer/data/LabelVO;

    invoke-direct {v3, v4}, Lcom/uwsoft/editor/renderer/data/LabelVO;-><init>(Lcom/uwsoft/editor/renderer/data/LabelVO;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_4
    const/4 v1, 0x0

    .line 56
    :goto_5
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 57
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    new-instance v3, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v4, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    invoke-direct {v3, v4}, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_5
    const/4 v1, 0x0

    .line 60
    :goto_6
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sCheckBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_6

    .line 61
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sCheckBoxes:Ljava/util/ArrayList;

    new-instance v3, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget-object v4, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sCheckBoxes:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    invoke-direct {v3, v4}, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;-><init>(Lcom/uwsoft/editor/renderer/data/CheckBoxVO;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_6
    const/4 v1, 0x0

    .line 63
    :goto_7
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSelectBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_7

    .line 64
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSelectBoxes:Ljava/util/ArrayList;

    new-instance v3, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget-object v4, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSelectBoxes:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    invoke-direct {v3, v4}, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;-><init>(Lcom/uwsoft/editor/renderer/data/SelectBoxVO;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_7
    const/4 v1, 0x0

    .line 67
    :goto_8
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sParticleEffects:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_8

    .line 68
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sParticleEffects:Ljava/util/ArrayList;

    new-instance v3, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget-object v4, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sParticleEffects:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    invoke-direct {v3, v4}, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;-><init>(Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_8
    const/4 v1, 0x0

    .line 71
    :goto_9
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLights:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_9

    .line 72
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLights:Ljava/util/ArrayList;

    new-instance v3, Lcom/uwsoft/editor/renderer/data/LightVO;

    iget-object v4, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLights:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/uwsoft/editor/renderer/data/LightVO;

    invoke-direct {v3, v4}, Lcom/uwsoft/editor/renderer/data/LightVO;-><init>(Lcom/uwsoft/editor/renderer/data/LightVO;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_9
    const/4 v1, 0x0

    .line 75
    :goto_a
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpineAnimations:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_a

    .line 76
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpineAnimations:Ljava/util/ArrayList;

    new-instance v3, Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget-object v4, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpineAnimations:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/uwsoft/editor/renderer/data/SpineVO;

    invoke-direct {v3, v4}, Lcom/uwsoft/editor/renderer/data/SpineVO;-><init>(Lcom/uwsoft/editor/renderer/data/SpineVO;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_a
    const/4 v1, 0x0

    .line 79
    :goto_b
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_b

    .line 80
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    new-instance v3, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget-object v4, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    invoke-direct {v3, v4}, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;-><init>(Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    :cond_b
    const/4 v1, 0x0

    .line 83
    :goto_c
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriterAnimations:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_c

    .line 84
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriterAnimations:Ljava/util/ArrayList;

    new-instance v3, Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget-object v4, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriterAnimations:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/uwsoft/editor/renderer/data/SpriterVO;

    invoke-direct {v3, v4}, Lcom/uwsoft/editor/renderer/data/SpriterVO;-><init>(Lcom/uwsoft/editor/renderer/data/SpriterVO;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 88
    :cond_c
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 89
    :goto_d
    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_d

    .line 90
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    new-instance v2, Lcom/uwsoft/editor/renderer/data/LayerItemVO;

    iget-object v3, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/uwsoft/editor/renderer/data/LayerItemVO;

    invoke-direct {v2, v3}, Lcom/uwsoft/editor/renderer/data/LayerItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/LayerItemVO;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_d
    return-void
.end method
