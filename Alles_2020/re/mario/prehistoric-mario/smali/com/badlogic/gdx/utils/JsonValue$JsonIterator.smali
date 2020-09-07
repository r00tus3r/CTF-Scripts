.class public Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;
.super Ljava/lang/Object;
.source "JsonValue.java"

# interfaces
.implements Ljava/util/Iterator;
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/JsonValue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "JsonIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/badlogic/gdx/utils/JsonValue;",
        ">;",
        "Ljava/lang/Iterable<",
        "Lcom/badlogic/gdx/utils/JsonValue;",
        ">;"
    }
.end annotation


# instance fields
.field current:Lcom/badlogic/gdx/utils/JsonValue;

.field entry:Lcom/badlogic/gdx/utils/JsonValue;

.field final synthetic this$0:Lcom/badlogic/gdx/utils/JsonValue;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 0

    .line 1187
    iput-object p1, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->this$0:Lcom/badlogic/gdx/utils/JsonValue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1188
    iget-object p1, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->this$0:Lcom/badlogic/gdx/utils/JsonValue;

    iget-object p1, p1, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->entry:Lcom/badlogic/gdx/utils/JsonValue;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 1192
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->entry:Lcom/badlogic/gdx/utils/JsonValue;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/badlogic/gdx/utils/JsonValue;",
            ">;"
        }
    .end annotation

    return-object p0
.end method

.method public next()Lcom/badlogic/gdx/utils/JsonValue;
    .locals 1

    .line 1196
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->entry:Lcom/badlogic/gdx/utils/JsonValue;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->current:Lcom/badlogic/gdx/utils/JsonValue;

    .line 1197
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->current:Lcom/badlogic/gdx/utils/JsonValue;

    if-eqz v0, :cond_0

    .line 1198
    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->entry:Lcom/badlogic/gdx/utils/JsonValue;

    .line 1199
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->current:Lcom/badlogic/gdx/utils/JsonValue;

    return-object v0

    .line 1197
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 1187
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->next()Lcom/badlogic/gdx/utils/JsonValue;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 1203
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->current:Lcom/badlogic/gdx/utils/JsonValue;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->prev:Lcom/badlogic/gdx/utils/JsonValue;

    if-nez v0, :cond_0

    .line 1204
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->this$0:Lcom/badlogic/gdx/utils/JsonValue;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->current:Lcom/badlogic/gdx/utils/JsonValue;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    iput-object v1, v0, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    .line 1205
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->this$0:Lcom/badlogic/gdx/utils/JsonValue;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->this$0:Lcom/badlogic/gdx/utils/JsonValue;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->child:Lcom/badlogic/gdx/utils/JsonValue;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/badlogic/gdx/utils/JsonValue;->prev:Lcom/badlogic/gdx/utils/JsonValue;

    goto :goto_0

    .line 1207
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->current:Lcom/badlogic/gdx/utils/JsonValue;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->prev:Lcom/badlogic/gdx/utils/JsonValue;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->current:Lcom/badlogic/gdx/utils/JsonValue;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    iput-object v1, v0, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    .line 1208
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->current:Lcom/badlogic/gdx/utils/JsonValue;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->current:Lcom/badlogic/gdx/utils/JsonValue;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/JsonValue;->next:Lcom/badlogic/gdx/utils/JsonValue;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->current:Lcom/badlogic/gdx/utils/JsonValue;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/JsonValue;->prev:Lcom/badlogic/gdx/utils/JsonValue;

    iput-object v1, v0, Lcom/badlogic/gdx/utils/JsonValue;->prev:Lcom/badlogic/gdx/utils/JsonValue;

    .line 1210
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/JsonValue$JsonIterator;->this$0:Lcom/badlogic/gdx/utils/JsonValue;

    iget v1, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/badlogic/gdx/utils/JsonValue;->size:I

    return-void
.end method
