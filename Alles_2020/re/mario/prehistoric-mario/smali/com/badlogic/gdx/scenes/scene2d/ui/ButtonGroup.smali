.class public Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;
.super Ljava/lang/Object;
.source "ButtonGroup.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/badlogic/gdx/scenes/scene2d/ui/Button;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final buttons:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation
.end field

.field private checkedButtons:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation
.end field

.field private lastChecked:Lcom/badlogic/gdx/scenes/scene2d/ui/Button;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private maxCheckCount:I

.field private minCheckCount:I

.field private uncheckLast:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->buttons:Lcom/badlogic/gdx/utils/Array;

    .line 28
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->checkedButtons:Lcom/badlogic/gdx/utils/Array;

    .line 29
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->maxCheckCount:I

    .line 30
    iput-boolean v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->uncheckLast:Z

    .line 34
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->minCheckCount:I

    return-void
.end method

.method public varargs constructor <init>([Lcom/badlogic/gdx/scenes/scene2d/ui/Button;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->buttons:Lcom/badlogic/gdx/utils/Array;

    .line 28
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->checkedButtons:Lcom/badlogic/gdx/utils/Array;

    .line 29
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->maxCheckCount:I

    .line 30
    iput-boolean v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->uncheckLast:Z

    const/4 v0, 0x0

    .line 38
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->minCheckCount:I

    .line 39
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->add([Lcom/badlogic/gdx/scenes/scene2d/ui/Button;)V

    .line 40
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->minCheckCount:I

    return-void
.end method


# virtual methods
.method public add(Lcom/badlogic/gdx/scenes/scene2d/ui/Button;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    if-eqz p1, :cond_2

    const/4 v0, 0x0

    .line 45
    iput-object v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;->buttonGroup:Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;

    .line 46
    invoke-virtual {p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;->isChecked()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->buttons:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->minCheckCount:I

    if-ge v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 47
    :goto_1
    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;->setChecked(Z)V

    .line 48
    iput-object p0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;->buttonGroup:Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;

    .line 49
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->buttons:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 50
    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;->setChecked(Z)V

    return-void

    .line 44
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "button cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public varargs add([Lcom/badlogic/gdx/scenes/scene2d/ui/Button;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    .line 55
    array-length v1, p1

    :goto_0
    if-ge v0, v1, :cond_0

    .line 56
    aget-object v2, p1, v0

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->add(Lcom/badlogic/gdx/scenes/scene2d/ui/Button;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void

    .line 54
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "buttons cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method protected canCheck(Lcom/badlogic/gdx/scenes/scene2d/ui/Button;Z)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)Z"
        }
    .end annotation

    .line 93
    iget-boolean v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;->isChecked:Z

    const/4 v1, 0x0

    if-ne v0, p2, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x1

    if-nez p2, :cond_2

    .line 97
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->checkedButtons:Lcom/badlogic/gdx/utils/Array;

    iget p2, p2, Lcom/badlogic/gdx/utils/Array;->size:I

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->minCheckCount:I

    if-gt p2, v2, :cond_1

    return v1

    .line 98
    :cond_1
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->checkedButtons:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p2, p1, v0}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    goto :goto_1

    .line 101
    :cond_2
    iget p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->maxCheckCount:I

    const/4 v2, -0x1

    if-eq p2, v2, :cond_4

    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->checkedButtons:Lcom/badlogic/gdx/utils/Array;

    iget p2, p2, Lcom/badlogic/gdx/utils/Array;->size:I

    iget v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->maxCheckCount:I

    if-lt p2, v2, :cond_4

    .line 102
    iget-boolean p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->uncheckLast:Z

    if-eqz p2, :cond_3

    .line 103
    iget p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->minCheckCount:I

    .line 104
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->minCheckCount:I

    .line 105
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->lastChecked:Lcom/badlogic/gdx/scenes/scene2d/ui/Button;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;->setChecked(Z)V

    .line 106
    iput p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->minCheckCount:I

    goto :goto_0

    :cond_3
    return v1

    .line 110
    :cond_4
    :goto_0
    iget-object p2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->checkedButtons:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 111
    iput-object p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->lastChecked:Lcom/badlogic/gdx/scenes/scene2d/ui/Button;

    :goto_1
    return v0
.end method

.method public clear()V
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->buttons:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 74
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->checkedButtons:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method public getAllChecked()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation

    .line 141
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->checkedButtons:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public getButtons()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->buttons:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public getChecked()Lcom/badlogic/gdx/scenes/scene2d/ui/Button;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 130
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->checkedButtons:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->checkedButtons:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getCheckedIndex()I
    .locals 3

    .line 136
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->checkedButtons:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->buttons:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->checkedButtons:Lcom/badlogic/gdx/utils/Array;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/Array;->indexOf(Ljava/lang/Object;Z)I

    move-result v0

    return v0

    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public remove(Lcom/badlogic/gdx/scenes/scene2d/ui/Button;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 61
    iput-object v0, p1, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;->buttonGroup:Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;

    .line 62
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->buttons:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    .line 63
    iget-object v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->checkedButtons:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    return-void

    .line 60
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "button cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public varargs remove([Lcom/badlogic/gdx/scenes/scene2d/ui/Button;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    .line 68
    array-length v1, p1

    :goto_0
    if-ge v0, v1, :cond_0

    .line 69
    aget-object v2, p1, v0

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->remove(Lcom/badlogic/gdx/scenes/scene2d/ui/Button;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void

    .line 67
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "buttons cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public setChecked(Ljava/lang/String;)V
    .locals 4

    if-eqz p1, :cond_2

    const/4 v0, 0x0

    .line 80
    iget-object v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->buttons:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    :goto_0
    if-ge v0, v1, :cond_1

    .line 81
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->buttons:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;

    .line 82
    instance-of v3, v2, Lcom/badlogic/gdx/scenes/scene2d/ui/TextButton;

    if-eqz v3, :cond_0

    move-object v3, v2

    check-cast v3, Lcom/badlogic/gdx/scenes/scene2d/ui/TextButton;

    invoke-virtual {v3}, Lcom/badlogic/gdx/scenes/scene2d/ui/TextButton;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 p1, 0x1

    .line 83
    invoke-virtual {v2, p1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;->setChecked(Z)V

    return-void

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void

    .line 79
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "text cannot be null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public setMaxCheckCount(I)V
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, -0x1

    .line 156
    :cond_0
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->maxCheckCount:I

    return-void
.end method

.method public setMinCheckCount(I)V
    .locals 0

    .line 150
    iput p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->minCheckCount:I

    return-void
.end method

.method public setUncheckLast(Z)V
    .locals 0

    .line 163
    iput-boolean p1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->uncheckLast:Z

    return-void
.end method

.method public uncheckAll()V
    .locals 5

    .line 119
    iget v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->minCheckCount:I

    const/4 v1, 0x0

    .line 120
    iput v1, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->minCheckCount:I

    .line 121
    iget-object v2, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->buttons:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    .line 122
    iget-object v4, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->buttons:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;

    .line 123
    invoke-virtual {v4, v1}, Lcom/badlogic/gdx/scenes/scene2d/ui/Button;->setChecked(Z)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 125
    :cond_0
    iput v0, p0, Lcom/badlogic/gdx/scenes/scene2d/ui/ButtonGroup;->minCheckCount:I

    return-void
.end method
