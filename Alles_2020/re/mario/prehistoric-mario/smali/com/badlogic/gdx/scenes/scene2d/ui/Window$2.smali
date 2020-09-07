.class Lcom/badlogic/gdx/scenes/scene2d/ui/Window$2;
.super Lcom/badlogic/gdx/scenes/scene2d/InputListener;
.source "Window.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/Window;-><init>(Ljava/lang/String;Lcom/badlogic/gdx/scenes/scene2d/ui/Window$WindowStyle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Window;)V
    .locals 0

    .line 85
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/InputListener;-><init>()V

    return-void
.end method


# virtual methods
.method public touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)Z
    .locals 0

    .line 87
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Window$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Window;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Window;->toFront()V

    const/4 p1, 0x0

    return p1
.end method
