.class Lcom/badlogic/gdx/backends/android/AndroidGraphics$AndroidMonitor;
.super Lcom/badlogic/gdx/Graphics$Monitor;
.source "AndroidGraphics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/backends/android/AndroidGraphics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AndroidMonitor"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/backends/android/AndroidGraphics;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/backends/android/AndroidGraphics;IILjava/lang/String;)V
    .locals 0

    .line 745
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidGraphics$AndroidMonitor;->this$0:Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    .line 746
    invoke-direct {p0, p2, p3, p4}, Lcom/badlogic/gdx/Graphics$Monitor;-><init>(IILjava/lang/String;)V

    return-void
.end method
