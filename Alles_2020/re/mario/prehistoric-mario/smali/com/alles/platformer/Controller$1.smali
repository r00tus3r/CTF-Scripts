.class Lcom/alles/platformer/Controller$1;
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

    .line 29
    iput-object p1, p0, Lcom/alles/platformer/Controller$1;->this$0:Lcom/alles/platformer/Controller;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/InputListener;-><init>()V

    return-void
.end method


# virtual methods
.method public keyDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;I)Z
    .locals 0

    const/4 p1, 0x1

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 44
    :pswitch_0
    iget-object p2, p0, Lcom/alles/platformer/Controller$1;->this$0:Lcom/alles/platformer/Controller;

    iput-boolean p1, p2, Lcom/alles/platformer/Controller;->rightPressed:Z

    goto :goto_0

    .line 41
    :pswitch_1
    iget-object p2, p0, Lcom/alles/platformer/Controller$1;->this$0:Lcom/alles/platformer/Controller;

    iput-boolean p1, p2, Lcom/alles/platformer/Controller;->leftPressed:Z

    goto :goto_0

    .line 38
    :pswitch_2
    iget-object p2, p0, Lcom/alles/platformer/Controller$1;->this$0:Lcom/alles/platformer/Controller;

    iput-boolean p1, p2, Lcom/alles/platformer/Controller;->downPressed:Z

    goto :goto_0

    .line 35
    :pswitch_3
    iget-object p2, p0, Lcom/alles/platformer/Controller$1;->this$0:Lcom/alles/platformer/Controller;

    iput-boolean p1, p2, Lcom/alles/platformer/Controller;->upPressed:Z

    :goto_0
    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public keyUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;I)Z
    .locals 0

    const/4 p1, 0x0

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    .line 63
    :pswitch_0
    iget-object p2, p0, Lcom/alles/platformer/Controller$1;->this$0:Lcom/alles/platformer/Controller;

    iput-boolean p1, p2, Lcom/alles/platformer/Controller;->rightPressed:Z

    goto :goto_0

    .line 60
    :pswitch_1
    iget-object p2, p0, Lcom/alles/platformer/Controller$1;->this$0:Lcom/alles/platformer/Controller;

    iput-boolean p1, p2, Lcom/alles/platformer/Controller;->leftPressed:Z

    goto :goto_0

    .line 57
    :pswitch_2
    iget-object p2, p0, Lcom/alles/platformer/Controller$1;->this$0:Lcom/alles/platformer/Controller;

    iput-boolean p1, p2, Lcom/alles/platformer/Controller;->downPressed:Z

    goto :goto_0

    .line 54
    :pswitch_3
    iget-object p2, p0, Lcom/alles/platformer/Controller$1;->this$0:Lcom/alles/platformer/Controller;

    iput-boolean p1, p2, Lcom/alles/platformer/Controller;->upPressed:Z

    :goto_0
    const/4 p1, 0x1

    return p1

    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
