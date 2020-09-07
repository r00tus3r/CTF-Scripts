.class public Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;
.super Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;
.source "TextField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TextFieldClickListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;)V
    .locals 0

    .line 820
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public clicked(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FF)V
    .locals 2

    .line 822
    invoke-virtual {p0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->getTapCount()I

    move-result p1

    rem-int/lit8 p1, p1, 0x4

    if-nez p1, :cond_0

    .line 823
    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->clearSelection()V

    :cond_0
    const/4 p3, 0x2

    if-ne p1, p3, :cond_1

    .line 825
    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p3, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->wordUnderCursor(F)[I

    move-result-object p2

    .line 826
    iget-object p3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    const/4 v0, 0x0

    aget v0, p2, v0

    const/4 v1, 0x1

    aget p2, p2, v1

    invoke-virtual {p3, v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->setSelection(II)V

    :cond_1
    const/4 p2, 0x3

    if-ne p1, p2, :cond_2

    .line 828
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->selectAll()V

    :cond_2
    return-void
.end method

.method protected goEnd(Z)V
    .locals 1

    .line 867
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    return-void
.end method

.method protected goHome(Z)V
    .locals 1

    .line 863
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    const/4 v0, 0x0

    iput v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    return-void
.end method

.method public keyDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;I)Z
    .locals 10

    .line 871
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->disabled:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    return v0

    .line 873
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean v1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->focused:Z

    iput-boolean v1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursorOn:Z

    .line 874
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->blinkTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    .line 875
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->focused:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->blinkTask:Lcom/badlogic/gdx/utils/Timer$Task;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->blinkTime:F

    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v2, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->blinkTime:F

    invoke-static {p1, v1, v2}, Lcom/badlogic/gdx/utils/Timer;->schedule(Lcom/badlogic/gdx/utils/Timer$Task;FF)Lcom/badlogic/gdx/utils/Timer$Task;

    .line 877
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->hasKeyboardFocus()Z

    move-result p1

    if-nez p1, :cond_2

    return v0

    .line 880
    :cond_2
    invoke-static {}, Lcom/badlogic/gdx/scenes/scene2d/utils/UIUtils;->ctrl()Z

    move-result p1

    const/4 v1, 0x1

    if-eqz p1, :cond_3

    .line 881
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean v2, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->passwordMode:Z

    if-nez v2, :cond_3

    const/4 v2, 0x1

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    :goto_0
    const/16 v3, 0x85

    if-eqz p1, :cond_9

    const/16 p1, 0x1d

    if-eq p2, p1, :cond_8

    const/16 p1, 0x1f

    if-eq p2, p1, :cond_7

    const/16 p1, 0x32

    if-eq p2, p1, :cond_6

    const/16 p1, 0x34

    if-eq p2, p1, :cond_5

    const/16 p1, 0x36

    if-eq p2, p1, :cond_4

    if-eq p2, v3, :cond_7

    const/4 p1, 0x0

    const/4 v4, 0x0

    goto :goto_2

    .line 901
    :cond_4
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    .line 902
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v0, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->undoText:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->setText(Ljava/lang/String;)V

    .line 903
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iput-object p1, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->undoText:Ljava/lang/String;

    .line 904
    invoke-virtual {p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->updateDisplayText()V

    return v1

    .line 895
    :cond_5
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cut(Z)V

    return v1

    .line 887
    :cond_6
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v4, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->clipboard:Lcom/badlogic/gdx/utils/Clipboard;

    invoke-interface {v4}, Lcom/badlogic/gdx/utils/Clipboard;->getContents()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->paste(Ljava/lang/String;Z)V

    const/4 p1, 0x1

    goto :goto_1

    .line 892
    :cond_7
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->copy()V

    return v1

    .line 898
    :cond_8
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->selectAll()V

    return v1

    :cond_9
    const/4 p1, 0x0

    :goto_1
    const/4 v4, 0x1

    .line 911
    :goto_2
    invoke-static {}, Lcom/badlogic/gdx/scenes/scene2d/utils/UIUtils;->shift()Z

    move-result v5

    const/16 v6, 0x16

    const/16 v7, 0x15

    const/16 v8, 0x84

    const/4 v9, 0x3

    if-eqz v5, :cond_10

    const/16 v5, 0x70

    if-eq p2, v5, :cond_b

    if-eq p2, v3, :cond_a

    goto :goto_3

    .line 914
    :cond_a
    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v5, v3, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->clipboard:Lcom/badlogic/gdx/utils/Clipboard;

    invoke-interface {v5}, Lcom/badlogic/gdx/utils/Clipboard;->getContents()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->paste(Ljava/lang/String;Z)V

    goto :goto_3

    .line 917
    :cond_b
    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cut(Z)V

    .line 923
    :goto_3
    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v3, v3, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    if-eq p2, v9, :cond_f

    if-eq p2, v8, :cond_e

    if-eq p2, v7, :cond_d

    if-eq p2, v6, :cond_c

    goto :goto_6

    .line 933
    :cond_c
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1, v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->moveCursor(ZZ)V

    goto :goto_4

    .line 928
    :cond_d
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1, v0, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->moveCursor(ZZ)V

    :goto_4
    const/4 p1, 0x1

    goto :goto_5

    .line 942
    :cond_e
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->goEnd(Z)V

    goto :goto_5

    .line 938
    :cond_f
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->goHome(Z)V

    .line 948
    :goto_5
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean v2, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->hasSelection:Z

    if-nez v2, :cond_15

    .line 949
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iput v3, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->selectionStart:I

    .line 950
    iput-boolean v1, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->hasSelection:Z

    goto :goto_8

    :cond_10
    if-eq p2, v9, :cond_14

    if-eq p2, v8, :cond_13

    if-eq p2, v7, :cond_12

    if-eq p2, v6, :cond_11

    :goto_6
    move v1, v4

    goto :goto_8

    .line 963
    :cond_11
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1, v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->moveCursor(ZZ)V

    .line 964
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->clearSelection()V

    goto :goto_7

    .line 957
    :cond_12
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1, v0, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->moveCursor(ZZ)V

    .line 958
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->clearSelection()V

    :goto_7
    const/4 p1, 0x1

    goto :goto_8

    .line 974
    :cond_13
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->goEnd(Z)V

    .line 975
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->clearSelection()V

    goto :goto_8

    .line 969
    :cond_14
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->goHome(Z)V

    .line 970
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->clearSelection()V

    .line 981
    :cond_15
    :goto_8
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v3, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v4, v4, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-static {v3, v0, v4}, Lcom/badlogic/gdx/math/MathUtils;->clamp(III)I

    move-result v0

    iput v0, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    if-eqz p1, :cond_16

    .line 983
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->scheduleKeyRepeatTask(I)V

    :cond_16
    return v1
.end method

.method public keyTyped(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;C)Z
    .locals 13

    .line 1002
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->disabled:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    return v0

    :cond_0
    const/16 p1, 0xd

    if-eq p2, p1, :cond_1

    packed-switch p2, :pswitch_data_0

    const/16 v1, 0x20

    if-ge p2, v1, :cond_1

    return v0

    .line 1015
    :cond_1
    :pswitch_0
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->hasKeyboardFocus()Z

    move-result v1

    if-nez v1, :cond_2

    return v0

    .line 1017
    :cond_2
    sget-boolean v1, Lcom/badlogic/gdx/scenes/scene2d/utils/UIUtils;->isMac:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_3

    sget-object v1, Lcom/badlogic/gdx/Gdx;->input:Lcom/badlogic/gdx/Input;

    const/16 v3, 0x3f

    invoke-interface {v1, v3}, Lcom/badlogic/gdx/Input;->isKeyPressed(I)Z

    move-result v1

    if-eqz v1, :cond_3

    return v2

    :cond_3
    const/16 v1, 0x9

    const/16 v3, 0xa

    if-eq p2, v1, :cond_4

    if-ne p2, v3, :cond_5

    .line 1019
    :cond_4
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->focusTraversal:Z

    if-eqz v1, :cond_5

    .line 1020
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-static {}, Lcom/badlogic/gdx/scenes/scene2d/utils/UIUtils;->shift()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->next(Z)V

    goto/16 :goto_b

    :cond_5
    const/16 v1, 0x7f

    if-ne p2, v1, :cond_6

    const/4 v1, 0x1

    goto :goto_0

    :cond_6
    const/4 v1, 0x0

    :goto_0
    const/16 v4, 0x8

    if-ne p2, v4, :cond_7

    const/4 v4, 0x1

    goto :goto_1

    :cond_7
    const/4 v4, 0x0

    :goto_1
    if-eq p2, p1, :cond_9

    if-ne p2, v3, :cond_8

    goto :goto_2

    :cond_8
    const/4 p1, 0x0

    goto :goto_3

    :cond_9
    :goto_2
    const/4 p1, 0x1

    :goto_3
    if-eqz p1, :cond_a

    .line 1025
    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean v3, v3, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->writeEnters:Z

    goto :goto_5

    :cond_a
    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean v3, v3, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->onlyFontChars:Z

    if-eqz v3, :cond_c

    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v3, v3, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->style:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;

    iget-object v3, v3, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldStyle;->font:Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;->getData()Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    move-result-object v3

    invoke-virtual {v3, p2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->hasGlyph(C)Z

    move-result v3

    if-eqz v3, :cond_b

    goto :goto_4

    :cond_b
    const/4 v3, 0x0

    goto :goto_5

    :cond_c
    :goto_4
    const/4 v3, 0x1

    :goto_5
    if-nez v4, :cond_e

    if-eqz v1, :cond_d

    goto :goto_6

    :cond_d
    const/4 v5, 0x0

    goto :goto_7

    :cond_e
    :goto_6
    const/4 v5, 0x1

    :goto_7
    if-nez v3, :cond_f

    if-eqz v5, :cond_1a

    .line 1028
    :cond_f
    iget-object v6, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v6, v6, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    .line 1029
    iget-object v7, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v7, v7, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    if-eqz v5, :cond_12

    .line 1031
    iget-object v8, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean v8, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->hasSelection:Z

    if-eqz v8, :cond_10

    .line 1032
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->delete(Z)I

    move-result v4

    iput v4, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    goto/16 :goto_8

    :cond_10
    if-eqz v4, :cond_11

    .line 1034
    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v4, v4, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    if-lez v4, :cond_11

    .line 1035
    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v9, v9, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    iget-object v10, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v10, v10, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    sub-int/2addr v10, v2

    invoke-virtual {v9, v0, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v9, v9, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    iget-object v10, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v11, v10, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    add-int/lit8 v12, v11, -0x1

    iput v12, v10, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    invoke-virtual {v9, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v4, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    .line 1036
    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    const/4 v8, 0x0

    iput v8, v4, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->renderOffset:F

    :cond_11
    if-eqz v1, :cond_12

    .line 1038
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v4, v4, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_12

    .line 1039
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v8, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    iget-object v9, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v9, v9, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    invoke-virtual {v8, v0, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v8, v8, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    iget-object v9, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v9, v9, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    add-int/2addr v9, v2

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    :cond_12
    :goto_8
    if-eqz v3, :cond_17

    if-nez v5, :cond_17

    if-nez p1, :cond_13

    .line 1045
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->filter:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldFilter;

    if-eqz v1, :cond_13

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->filter:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldFilter;

    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-interface {v1, v3, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldFilter;->acceptChar(Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;C)Z

    move-result v1

    if-nez v1, :cond_13

    return v2

    .line 1046
    :cond_13
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v3, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->withinMaxLength(I)Z

    move-result v1

    if-nez v1, :cond_14

    return v2

    .line 1047
    :cond_14
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->hasSelection:Z

    if-eqz v1, :cond_15

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->delete(Z)I

    move-result v0

    iput v0, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    :cond_15
    if-eqz p1, :cond_16

    const-string p1, "\n"

    goto :goto_9

    .line 1048
    :cond_16
    invoke-static {p2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p1

    .line 1049
    :goto_9
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    add-int/lit8 v3, v1, 0x1

    iput v3, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    iget-object v3, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v3, v3, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    invoke-virtual {v0, v1, p1, v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->insert(ILjava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    .line 1051
    :cond_17
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->undoText:Ljava/lang/String;

    .line 1052
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->text:Ljava/lang/String;

    invoke-virtual {p1, v6, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->changeText(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_19

    .line 1053
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v3, 0x2ee

    sub-long v3, v0, v3

    .line 1054
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-wide v7, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->lastChangeTime:J

    cmp-long p1, v3, v7

    if-lez p1, :cond_18

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iput-object v6, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->undoText:Ljava/lang/String;

    .line 1055
    :cond_18
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iput-wide v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->lastChangeTime:J

    goto :goto_a

    .line 1057
    :cond_19
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iput v7, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    .line 1058
    :goto_a
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->updateDisplayText()V

    .line 1061
    :cond_1a
    :goto_b
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->listener:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldListener;

    if-eqz p1, :cond_1b

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->listener:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldListener;

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-interface {p1, v0, p2}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldListener;->keyTyped(Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;C)V

    :cond_1b
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public keyUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;I)Z
    .locals 0

    .line 996
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->disabled:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 997
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->keyRepeatTask:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;->cancel()V

    const/4 p1, 0x1

    return p1
.end method

.method protected scheduleKeyRepeatTask(I)V
    .locals 2

    .line 988
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->keyRepeatTask:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;

    invoke-virtual {v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;->isScheduled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->keyRepeatTask:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;

    iget v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;->keycode:I

    if-eq v0, p1, :cond_1

    .line 989
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->keyRepeatTask:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;

    iput p1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;->keycode:I

    .line 990
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->keyRepeatTask:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;->cancel()V

    .line 991
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->keyRepeatTask:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$KeyRepeatTask;

    sget v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->keyRepeatInitialTime:F

    sget v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->keyRepeatTime:F

    invoke-static {p1, v0, v1}, Lcom/badlogic/gdx/utils/Timer;->schedule(Lcom/badlogic/gdx/utils/Timer$Task;FF)Lcom/badlogic/gdx/utils/Timer$Task;

    :cond_1
    return-void
.end method

.method protected setCursorPosition(FF)V
    .locals 1

    .line 855
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->letterUnderCursor(F)I

    move-result p1

    iput p1, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    .line 857
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean p2, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->focused:Z

    iput-boolean p2, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursorOn:Z

    .line 858
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->blinkTask:Lcom/badlogic/gdx/utils/Timer$Task;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Timer$Task;->cancel()V

    .line 859
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->focused:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->blinkTask:Lcom/badlogic/gdx/utils/Timer$Task;

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget p2, p2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->blinkTime:F

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->blinkTime:F

    invoke-static {p1, p2, v0}, Lcom/badlogic/gdx/utils/Timer;->schedule(Lcom/badlogic/gdx/utils/Timer$Task;FF)Lcom/badlogic/gdx/utils/Timer$Task;

    :cond_0
    return-void
.end method

.method public touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)Z
    .locals 1

    .line 832
    invoke-super/range {p0 .. p5}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDown(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    if-nez p4, :cond_1

    if-eqz p5, :cond_1

    return v0

    .line 834
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-boolean p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->disabled:Z

    const/4 p4, 0x1

    if-eqz p1, :cond_2

    return p4

    .line 835
    :cond_2
    invoke-virtual {p0, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->setCursorPosition(FF)V

    .line 836
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget p2, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    iput p2, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->selectionStart:I

    .line 837
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 838
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->setKeyboardFocus(Lcom/badlogic/gdx/scenes/scene2d/Actor;)Z

    .line 839
    :cond_3
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget-object p1, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->keyboard:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$OnscreenKeyboard;

    invoke-interface {p1, p4}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$OnscreenKeyboard;->show(Z)V

    .line 840
    iget-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iput-boolean p4, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->hasSelection:Z

    return p4
.end method

.method public touchDragged(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFI)V
    .locals 0

    .line 845
    invoke-super {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchDragged(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFI)V

    .line 846
    invoke-virtual {p0, p2, p3}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->setCursorPosition(FF)V

    return-void
.end method

.method public touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V
    .locals 2

    .line 850
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v0, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->selectionStart:I

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    iget v1, v1, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->cursor:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField$TextFieldClickListener;->this$0:Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/badlogic/gdx/scenes/scene2d/ui/TextField;->hasSelection:Z

    .line 851
    :cond_0
    invoke-super/range {p0 .. p5}, Lcom/badlogic/gdx/scenes/scene2d/utils/ClickListener;->touchUp(Lcom/badlogic/gdx/scenes/scene2d/InputEvent;FFII)V

    return-void
.end method
