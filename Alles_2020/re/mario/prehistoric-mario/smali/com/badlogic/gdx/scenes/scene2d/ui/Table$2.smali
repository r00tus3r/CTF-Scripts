.class final Lcom/badlogic/gdx/scenes/scene2d/ui/Table$2;
.super Lcom/badlogic/gdx/scenes/scene2d/ui/Value;
.source "Table.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/Table;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1276
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Value;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Lcom/badlogic/gdx/scenes/scene2d/Actor;)F
    .locals 0

    .line 1278
    check-cast p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Table;->background:Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 1279
    :cond_0
    invoke-interface {p1}, Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;->getTopHeight()F

    move-result p1

    :goto_0
    return p1
.end method
