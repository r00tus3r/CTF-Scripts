.class final Lcom/badlogic/gdx/scenes/scene2d/ui/Value$9;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
.source "Value.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/Value;->percentWidth(FLcom/badlogic/gdx/scenes/scene2d/Actor;)Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

.field final synthetic val$percent:F


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/Actor;F)V
    .locals 0

    .line 137
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$9;->val$actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$9;->val$percent:F

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    .locals 1

    .line 139
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$9;->val$actor:Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getWidth()F

    move-result p1

    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Value$9;->val$percent:F

    mul-float p1, p1, v0

    return p1
.end method
