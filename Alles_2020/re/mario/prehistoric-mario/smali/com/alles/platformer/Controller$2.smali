.class Lcom/alles/platformer/Controller$2;
.super Lcom/badlogic/gdx/scenes/scene2d/InputListener;
.source "Controller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/alles/platformer/Controller;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alles/platformer/Controller;


# direct methods
.method constructor <init>(Lcom/alles/platformer/Controller;)V
    .locals 0

    .line 80
    iput-object p1, p0, Lcom/alles/platformer/Controller$2;->this$0:Lcom/alles/platformer/Controller;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/InputListener;-><init>()V

    return-void
.end method


# virtual methods
.method public touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)Z
    .locals 0

    .line 84
    iget-object p1, p0, Lcom/alles/platformer/Controller$2;->this$0:Lcom/alles/platformer/Controller;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/alles/platformer/Controller;->upPressed:Z

    return p2
.end method

.method public touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V
    .locals 0

    .line 90
    iget-object p1, p0, Lcom/alles/platformer/Controller$2;->this$0:Lcom/alles/platformer/Controller;

    const/4 p2, 0x0

    iput-boolean p2, p1, Lcom/alles/platformer/Controller;->upPressed:Z

    return-void
.end method
