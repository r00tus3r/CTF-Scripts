.class public Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;
.source "TextTooltip.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip<",
        "Lcom/badlogic/gdx/scenes/scene2d/ui/Label;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V
    .locals 2

    .line 27
    invoke-static {}, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->getInstance()Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    move-result-object v0

    const-class v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;

    invoke-virtual {p2, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;

    invoke-direct {p0, p1, v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V
    .locals 2

    .line 31
    invoke-static {}, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->getInstance()Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    move-result-object v0

    const-class v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;

    invoke-virtual {p2, p3, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;

    invoke-direct {p0, p1, v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;)V
    .locals 1

    .line 35
    invoke-static {}, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->getInstance()Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;)V
    .locals 1

    .line 39
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;

    invoke-virtual {p3, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;

    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;Ljava/lang/String;)V
    .locals 1

    .line 43
    const-class v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;

    invoke-virtual {p3, p4, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Skin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;

    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;)V
    .locals 2

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/Tooltip;-><init>(Lcom/badlogic/gdx/scenes/scene2d/Actor;Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;)V

    .line 49
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    iget-object v1, p3, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;->label:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-direct {v0, p1, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;-><init>(Ljava/lang/CharSequence;Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    const/4 p1, 0x1

    .line 50
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setWrap(Z)V

    .line 52
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->setActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 53
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$1;

    invoke-direct {v0, p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$1;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;)V

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->width(Lcom/badlogic/gdx/scenes/scene2d/ui/Value;)Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    .line 59
    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;->setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;)V

    return-void
.end method


# virtual methods
.method public setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;)V
    .locals 2

    if-eqz p1, :cond_1

    .line 64
    instance-of v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->getActor()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    iget-object v1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;->label:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->setStyle(Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    .line 66
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    iget-object v1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->setBackground(Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V

    .line 67
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    iget p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;->wrapWidth:F

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->maxWidth(F)Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    return-void

    .line 64
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "style must be a TextTooltipStyle."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 63
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "style cannot be null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
