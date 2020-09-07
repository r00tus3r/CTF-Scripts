.class Lcom/badlogic/gdx/scenes/scene2d/ui/Button$2;
.super Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener;
.source "Button.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/Button;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Button;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/Button;)V
    .locals 0

    .line 97
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Button$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Button;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener;-><init>()V

    return-void
.end method


# virtual methods
.method public keyboardFocusChanged(Lcom/badlogic/gdx/scenes/scene2d/utils/FocusListener$FocusEvent;Lcom/badlogic/gdx/scenes/scene2d/Actor;Z)V
    .locals 0

    .line 99
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/Button$2;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/Button;

    iput-boolean p3, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;->focused:Z

    return-void
.end method
