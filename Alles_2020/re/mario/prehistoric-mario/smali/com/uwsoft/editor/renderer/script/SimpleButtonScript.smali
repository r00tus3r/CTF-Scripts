.class public Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;
.super Ljava/lang/Object;
.source "SimpleButtonScript.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/script/IScript;


# static fields
.field public static final TEXT_EFFECT_DOWN:I = 0x2

.field public static final TEXT_EFFECT_NONE:I = 0x0

.field public static final TEXT_EFFECT_PUSH:I = 0x1


# instance fields
.field protected buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

.field protected isDown:Z

.field protected isToggled:Z

.field protected final listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/DelayedRemovalArray<",
            "Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;",
            ">;"
        }
    .end annotation
.end field

.field protected origTextScaleX:F

.field protected origTextScaleY:F

.field protected origTextY:F

.field protected textEffect:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 18
    iput v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->textEffect:I

    .line 21
    new-instance v1, Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    invoke-direct {v1, v0}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;-><init>(I)V

    iput-object v1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    .line 23
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->isDown:Z

    .line 24
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->isToggled:Z

    return-void
.end method

.method public static selfInit(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;
    .locals 1

    .line 30
    new-instance v0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;-><init>()V

    .line 31
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addScript(Lcom/uwsoft/editor/renderer/script/IScript;)V

    return-object v0
.end method


# virtual methods
.method public act(F)V
    .locals 5

    .line 96
    iget-boolean p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->isDown:Z

    const-string v0, "pressed"

    const-string v1, "normal"

    const/4 v2, 0x1

    const-string v3, "checked"

    const/4 v4, 0x0

    if-eqz p1, :cond_0

    .line 97
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v3, v4}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setLayerVisibilty(Ljava/lang/String;Z)V

    .line 98
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v1, v4}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setLayerVisibilty(Ljava/lang/String;Z)V

    .line 99
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v0, v2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setLayerVisibilty(Ljava/lang/String;Z)V

    goto :goto_1

    .line 101
    :cond_0
    iget-boolean p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->isToggled:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->layerExists(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 102
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v3, v2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setLayerVisibilty(Ljava/lang/String;Z)V

    .line 103
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v1, v4}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setLayerVisibilty(Ljava/lang/String;Z)V

    goto :goto_0

    .line 105
    :cond_1
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v1, v2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setLayerVisibilty(Ljava/lang/String;Z)V

    .line 106
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v3, v4}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setLayerVisibilty(Ljava/lang/String;Z)V

    .line 109
    :goto_0
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v0, v4}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setLayerVisibilty(Ljava/lang/String;Z)V

    .line 112
    :goto_1
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    const-string v0, "text"

    invoke-virtual {p1, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getLabelById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LabelItem;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 113
    iget p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->textEffect:I

    const/4 v1, 0x2

    if-ne p1, v1, :cond_3

    .line 114
    iget-boolean p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->isDown:Z

    if-eqz p1, :cond_2

    .line 115
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getLabelById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LabelItem;

    move-result-object p1

    iget v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->origTextY:F

    const/high16 v1, 0x40a00000    # 5.0f

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    iget v2, v2, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    mul-float v2, v2, v1

    sub-float/2addr v0, v2

    invoke-virtual {p1, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setY(F)V

    goto :goto_2

    .line 117
    :cond_2
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getLabelById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LabelItem;

    move-result-object p1

    iget v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->origTextY:F

    invoke-virtual {p1, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setY(F)V

    goto :goto_2

    :cond_3
    if-ne p1, v2, :cond_5

    .line 120
    iget-boolean p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->isDown:Z

    if-eqz p1, :cond_4

    .line 121
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getLabelById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LabelItem;

    move-result-object p1

    const v0, 0x3f666666    # 0.9f

    invoke-virtual {p1, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setScale(F)V

    goto :goto_2

    .line 123
    :cond_4
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getLabelById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LabelItem;

    move-result-object p1

    iget v1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->origTextScaleX:F

    invoke-virtual {p1, v1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setScaleX(F)V

    .line 124
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {p1, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getLabelById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LabelItem;

    move-result-object p1

    iget v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->origTextScaleY:F

    invoke-virtual {p1, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setScaleY(F)V

    :cond_5
    :goto_2
    return-void
.end method

.method public addListener(Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;)Z
    .locals 2

    .line 143
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->contains(Ljava/lang/Object;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->add(Ljava/lang/Object;)V

    return v1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public clearListeners()V
    .locals 1

    .line 159
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->clear()V

    return-void
.end method

.method public dispose()V
    .locals 0

    .line 91
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->clearListeners()V

    return-void
.end method

.method public getItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 163
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object v0
.end method

.method public getListeners()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;",
            ">;"
        }
    .end annotation

    .line 155
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    return-object v0
.end method

.method public getTextEffect()I
    .locals 1

    .line 37
    iget v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->textEffect:I

    return v0
.end method

.method public init(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 3

    .line 54
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 56
    invoke-virtual {p1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    move-result-object v0

    const-string v1, "text"

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->getStringVariable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 57
    invoke-virtual {p1, v1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getLabelById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LabelItem;

    move-result-object v2

    if-eqz v2, :cond_1

    if-eqz v0, :cond_0

    .line 59
    invoke-virtual {p1, v1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getLabelById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LabelItem;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setText(Ljava/lang/CharSequence;)V

    .line 62
    :cond_0
    invoke-virtual {p1, v1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getLabelById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LabelItem;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setAlignment(I)V

    .line 63
    invoke-virtual {p1, v1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getLabelById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LabelItem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getY()F

    move-result v0

    iput v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->origTextY:F

    .line 64
    invoke-virtual {p1, v1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getLabelById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LabelItem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getScaleX()F

    move-result v0

    iput v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->origTextScaleX:F

    .line 65
    invoke-virtual {p1, v1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getLabelById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LabelItem;

    move-result-object p1

    invoke-virtual {p1}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->getScaleY()F

    move-result p1

    iput p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->origTextScaleY:F

    .line 69
    :cond_1
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->buttonHolder:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    new-instance v0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript$1;

    invoke-direct {v0, p0}, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript$1;-><init>(Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;)V

    invoke-virtual {p1, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    return-void
.end method

.method public isDown()Z
    .locals 1

    .line 45
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->isDown:Z

    return v0
.end method

.method public isToggled()Z
    .locals 1

    .line 49
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->isToggled:Z

    return v0
.end method

.method public removeListener(Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;)Z
    .locals 2

    .line 151
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->listeners:Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->removeValue(Ljava/lang/Object;Z)Z

    move-result p1

    return p1
.end method

.method public setTextEffect(I)V
    .locals 0

    .line 41
    iput p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->textEffect:I

    return-void
.end method

.method public setToggle(Z)V
    .locals 0

    .line 133
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/script/SimpleButtonScript;->isToggled:Z

    return-void
.end method
