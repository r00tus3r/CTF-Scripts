.class Lcom/badlogic/gdx/backends/android/AndroidInput$2;
.super Lcom/badlogic/gdx/utils/Pool;
.source "AndroidInput.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/backends/android/AndroidInput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/utils/Pool<",
        "Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/backends/android/AndroidInput;II)V
    .locals 0

    .line 94
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$2;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    invoke-direct {p0, p2, p3}, Lcom/badlogic/gdx/utils/Pool;-><init>(II)V

    return-void
.end method


# virtual methods
.method protected newObject()Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;
    .locals 1

    .line 96
    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;

    invoke-direct {v0}, Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;-><init>()V

    return-object v0
.end method

.method protected bridge synthetic newObject()Ljava/lang/Object;
    .locals 1

    .line 94
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/AndroidInput$2;->newObject()Lcom/badlogic/gdx/backends/android/AndroidInput$TouchEvent;

    move-result-object v0

    return-object v0
.end method
