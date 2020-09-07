.class public Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Window;
.source "Dialog.java"


# instance fields
.field buttonTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

.field cancelHide:Z

.field contentTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

.field focusListener:Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener;

.field protected ignoreTouchDown:Lcom/badlogic/gdx/scenes/scene2d/InputListener;

.field previousKeyboardFocus:Lcom/badlogic/gdx/scenes/scene2d/Actor;

.field previousScrollFocus:Lcom/badlogic/gdx/scenes/scene2d/Actor;

.field private skin:Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;

.field values:Lcom/badlogic/gdx/utils/ObjectMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/ObjectMap<",
            "Lcom/badlogic/gdx/scenes/scene2d/Actor;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V
    .locals 1

    .line 58
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;)V

    .line 45
    new-instance p1, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->values:Lcom/badlogic/gdx/utils/ObjectMap;

    .line 50
    new-instance p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$1;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$1;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;)V

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->ignoreTouchDown:Lcom/badlogic/gdx/scenes/scene2d/InputListener;

    .line 59
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->setSkin(Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V

    .line 60
    iput-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->skin:Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;

    .line 61
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->initialize()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V
    .locals 1

    .line 65
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;

    invoke-virtual {p2, p3, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;

    invoke-direct {p0, p1, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;)V

    .line 45
    new-instance p1, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->values:Lcom/badlogic/gdx/utils/ObjectMap;

    .line 50
    new-instance p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$1;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$1;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;)V

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->ignoreTouchDown:Lcom/badlogic/gdx/scenes/scene2d/InputListener;

    .line 66
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->setSkin(Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V

    .line 67
    iput-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->skin:Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;

    .line 68
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->initialize()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;)V
    .locals 0

    .line 72
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;)V

    .line 45
    new-instance p1, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->values:Lcom/badlogic/gdx/utils/ObjectMap;

    .line 50
    new-instance p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$1;

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$1;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;)V

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->ignoreTouchDown:Lcom/badlogic/gdx/scenes/scene2d/InputListener;

    .line 73
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->initialize()V

    return-void
.end method

