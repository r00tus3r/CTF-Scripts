.class public Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;
.super Ljava/lang/Object;
.source "TextTooltip.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TextTooltipStyle"
.end annotation


# instance fields
.field public background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

.field public label:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

.field public wrapWidth:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;)V
    .locals 0

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;->label:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    .line 84
    iput-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;)V
    .locals 2

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    new-instance v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    iget-object v1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;->label:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;-><init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;->label:Lcom/badlogic/gdx/scenes/scene2d/ui/Label$LabelStyle;

    .line 89
    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    return-void
.end method
