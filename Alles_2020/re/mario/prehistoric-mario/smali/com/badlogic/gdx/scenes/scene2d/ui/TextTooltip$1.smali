.class Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$1;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
.source "TextTooltip.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$TextTooltipStyle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;

.field final synthetic val$manager:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;)V
    .locals 0

    .line 53
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;

    iput-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$1;->val$manager:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    .locals 1

    .line 55
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$1;->val$manager:Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;

    iget p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TooltipManager;->maxWidth:F

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip$1;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextTooltip;->container:Lcom/badlogic/gdx/scenes/scene2d/ui/Container;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Container;->getActor()Lcom/badlogic/gdx/scenes/scene2d/Actor;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Label;->getGlyphLayout()Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/graphics/g2d/GlyphLayout;->width:F

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    return p1
.end method