.method private initialize()V
    .locals 3

    const/4 v0, 0x1

    .line 77
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->setModal(Z)V

    .line 79
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->defaults()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v0

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->space(F)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 80
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->skin:Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->contentTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->add(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->expand()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->fill()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 81
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->row()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 82
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->skin:Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->buttonTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->add(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->fillX()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 84
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->contentTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->defaults()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->space(F)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 85
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->buttonTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->defaults()Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;->space(F)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 87
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->buttonTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    new-instance v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$2;

    invoke-direct {v1, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$2;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;)V

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    .line 98
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$3;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$3;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->focusListener:Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener;

    return-void
.end method


# virtual methods
.method public button(Lcom/badlogic/gdx/scenes/scene2d/ui/Button;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;
    .locals 1

    const/4 v0, 0x0

    .line 176
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->button(Lcom/badlogic/gdx/scenes/scene2d/ui/Button;Ljava/lang/Object;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    move-result-object p1

    return-object p1
.end method

.method public button(Lcom/badlogic/gdx/scenes/scene2d/ui/Button;Ljava/lang/Object;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->buttonTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->add(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    .line 183
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->setObject(Lcom/badlogic/gdx/scenes/scene2d/Actor;Ljava/lang/Object;)V

    return-object p0
.end method

.method public button(Ljava/lang/String;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;
    .locals 1

    const/4 v0, 0x0

    .line 157
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->button(Ljava/lang/String;Ljava/lang/Object;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    move-result-object p1

    return-object p1
.end method

.method public button(Ljava/lang/String;Ljava/lang/Object;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;
    .locals 2

    .line 163
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->skin:Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;

    if-eqz v0, :cond_0

    .line 165
    const-class v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextButton$TextButtonStyle;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextButton$TextButtonStyle;

    invoke-virtual {p0, p1, p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->button(Ljava/lang/String;Ljava/lang/Object;Lcom/badlogic/gdx/scenes/scene2d/ui/TextButton$TextButtonStyle;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    move-result-object p1

    return-object p1

    .line 164
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "This method may only be used if the dialog was constructed with a Skin."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public button(Ljava/lang/String;Ljava/lang/Object;Lcom/badlogic/gdx/scenes/scene2d/ui/TextButton$TextButtonStyle;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;
    .locals 1

    .line 171
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextButton;

    invoke-direct {v0, p1, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextButton;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/TextButton$TextButtonStyle;)V

    invoke-virtual {p0, v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->button(Lcom/badlogic/gdx/scenes/scene2d/ui/Button;Ljava/lang/Object;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    move-result-object p1

    return-object p1
.end method

.method public cancel()V
    .locals 1

    const/4 v0, 0x1

    .line 281
    iput-boolean v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->cancelHide:Z

    return-void
.end method

.method public getButtonTable()Lcom/badlogic/gdx/scenes/scene2d/ui/Table;
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->buttonTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    return-object v0
.end method

.method public getContentTable()Lcom/badlogic/gdx/scenes/scene2d/ui/Table;
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->contentTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    return-object v0
.end method

.method public hide()V
    .locals 2

    .line 247
    sget-object v0, Lcom/badlogic/gdx/math/Interpolation;->fade:Lcom/badlogic/gdx/math/Interpolation;

    const v1, 0x3ecccccd    # 0.4f

    invoke-static {v1, v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->fadeOut(FLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->hide(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    return-void
.end method

.method public hide(Lcom/badlogic/gdx/scenes/scene2d/Action;)V
    .locals 3

    .line 226
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 228
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->focusListener:Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener;

    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->removeListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    .line 229
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->previousKeyboardFocus:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v1

    if-nez v1, :cond_0

    iput-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->previousKeyboardFocus:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 230
    :cond_0
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getKeyboardFocus()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 231
    invoke-virtual {v1, p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->isDescendantOf(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->previousKeyboardFocus:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->setKeyboardFocus(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    .line 233
    :cond_2
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->previousScrollFocus:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v1

    if-nez v1, :cond_3

    iput-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->previousScrollFocus:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 234
    :cond_3
    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getScrollFocus()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 235
    invoke-virtual {v1, p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->isDescendantOf(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_4
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->previousScrollFocus:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->setScrollFocus(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    :cond_5
    if-eqz p1, :cond_6

    .line 238
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->ignoreTouchDown:Lcom/badlogic/gdx/scenes/scene2d/InputListener;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->addCaptureListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    .line 239
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->ignoreTouchDown:Lcom/badlogic/gdx/scenes/scene2d/InputListener;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->removeListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;Z)Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveListenerAction;

    move-result-object v0

    invoke-static {}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->removeActor()Lcom/badlogic/gdx/scenes/scene2d/actions/RemoveActorAction;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->sequence(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    goto :goto_0

    .line 241
    :cond_6
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->remove()Z

    :goto_0
    return-void
.end method

.method public key(ILjava/lang/Object;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;
    .locals 1

    .line 257
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;

    invoke-direct {v0, p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog$4;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;ILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    return-object p0
.end method

.method protected result(Ljava/lang/Object;)V
    .locals 0

    return-void
.end method

.method public setObject(Lcom/badlogic/gdx/scenes/scene2d/Actor;Ljava/lang/Object;)V
    .locals 1

    .line 251
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->values:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/utils/ObjectMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected setStage(Lcom/badlogic/gdx/scenes/scene2d/Stage;)V
    .locals 1

    if-nez p1, :cond_0

    .line 122
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->focusListener:Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->addListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    goto :goto_0

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->focusListener:Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->removeListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    .line 125
    :goto_0
    invoke-super {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->setStage(Lcom/badlogic/gdx/scenes/scene2d/Stage;)V

    return-void
.end method

.method public show(Lcom/badlogic/gdx/scenes/scene2d/Stage;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;
    .locals 3

    const/4 v0, 0x0

    .line 216
    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->alpha(F)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    move-result-object v0

    sget-object v1, Lcom/badlogic/gdx/math/Interpolation;->fade:Lcom/badlogic/gdx/math/Interpolation;

    const v2, 0x3ecccccd    # 0.4f

    invoke-static {v2, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->fadeIn(FLcom/badlogic/gdx/math/Interpolation;)Lcom/badlogic/gdx/scenes/scene2d/actions/AlphaAction;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/actions/Actions;->sequence(Lcom/badlogic/gdx/scenes/scene2d/Action;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/actions/SequenceAction;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->show(Lcom/badlogic/gdx/scenes/scene2d/Stage;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    .line 217
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getWidth()F

    move-result v0

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->getWidth()F

    move-result v1

    sub-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getHeight()F

    move-result p1

    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->getHeight()F

    move-result v2

    sub-float/2addr p1, v2

    div-float/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->setPosition(FF)V

    return-object p0
.end method

.method public show(Lcom/badlogic/gdx/scenes/scene2d/Stage;Lcom/badlogic/gdx/scenes/scene2d/Action;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;
    .locals 3

    .line 192
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->clearActions()V

    .line 193
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->ignoreTouchDown:Lcom/badlogic/gdx/scenes/scene2d/InputListener;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->removeCaptureListener(Lcom/badlogic/gdx/scenes/scene2d/EventListener;)Z

    const/4 v0, 0x0

    .line 195
    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->previousKeyboardFocus:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 196
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getKeyboardFocus()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 197
    invoke-virtual {v1, p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->isDescendantOf(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    move-result v2

    if-nez v2, :cond_0

    iput-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->previousKeyboardFocus:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 199
    :cond_0
    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->previousScrollFocus:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 200
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->getScrollFocus()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 201
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->isDescendantOf(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    move-result v1

    if-nez v1, :cond_1

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->previousScrollFocus:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    .line 203
    :cond_1
    invoke-virtual {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 204
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->pack()V

    .line 205
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->cancelTouchFocus()V

    .line 206
    invoke-virtual {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->setKeyboardFocus(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    .line 207
    invoke-virtual {p1, p0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->setScrollFocus(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    if-eqz p2, :cond_2

    .line 208
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->addAction(Lcom/badlogic/gdx/scenes/scene2d/Action;)V

    :cond_2
    return-object p0
.end method

.method public text(Lcom/badlogic/gdx/scenes/scene2d/ui/Label;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->contentTable:Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->add(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/ui/Cell;

    return-object p0
.end method

.method public text(Ljava/lang/String;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;
    .locals 2

    .line 138
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->skin:Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;

    if-eqz v0, :cond_0

    .line 140
    const-class v1, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->text(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    move-result-object p1

    return-object p1

    .line 139
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "This method may only be used if the dialog was constructed with a Skin."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public text(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;
    .locals 1

    .line 145
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    invoke-direct {v0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;-><init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;->text(Lcom/badlogic/gdx/scenes/scene2d/ui/Label;)Lcom/badlogic/gdx/scenes/scene2d/ui/Dialog;

    move-result-object p1

    return-object p1
.end method
