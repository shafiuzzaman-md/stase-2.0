; ModuleID = './HeapManager.bc'
source_filename = "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases/Testcases/Sample2Tests/HeapManager/HeapManager.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-gnu"

%struct.HEAP = type { [3 x %struct.PAGE*], [10 x %struct.CHUNK*] }
%struct.PAGE = type { %struct.CHUNK* }
%struct.CHUNK = type { %struct.CHUNK* }
%struct.HEAP_METADATA_T = type { [30 x %struct.Handle_Entry_T], i64 }
%struct.Handle_Entry_T = type { %struct.CHUNK*, i64, i64 }
%struct._EFI_SMM_SYSTEM_TABLE2 = type { %struct.EFI_TABLE_HEADER, i16*, i32, i64 (%struct._EFI_SMM_SYSTEM_TABLE2*, %struct.GUID*, i8*, i64)*, %struct._EFI_MM_CPU_IO_PROTOCOL, i64 (i32, i64, i8**)*, i64 (i8*)*, i64 (i32, i32, i64, i64*)*, i64 (i64, i64)*, i64 (void (i8*)*, i64, i8*)*, i64, i64, i64*, i8**, i64, %struct.EFI_CONFIGURATION_TABLE*, i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8*, %struct.GUID*, i8*)*, i64 (i8*, %struct.GUID*, i8**)*, i64 (%struct.GUID*, i64 (%struct.GUID*, i8*, i8*)*, i8**)*, i64 (i32, %struct.GUID*, i8*, i64*, i8**)*, i64 (%struct.GUID*, i8*, i8**)*, i64 (%struct.GUID*, i8*, i8*, i64*)*, i64 (i64 (i8*, i8*, i8*, i64*)*, %struct.GUID*, i8**)*, i64 (i8*)* }
%struct.EFI_TABLE_HEADER = type { i64, i32, i32, i32, i32 }
%struct.GUID = type { i32, i16, i16, [8 x i8] }
%struct._EFI_MM_CPU_IO_PROTOCOL = type { %struct.EFI_MM_IO_ACCESS, %struct.EFI_MM_IO_ACCESS }
%struct.EFI_MM_IO_ACCESS = type { i64 (%struct._EFI_MM_CPU_IO_PROTOCOL*, i32, i64, i64, i8*)*, i64 (%struct._EFI_MM_CPU_IO_PROTOCOL*, i32, i64, i64, i8*)* }
%struct.EFI_CONFIGURATION_TABLE = type { %struct.GUID, i8* }
%struct._NOTIFY_PROTOCOL_READY_PROTOCOL = type { i32 }
%struct.EFI_SYSTEM_TABLE = type { %struct.EFI_TABLE_HEADER, i16*, i32, i8*, %struct._EFI_SIMPLE_TEXT_INPUT_PROTOCOL*, i8*, %struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i8*, %struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, %struct.EFI_RUNTIME_SERVICES*, %struct.EFI_BOOT_SERVICES*, i64, %struct.EFI_CONFIGURATION_TABLE* }
%struct._EFI_SIMPLE_TEXT_INPUT_PROTOCOL = type { i64 (%struct._EFI_SIMPLE_TEXT_INPUT_PROTOCOL*, i8)*, i64 (%struct._EFI_SIMPLE_TEXT_INPUT_PROTOCOL*, %struct.EFI_INPUT_KEY*)*, i8* }
%struct.EFI_INPUT_KEY = type { i16, i16 }
%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL = type { i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i8)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i16*)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i16*)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i64, i64*, i64*)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i64)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i64)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i64, i64)*, i64 (%struct._EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL*, i8)*, %struct.EFI_SIMPLE_TEXT_OUTPUT_MODE* }
%struct.EFI_SIMPLE_TEXT_OUTPUT_MODE = type { i32, i32, i32, i32, i32, i8 }
%struct.EFI_RUNTIME_SERVICES = type { %struct.EFI_TABLE_HEADER, i64 (%struct.EFI_TIME*, %struct.EFI_TIME_CAPABILITIES*)*, i64 (%struct.EFI_TIME*)*, i64 (i8*, i8*, %struct.EFI_TIME*)*, i64 (i8, %struct.EFI_TIME*)*, i64 (i64, i64, i32, %struct.EFI_MEMORY_DESCRIPTOR*)*, i64 (i64, i8**)*, i64 (i16*, %struct.GUID*, i32*, i64*, i8*)*, i64 (i64*, i16*, %struct.GUID*)*, i64 (i16*, %struct.GUID*, i32, i64, i8*)*, i64 (i32*)*, void (i32, i64, i64, i8*)*, i64 (%struct.EFI_CAPSULE_HEADER**, i64, i64)*, i64 (%struct.EFI_CAPSULE_HEADER**, i64, i64*, i32*)*, i64 (i32, i64*, i64*, i64*)* }
%struct.EFI_TIME = type { i16, i8, i8, i8, i8, i8, i8, i32, i16, i8, i8 }
%struct.EFI_TIME_CAPABILITIES = type { i32, i32, i8 }
%struct.EFI_MEMORY_DESCRIPTOR = type { i32, i64, i64, i64, i64 }
%struct.EFI_CAPSULE_HEADER = type { %struct.GUID, i32, i32, i32 }
%struct.EFI_BOOT_SERVICES = type { %struct.EFI_TABLE_HEADER, i64 (i64)*, void (i64)*, i64 (i32, i32, i64, i64*)*, i64 (i64, i64)*, i64 (i64*, %struct.EFI_MEMORY_DESCRIPTOR*, i64*, i64*, i32*)*, i64 (i32, i64, i8**)*, i64 (i8*)*, i64 (i32, i64, void (i8*, i8*)*, i8*, i8**)*, i64 (i8*, i32, i64)*, i64 (i64, i8**, i64*)*, i64 (i8*)*, i64 (i8*)*, i64 (i8*)*, i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8*, %struct.GUID*, i8*, i8*)*, i64 (i8*, %struct.GUID*, i8*)*, i64 (i8*, %struct.GUID*, i8**)*, i8*, i64 (%struct.GUID*, i8*, i8**)*, i64 (i32, %struct.GUID*, i8*, i64*, i8**)*, i64 (%struct.GUID*, %struct.EFI_DEVICE_PATH_PROTOCOL**, i8**)*, i64 (%struct.GUID*, i8*)*, i64 (i8, i8*, %struct.EFI_DEVICE_PATH_PROTOCOL*, i8*, i64, i8**)*, i64 (i8*, i64*, i16**)*, i64 (i8*, i64, i64, i16*)*, i64 (i8*)*, i64 (i8*, i64)*, i64 (i64*)*, i64 (i64)*, i64 (i64, i64, i64, i16*)*, i64 (i8*, i8**, %struct.EFI_DEVICE_PATH_PROTOCOL*, i8)*, i64 (i8*, i8*, i8*)*, i64 (i8*, %struct.GUID*, i8**, i8*, i8*, i32)*, i64 (i8*, %struct.GUID*, i8*, i8*)*, i64 (i8*, %struct.GUID*, %struct.EFI_OPEN_PROTOCOL_INFORMATION_ENTRY**, i64*)*, i64 (i8*, %struct.GUID***, i64*)*, i64 (i32, %struct.GUID*, i8*, i64*, i8***)*, i64 (%struct.GUID*, i8*, i8**)*, i64 (i8**, ...)*, i64 (i8*, ...)*, i64 (i8*, i64, i32*)*, void (i8*, i8*, i64)*, void (i8*, i64, i8)*, i64 (i32, i64, void (i8*, i8*)*, i8*, %struct.GUID*, i8**)* }
%struct.EFI_DEVICE_PATH_PROTOCOL = type { i8, i8, [2 x i8] }
%struct.EFI_OPEN_PROTOCOL_INFORMATION_ENTRY = type { i8*, i8*, i32, i32 }
%struct._HEAP_MANAGER_PROTOCOL = type { i64 (i64, i64*)*, i64 (i64, %struct.CHUNK**)*, i64 (i64)*, i64 (...)*, i64 (...)*, i64 (...)*, i64 (i64, %struct.PAGE**)*, i64 (...)*, i64 (...)* }

@BlockSizes = dso_local global [3 x i64] [i64 128, i64 256, i64 512], align 16, !dbg !0
@Heap = dso_local global %struct.HEAP zeroinitializer, align 8, !dbg !100
@.str = private unnamed_addr constant [27 x i8] c"No free chunks available!\0A\00", align 1
@HeapMd = dso_local global %struct.HEAP_METADATA_T zeroinitializer, align 8, !dbg !113
@.str.1 = private unnamed_addr constant [28 x i8] c"No free handles available!\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Invalid selection!\0A\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"Freed chunk(%d)(%d) at %p (0x%x)\0A\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Invalid chunk size.\0A\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"Free list is empty\0A\00", align 1
@.str.6 = private unnamed_addr constant [19 x i8] c"Free list (0x%x):\0A\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"  Chunk at %p (points to %p)\0A\00", align 1
@.str.8 = private unnamed_addr constant [16 x i8] c"\0AHandle Table:\0A\00", align 1
@.str.9 = private unnamed_addr constant [37 x i8] c"Handle | Address   | Size  | In Use\0A\00", align 1
@.str.10 = private unnamed_addr constant [37 x i8] c"-------|-----------|-------|-------\0A\00", align 1
@.str.11 = private unnamed_addr constant [25 x i8] c"%6d | %p | 0x%03x | Yes \00", align 1
@.str.12 = private unnamed_addr constant [30 x i8] c"%6d | (Free)    | -     | No \00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"<--Top\00", align 1
@.str.14 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.15 = private unnamed_addr constant [28 x i8] c"AllocateAlignedPages failed\00", align 1
@.str.16 = private unnamed_addr constant [24 x i8] c"InitializeHeapMetadata\0A\00", align 1
@.str.17 = private unnamed_addr constant [16 x i8] c"InitializeHeap\0A\00", align 1
@gSmst = external global %struct._EFI_SMM_SYSTEM_TABLE2*, align 8
@gEfiHeapManagerProtocolGuid = external global %struct.GUID, align 4
@mHeapManagerReady = dso_local global %struct._NOTIFY_PROTOCOL_READY_PROTOCOL zeroinitializer, align 4, !dbg !92
@gEfiHeapManagerReadyProtocolGuid = external global %struct.GUID, align 4

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @GetBlockSize(i64 noundef %0, i64* noundef %1) #0 !dbg !139 {
  %3 = alloca i64, align 8
  %4 = alloca i64*, align 8
  store i64 %0, i64* %3, align 8
  call void @llvm.dbg.declare(metadata i64* %3, metadata !146, metadata !DIExpression()), !dbg !147
  store i64* %1, i64** %4, align 8
  call void @llvm.dbg.declare(metadata i64** %4, metadata !148, metadata !DIExpression()), !dbg !149
  %5 = load i64, i64* %3, align 8, !dbg !150
  %6 = icmp ule i64 %5, 128, !dbg !150
  br i1 %6, label %7, label %9, !dbg !150

7:                                                ; preds = %2
  %8 = load i64*, i64** %4, align 8, !dbg !151
  store i64 0, i64* %8, align 8, !dbg !151
  br label %9, !dbg !151

9:                                                ; preds = %7, %2
  %10 = load i64, i64* %3, align 8, !dbg !153
  %11 = icmp ule i64 %10, 256, !dbg !153
  br i1 %11, label %12, label %14, !dbg !153

12:                                               ; preds = %9
  %13 = load i64*, i64** %4, align 8, !dbg !154
  store i64 1, i64* %13, align 8, !dbg !154
  br label %14, !dbg !154

14:                                               ; preds = %12, %9
  %15 = load i64, i64* %3, align 8, !dbg !156
  %16 = icmp ule i64 %15, 512, !dbg !156
  br i1 %16, label %17, label %19, !dbg !156

17:                                               ; preds = %14
  %18 = load i64*, i64** %4, align 8, !dbg !157
  store i64 2, i64* %18, align 8, !dbg !157
  br label %21, !dbg !157

19:                                               ; preds = %14
  %20 = load i64*, i64** %4, align 8, !dbg !159
  store i64 -1, i64* %20, align 8, !dbg !159
  br label %21, !dbg !159

21:                                               ; preds = %19, %17
  ret i64 0, !dbg !160
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @AllocateChunk(i64 noundef %0, %struct.CHUNK** noundef %1) #0 !dbg !161 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.CHUNK**, align 8
  %6 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  call void @llvm.dbg.declare(metadata i64* %4, metadata !165, metadata !DIExpression()), !dbg !166
  store %struct.CHUNK** %1, %struct.CHUNK*** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.CHUNK*** %5, metadata !167, metadata !DIExpression()), !dbg !168
  %7 = load i64, i64* %4, align 8, !dbg !169
  %8 = icmp ult i64 %7, 0, !dbg !169
  br i1 %8, label %9, label %10, !dbg !169

9:                                                ; preds = %2
  store i64 -9223372036854775806, i64* %3, align 8, !dbg !170
  br label %70, !dbg !170

10:                                               ; preds = %2
  %11 = load i64, i64* %4, align 8, !dbg !173
  %12 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %11, !dbg !173
  %13 = load %struct.CHUNK*, %struct.CHUNK** %12, align 8, !dbg !173
  %14 = icmp ne %struct.CHUNK* %13, null, !dbg !173
  br i1 %14, label %28, label %15, !dbg !173

15:                                               ; preds = %10
  br label %16, !dbg !174

16:                                               ; preds = %15
  %17 = call i8 @DebugPrintEnabled() #3, !dbg !177
  %18 = icmp ne i8 %17, 0, !dbg !177
  br i1 %18, label %19, label %26, !dbg !177

19:                                               ; preds = %16
  br label %20, !dbg !179

20:                                               ; preds = %19
  %21 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !182
  %22 = icmp ne i8 %21, 0, !dbg !182
  br i1 %22, label %23, label %24, !dbg !182

23:                                               ; preds = %20
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0)) #3, !dbg !184
  br label %24, !dbg !184

24:                                               ; preds = %23, %20
  br label %25, !dbg !182

25:                                               ; preds = %24
  br label %26, !dbg !179

26:                                               ; preds = %25, %16
  br label %27, !dbg !177

27:                                               ; preds = %26
  store i64 -9223372036854775799, i64* %3, align 8, !dbg !187
  br label %70, !dbg !187

28:                                               ; preds = %10
  %29 = load i64, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !188
  %30 = icmp slt i64 %29, 0, !dbg !188
  br i1 %30, label %31, label %44, !dbg !188

31:                                               ; preds = %28
  store i64 -1, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !189
  br label %32, !dbg !192

32:                                               ; preds = %31
  %33 = call i8 @DebugPrintEnabled() #3, !dbg !193
  %34 = icmp ne i8 %33, 0, !dbg !193
  br i1 %34, label %35, label %42, !dbg !193

35:                                               ; preds = %32
  br label %36, !dbg !195

36:                                               ; preds = %35
  %37 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !198
  %38 = icmp ne i8 %37, 0, !dbg !198
  br i1 %38, label %39, label %40, !dbg !198

39:                                               ; preds = %36
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i64 0, i64 0)) #3, !dbg !200
  br label %40, !dbg !200

40:                                               ; preds = %39, %36
  br label %41, !dbg !198

41:                                               ; preds = %40
  br label %42, !dbg !195

42:                                               ; preds = %41, %32
  br label %43, !dbg !193

43:                                               ; preds = %42
  store i64 -9223372036854775799, i64* %3, align 8, !dbg !203
  br label %70, !dbg !203

44:                                               ; preds = %28
  %45 = load i64, i64* %4, align 8, !dbg !204
  %46 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %45, !dbg !204
  %47 = load %struct.CHUNK*, %struct.CHUNK** %46, align 8, !dbg !204
  %48 = load %struct.CHUNK**, %struct.CHUNK*** %5, align 8, !dbg !204
  store %struct.CHUNK* %47, %struct.CHUNK** %48, align 8, !dbg !204
  %49 = load i64, i64* %4, align 8, !dbg !205
  %50 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %49, !dbg !205
  %51 = load %struct.CHUNK*, %struct.CHUNK** %50, align 8, !dbg !205
  %52 = getelementptr inbounds %struct.CHUNK, %struct.CHUNK* %51, i32 0, i32 0, !dbg !205
  %53 = load %struct.CHUNK*, %struct.CHUNK** %52, align 8, !dbg !205
  %54 = load i64, i64* %4, align 8, !dbg !205
  %55 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %54, !dbg !205
  store %struct.CHUNK* %53, %struct.CHUNK** %55, align 8, !dbg !205
  call void @llvm.dbg.declare(metadata i64* %6, metadata !206, metadata !DIExpression()), !dbg !207
  %56 = load i64, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !207
  %57 = add nsw i64 %56, -1, !dbg !207
  store i64 %57, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !207
  store i64 %56, i64* %6, align 8, !dbg !207
  %58 = load %struct.CHUNK**, %struct.CHUNK*** %5, align 8, !dbg !208
  %59 = load %struct.CHUNK*, %struct.CHUNK** %58, align 8, !dbg !208
  %60 = load i64, i64* %6, align 8, !dbg !208
  %61 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %60, !dbg !208
  %62 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %61, i32 0, i32 0, !dbg !208
  store %struct.CHUNK* %59, %struct.CHUNK** %62, align 8, !dbg !208
  %63 = load i64, i64* %4, align 8, !dbg !209
  %64 = load i64, i64* %6, align 8, !dbg !209
  %65 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %64, !dbg !209
  %66 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %65, i32 0, i32 1, !dbg !209
  store i64 %63, i64* %66, align 8, !dbg !209
  %67 = load i64, i64* %6, align 8, !dbg !210
  %68 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %67, !dbg !210
  %69 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %68, i32 0, i32 2, !dbg !210
  store i64 1, i64* %69, align 8, !dbg !210
  store i64 0, i64* %3, align 8, !dbg !211
  br label %70, !dbg !211

70:                                               ; preds = %44, %43, %27, %9
  %71 = load i64, i64* %3, align 8, !dbg !212
  ret i64 %71, !dbg !212
}

; Function Attrs: noimplicitfloat noredzone
declare dso_local i8 @DebugPrintEnabled() #2

; Function Attrs: noimplicitfloat noredzone
declare dso_local i8 @DebugPrintLevelEnabled(i64 noundef) #2

; Function Attrs: noimplicitfloat noredzone
declare dso_local void @DebugPrint(i64 noundef, i8* noundef, ...) #2

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @FreeChunk(i64 noundef %0) #0 !dbg !213 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca %struct.CHUNK*, align 8
  %5 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  call void @llvm.dbg.declare(metadata i64* %3, metadata !216, metadata !DIExpression()), !dbg !217
  %6 = load i64, i64* %3, align 8, !dbg !218
  %7 = icmp slt i64 %6, 0, !dbg !218
  br i1 %7, label %17, label %8, !dbg !218

8:                                                ; preds = %1
  %9 = load i64, i64* %3, align 8, !dbg !218
  %10 = icmp sge i64 %9, 30, !dbg !218
  br i1 %10, label %17, label %11, !dbg !218

11:                                               ; preds = %8
  %12 = load i64, i64* %3, align 8, !dbg !218
  %13 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %12, !dbg !218
  %14 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %13, i32 0, i32 2, !dbg !218
  %15 = load i64, i64* %14, align 8, !dbg !218
  %16 = icmp ne i64 %15, 0, !dbg !218
  br i1 %16, label %30, label %17, !dbg !218

17:                                               ; preds = %11, %8, %1
  br label %18, !dbg !219

18:                                               ; preds = %17
  %19 = call i8 @DebugPrintEnabled() #3, !dbg !222
  %20 = icmp ne i8 %19, 0, !dbg !222
  br i1 %20, label %21, label %28, !dbg !222

21:                                               ; preds = %18
  br label %22, !dbg !224

22:                                               ; preds = %21
  %23 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !227
  %24 = icmp ne i8 %23, 0, !dbg !227
  br i1 %24, label %25, label %26, !dbg !227

25:                                               ; preds = %22
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #3, !dbg !229
  br label %26, !dbg !229

26:                                               ; preds = %25, %22
  br label %27, !dbg !227

27:                                               ; preds = %26
  br label %28, !dbg !224

28:                                               ; preds = %27, %18
  br label %29, !dbg !222

29:                                               ; preds = %28
  store i64 -9223372036854775806, i64* %2, align 8, !dbg !232
  br label %70, !dbg !232

30:                                               ; preds = %11
  call void @llvm.dbg.declare(metadata %struct.CHUNK** %4, metadata !233, metadata !DIExpression()), !dbg !234
  %31 = load i64, i64* %3, align 8, !dbg !234
  %32 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %31, !dbg !234
  %33 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %32, i32 0, i32 0, !dbg !234
  %34 = load %struct.CHUNK*, %struct.CHUNK** %33, align 8, !dbg !234
  store %struct.CHUNK* %34, %struct.CHUNK** %4, align 8, !dbg !234
  call void @llvm.dbg.declare(metadata i64* %5, metadata !235, metadata !DIExpression()), !dbg !236
  %35 = load i64, i64* %3, align 8, !dbg !236
  %36 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %35, !dbg !236
  %37 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %36, i32 0, i32 1, !dbg !236
  %38 = load i64, i64* %37, align 8, !dbg !236
  store i64 %38, i64* %5, align 8, !dbg !236
  %39 = load i64, i64* %5, align 8, !dbg !237
  %40 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %39, !dbg !237
  %41 = load %struct.CHUNK*, %struct.CHUNK** %40, align 8, !dbg !237
  %42 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !237
  %43 = getelementptr inbounds %struct.CHUNK, %struct.CHUNK* %42, i32 0, i32 0, !dbg !237
  store %struct.CHUNK* %41, %struct.CHUNK** %43, align 8, !dbg !237
  %44 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !238
  %45 = load i64, i64* %5, align 8, !dbg !238
  %46 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %45, !dbg !238
  store %struct.CHUNK* %44, %struct.CHUNK** %46, align 8, !dbg !238
  %47 = load i64, i64* %3, align 8, !dbg !239
  %48 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %47, !dbg !239
  %49 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %48, i32 0, i32 2, !dbg !239
  store i64 0, i64* %49, align 8, !dbg !239
  %50 = load i64, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !240
  %51 = add nsw i64 %50, 1, !dbg !240
  store i64 %51, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !240
  br label %52, !dbg !241

52:                                               ; preds = %30
  %53 = call i8 @DebugPrintEnabled() #3, !dbg !242
  %54 = icmp ne i8 %53, 0, !dbg !242
  br i1 %54, label %55, label %68, !dbg !242

55:                                               ; preds = %52
  br label %56, !dbg !244

56:                                               ; preds = %55
  %57 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !247
  %58 = icmp ne i8 %57, 0, !dbg !247
  br i1 %58, label %59, label %66, !dbg !247

59:                                               ; preds = %56
  %60 = load i64, i64* %3, align 8, !dbg !249
  %61 = load i64, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !249
  %62 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !249
  %63 = load i64, i64* %5, align 8, !dbg !249
  %64 = getelementptr inbounds [3 x i64], [3 x i64]* @BlockSizes, i64 0, i64 %63, !dbg !249
  %65 = load i64, i64* %64, align 8, !dbg !249
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0), i64 noundef %60, i64 noundef %61, %struct.CHUNK* noundef %62, i64 noundef %65) #3, !dbg !249
  br label %66, !dbg !249

66:                                               ; preds = %59, %56
  br label %67, !dbg !247

67:                                               ; preds = %66
  br label %68, !dbg !244

68:                                               ; preds = %67, %52
  br label %69, !dbg !242

69:                                               ; preds = %68
  store i64 0, i64* %2, align 8, !dbg !252
  br label %70, !dbg !252

70:                                               ; preds = %69, %29
  %71 = load i64, i64* %2, align 8, !dbg !253
  ret i64 %71, !dbg !253
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @FreeAllocList() #0 !dbg !254 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64* %2, metadata !257, metadata !DIExpression()), !dbg !258
  store i64 0, i64* %2, align 8, !dbg !258
  call void @llvm.dbg.declare(metadata i64* %3, metadata !259, metadata !DIExpression()), !dbg !261
  store i64 29, i64* %3, align 8, !dbg !261
  br label %4, !dbg !261

4:                                                ; preds = %22, %0
  %5 = load i64, i64* %3, align 8, !dbg !261
  %6 = icmp sge i64 %5, 0, !dbg !261
  br i1 %6, label %7, label %25, !dbg !261

7:                                                ; preds = %4
  %8 = load i64, i64* %3, align 8, !dbg !262
  %9 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %8, !dbg !262
  %10 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %9, i32 0, i32 2, !dbg !262
  %11 = load i64, i64* %10, align 8, !dbg !262
  %12 = icmp ne i64 %11, 0, !dbg !262
  br i1 %12, label %13, label %21, !dbg !262

13:                                               ; preds = %7
  %14 = load i64, i64* %3, align 8, !dbg !265
  %15 = call i64 @FreeChunk(i64 noundef %14) #3, !dbg !265
  store i64 %15, i64* %2, align 8, !dbg !265
  %16 = load i64, i64* %2, align 8, !dbg !268
  %17 = icmp slt i64 %16, 0, !dbg !268
  br i1 %17, label %18, label %20, !dbg !268

18:                                               ; preds = %13
  %19 = load i64, i64* %2, align 8, !dbg !269
  store i64 %19, i64* %1, align 8, !dbg !269
  br label %27, !dbg !269

20:                                               ; preds = %13
  br label %21, !dbg !272

21:                                               ; preds = %20, %7
  br label %22, !dbg !273

22:                                               ; preds = %21
  %23 = load i64, i64* %3, align 8, !dbg !274
  %24 = add nsw i64 %23, -1, !dbg !274
  store i64 %24, i64* %3, align 8, !dbg !274
  br label %4, !dbg !274, !llvm.loop !275

25:                                               ; preds = %4
  %26 = load i64, i64* %2, align 8, !dbg !278
  store i64 %26, i64* %1, align 8, !dbg !278
  br label %27, !dbg !278

27:                                               ; preds = %25, %18
  %28 = load i64, i64* %1, align 8, !dbg !279
  ret i64 %28, !dbg !279
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @DisplayFreeList(i64 noundef %0) #0 !dbg !280 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca %struct.CHUNK*, align 8
  store i64 %0, i64* %3, align 8
  call void @llvm.dbg.declare(metadata i64* %3, metadata !283, metadata !DIExpression()), !dbg !284
  %5 = load i64, i64* %3, align 8, !dbg !285
  %6 = icmp ult i64 %5, 1, !dbg !285
  br i1 %6, label %10, label %7, !dbg !285

7:                                                ; preds = %1
  %8 = load i64, i64* %3, align 8, !dbg !285
  %9 = icmp ugt i64 %8, 3, !dbg !285
  br i1 %9, label %10, label %23, !dbg !285

10:                                               ; preds = %7, %1
  br label %11, !dbg !286

11:                                               ; preds = %10
  %12 = call i8 @DebugPrintEnabled() #3, !dbg !289
  %13 = icmp ne i8 %12, 0, !dbg !289
  br i1 %13, label %14, label %21, !dbg !289

14:                                               ; preds = %11
  br label %15, !dbg !291

15:                                               ; preds = %14
  %16 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !294
  %17 = icmp ne i8 %16, 0, !dbg !294
  br i1 %17, label %18, label %19, !dbg !294

18:                                               ; preds = %15
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)) #3, !dbg !296
  br label %19, !dbg !296

19:                                               ; preds = %18, %15
  br label %20, !dbg !294

20:                                               ; preds = %19
  br label %21, !dbg !291

21:                                               ; preds = %20, %11
  br label %22, !dbg !289

22:                                               ; preds = %21
  store i64 -9223372036854775806, i64* %2, align 8, !dbg !299
  br label %84, !dbg !299

23:                                               ; preds = %7
  call void @llvm.dbg.declare(metadata %struct.CHUNK** %4, metadata !300, metadata !DIExpression()), !dbg !301
  %24 = load i64, i64* %3, align 8, !dbg !301
  %25 = sub i64 %24, 1, !dbg !301
  %26 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %25, !dbg !301
  %27 = load %struct.CHUNK*, %struct.CHUNK** %26, align 8, !dbg !301
  store %struct.CHUNK* %27, %struct.CHUNK** %4, align 8, !dbg !301
  %28 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !302
  %29 = icmp ne %struct.CHUNK* %28, null, !dbg !302
  br i1 %29, label %43, label %30, !dbg !302

30:                                               ; preds = %23
  br label %31, !dbg !303

31:                                               ; preds = %30
  %32 = call i8 @DebugPrintEnabled() #3, !dbg !306
  %33 = icmp ne i8 %32, 0, !dbg !306
  br i1 %33, label %34, label %41, !dbg !306

34:                                               ; preds = %31
  br label %35, !dbg !308

35:                                               ; preds = %34
  %36 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !311
  %37 = icmp ne i8 %36, 0, !dbg !311
  br i1 %37, label %38, label %39, !dbg !311

38:                                               ; preds = %35
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0)) #3, !dbg !313
  br label %39, !dbg !313

39:                                               ; preds = %38, %35
  br label %40, !dbg !311

40:                                               ; preds = %39
  br label %41, !dbg !308

41:                                               ; preds = %40, %31
  br label %42, !dbg !306

42:                                               ; preds = %41
  store i64 -9223372036854775799, i64* %2, align 8, !dbg !316
  br label %84, !dbg !316

43:                                               ; preds = %23
  br label %44, !dbg !317

44:                                               ; preds = %43
  %45 = call i8 @DebugPrintEnabled() #3, !dbg !318
  %46 = icmp ne i8 %45, 0, !dbg !318
  br i1 %46, label %47, label %58, !dbg !318

47:                                               ; preds = %44
  br label %48, !dbg !320

48:                                               ; preds = %47
  %49 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !323
  %50 = icmp ne i8 %49, 0, !dbg !323
  br i1 %50, label %51, label %56, !dbg !323

51:                                               ; preds = %48
  %52 = load i64, i64* %3, align 8, !dbg !325
  %53 = sub i64 %52, 1, !dbg !325
  %54 = getelementptr inbounds [3 x i64], [3 x i64]* @BlockSizes, i64 0, i64 %53, !dbg !325
  %55 = load i64, i64* %54, align 8, !dbg !325
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.6, i64 0, i64 0), i64 noundef %55) #3, !dbg !325
  br label %56, !dbg !325

56:                                               ; preds = %51, %48
  br label %57, !dbg !323

57:                                               ; preds = %56
  br label %58, !dbg !320

58:                                               ; preds = %57, %44
  br label %59, !dbg !318

59:                                               ; preds = %58
  br label %60, !dbg !328

60:                                               ; preds = %79, %59
  %61 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !328
  %62 = icmp ne %struct.CHUNK* %61, null, !dbg !328
  br i1 %62, label %63, label %83, !dbg !328

63:                                               ; preds = %60
  br label %64, !dbg !329

64:                                               ; preds = %63
  %65 = call i8 @DebugPrintEnabled() #3, !dbg !331
  %66 = icmp ne i8 %65, 0, !dbg !331
  br i1 %66, label %67, label %78, !dbg !331

67:                                               ; preds = %64
  br label %68, !dbg !333

68:                                               ; preds = %67
  %69 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !336
  %70 = icmp ne i8 %69, 0, !dbg !336
  br i1 %70, label %71, label %76, !dbg !336

71:                                               ; preds = %68
  %72 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !338
  %73 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !338
  %74 = getelementptr inbounds %struct.CHUNK, %struct.CHUNK* %73, i32 0, i32 0, !dbg !338
  %75 = load %struct.CHUNK*, %struct.CHUNK** %74, align 8, !dbg !338
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.7, i64 0, i64 0), %struct.CHUNK* noundef %72, %struct.CHUNK* noundef %75) #3, !dbg !338
  br label %76, !dbg !338

76:                                               ; preds = %71, %68
  br label %77, !dbg !336

77:                                               ; preds = %76
  br label %78, !dbg !333

78:                                               ; preds = %77, %64
  br label %79, !dbg !331

79:                                               ; preds = %78
  %80 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !341
  %81 = getelementptr inbounds %struct.CHUNK, %struct.CHUNK* %80, i32 0, i32 0, !dbg !341
  %82 = load %struct.CHUNK*, %struct.CHUNK** %81, align 8, !dbg !341
  store %struct.CHUNK* %82, %struct.CHUNK** %4, align 8, !dbg !341
  br label %60, !dbg !328, !llvm.loop !342

83:                                               ; preds = %60
  store i64 0, i64* %2, align 8, !dbg !344
  br label %84, !dbg !344

84:                                               ; preds = %83, %42, %22
  %85 = load i64, i64* %2, align 8, !dbg !345
  ret i64 %85, !dbg !345
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @DisplayHeapMetadata() #0 !dbg !346 {
  %1 = alloca i64, align 8
  br label %2, !dbg !347

2:                                                ; preds = %0
  %3 = call i8 @DebugPrintEnabled() #3, !dbg !348
  %4 = icmp ne i8 %3, 0, !dbg !348
  br i1 %4, label %5, label %12, !dbg !348

5:                                                ; preds = %2
  br label %6, !dbg !350

6:                                                ; preds = %5
  %7 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !353
  %8 = icmp ne i8 %7, 0, !dbg !353
  br i1 %8, label %9, label %10, !dbg !353

9:                                                ; preds = %6
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i64 0, i64 0)) #3, !dbg !355
  br label %10, !dbg !355

10:                                               ; preds = %9, %6
  br label %11, !dbg !353

11:                                               ; preds = %10
  br label %12, !dbg !350

12:                                               ; preds = %11, %2
  br label %13, !dbg !348

13:                                               ; preds = %12
  br label %14, !dbg !358

14:                                               ; preds = %13
  %15 = call i8 @DebugPrintEnabled() #3, !dbg !359
  %16 = icmp ne i8 %15, 0, !dbg !359
  br i1 %16, label %17, label %24, !dbg !359

17:                                               ; preds = %14
  br label %18, !dbg !361

18:                                               ; preds = %17
  %19 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !364
  %20 = icmp ne i8 %19, 0, !dbg !364
  br i1 %20, label %21, label %22, !dbg !364

21:                                               ; preds = %18
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @.str.9, i64 0, i64 0)) #3, !dbg !366
  br label %22, !dbg !366

22:                                               ; preds = %21, %18
  br label %23, !dbg !364

23:                                               ; preds = %22
  br label %24, !dbg !361

24:                                               ; preds = %23, %14
  br label %25, !dbg !359

25:                                               ; preds = %24
  br label %26, !dbg !369

26:                                               ; preds = %25
  %27 = call i8 @DebugPrintEnabled() #3, !dbg !370
  %28 = icmp ne i8 %27, 0, !dbg !370
  br i1 %28, label %29, label %36, !dbg !370

29:                                               ; preds = %26
  br label %30, !dbg !372

30:                                               ; preds = %29
  %31 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !375
  %32 = icmp ne i8 %31, 0, !dbg !375
  br i1 %32, label %33, label %34, !dbg !375

33:                                               ; preds = %30
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @.str.10, i64 0, i64 0)) #3, !dbg !377
  br label %34, !dbg !377

34:                                               ; preds = %33, %30
  br label %35, !dbg !375

35:                                               ; preds = %34
  br label %36, !dbg !372

36:                                               ; preds = %35, %26
  br label %37, !dbg !370

37:                                               ; preds = %36
  call void @llvm.dbg.declare(metadata i64* %1, metadata !380, metadata !DIExpression()), !dbg !382
  store i64 0, i64* %1, align 8, !dbg !382
  br label %38, !dbg !382

38:                                               ; preds = %115, %37
  %39 = load i64, i64* %1, align 8, !dbg !382
  %40 = icmp slt i64 %39, 30, !dbg !382
  br i1 %40, label %41, label %118, !dbg !382

41:                                               ; preds = %38
  %42 = load i64, i64* %1, align 8, !dbg !383
  %43 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %42, !dbg !383
  %44 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %43, i32 0, i32 2, !dbg !383
  %45 = load i64, i64* %44, align 8, !dbg !383
  %46 = icmp ne i64 %45, 0, !dbg !383
  br i1 %46, label %47, label %71, !dbg !383

47:                                               ; preds = %41
  br label %48, !dbg !386

48:                                               ; preds = %47
  %49 = call i8 @DebugPrintEnabled() #3, !dbg !389
  %50 = icmp ne i8 %49, 0, !dbg !389
  br i1 %50, label %51, label %69, !dbg !389

51:                                               ; preds = %48
  br label %52, !dbg !391

52:                                               ; preds = %51
  %53 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !394
  %54 = icmp ne i8 %53, 0, !dbg !394
  br i1 %54, label %55, label %67, !dbg !394

55:                                               ; preds = %52
  %56 = load i64, i64* %1, align 8, !dbg !396
  %57 = load i64, i64* %1, align 8, !dbg !396
  %58 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %57, !dbg !396
  %59 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %58, i32 0, i32 0, !dbg !396
  %60 = load %struct.CHUNK*, %struct.CHUNK** %59, align 8, !dbg !396
  %61 = load i64, i64* %1, align 8, !dbg !396
  %62 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %61, !dbg !396
  %63 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %62, i32 0, i32 1, !dbg !396
  %64 = load i64, i64* %63, align 8, !dbg !396
  %65 = getelementptr inbounds [3 x i64], [3 x i64]* @BlockSizes, i64 0, i64 %64, !dbg !396
  %66 = load i64, i64* %65, align 8, !dbg !396
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.11, i64 0, i64 0), i64 noundef %56, %struct.CHUNK* noundef %60, i64 noundef %66) #3, !dbg !396
  br label %67, !dbg !396

67:                                               ; preds = %55, %52
  br label %68, !dbg !394

68:                                               ; preds = %67
  br label %69, !dbg !391

69:                                               ; preds = %68, %48
  br label %70, !dbg !389

70:                                               ; preds = %69
  br label %85, !dbg !399

71:                                               ; preds = %41
  br label %72, !dbg !400

72:                                               ; preds = %71
  %73 = call i8 @DebugPrintEnabled() #3, !dbg !402
  %74 = icmp ne i8 %73, 0, !dbg !402
  br i1 %74, label %75, label %83, !dbg !402

75:                                               ; preds = %72
  br label %76, !dbg !404

76:                                               ; preds = %75
  %77 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !407
  %78 = icmp ne i8 %77, 0, !dbg !407
  br i1 %78, label %79, label %81, !dbg !407

79:                                               ; preds = %76
  %80 = load i64, i64* %1, align 8, !dbg !409
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.12, i64 0, i64 0), i64 noundef %80) #3, !dbg !409
  br label %81, !dbg !409

81:                                               ; preds = %79, %76
  br label %82, !dbg !407

82:                                               ; preds = %81
  br label %83, !dbg !404

83:                                               ; preds = %82, %72
  br label %84, !dbg !402

84:                                               ; preds = %83
  br label %85, !dbg !412

85:                                               ; preds = %84, %70
  %86 = load i64, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !413
  %87 = load i64, i64* %1, align 8, !dbg !413
  %88 = icmp eq i64 %86, %87, !dbg !413
  br i1 %88, label %89, label %102, !dbg !413

89:                                               ; preds = %85
  br label %90, !dbg !414

90:                                               ; preds = %89
  %91 = call i8 @DebugPrintEnabled() #3, !dbg !416
  %92 = icmp ne i8 %91, 0, !dbg !416
  br i1 %92, label %93, label %100, !dbg !416

93:                                               ; preds = %90
  br label %94, !dbg !418

94:                                               ; preds = %93
  %95 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !421
  %96 = icmp ne i8 %95, 0, !dbg !421
  br i1 %96, label %97, label %98, !dbg !421

97:                                               ; preds = %94
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i64 0, i64 0)) #3, !dbg !423
  br label %98, !dbg !423

98:                                               ; preds = %97, %94
  br label %99, !dbg !421

99:                                               ; preds = %98
  br label %100, !dbg !418

100:                                              ; preds = %99, %90
  br label %101, !dbg !416

101:                                              ; preds = %100
  br label %102, !dbg !416

102:                                              ; preds = %101, %85
  br label %103, !dbg !426

103:                                              ; preds = %102
  %104 = call i8 @DebugPrintEnabled() #3, !dbg !427
  %105 = icmp ne i8 %104, 0, !dbg !427
  br i1 %105, label %106, label %113, !dbg !427

106:                                              ; preds = %103
  br label %107, !dbg !429

107:                                              ; preds = %106
  %108 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !432
  %109 = icmp ne i8 %108, 0, !dbg !432
  br i1 %109, label %110, label %111, !dbg !432

110:                                              ; preds = %107
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i64 0, i64 0)) #3, !dbg !434
  br label %111, !dbg !434

111:                                              ; preds = %110, %107
  br label %112, !dbg !432

112:                                              ; preds = %111
  br label %113, !dbg !429

113:                                              ; preds = %112, %103
  br label %114, !dbg !427

114:                                              ; preds = %113
  br label %115, !dbg !437

115:                                              ; preds = %114
  %116 = load i64, i64* %1, align 8, !dbg !438
  %117 = add nsw i64 %116, 1, !dbg !438
  store i64 %117, i64* %1, align 8, !dbg !438
  br label %38, !dbg !438, !llvm.loop !439

118:                                              ; preds = %38
  br label %119, !dbg !441

119:                                              ; preds = %118
  %120 = call i8 @DebugPrintEnabled() #3, !dbg !442
  %121 = icmp ne i8 %120, 0, !dbg !442
  br i1 %121, label %122, label %129, !dbg !442

122:                                              ; preds = %119
  br label %123, !dbg !444

123:                                              ; preds = %122
  %124 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !447
  %125 = icmp ne i8 %124, 0, !dbg !447
  br i1 %125, label %126, label %127, !dbg !447

126:                                              ; preds = %123
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i64 0, i64 0)) #3, !dbg !449
  br label %127, !dbg !449

127:                                              ; preds = %126, %123
  br label %128, !dbg !447

128:                                              ; preds = %127
  br label %129, !dbg !444

129:                                              ; preds = %128, %119
  br label %130, !dbg !442

130:                                              ; preds = %129
  ret i64 0, !dbg !452
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @InitializePage(i64 noundef %0, %struct.PAGE** noundef %1) #0 !dbg !453 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct.PAGE**, align 8
  store i64 %0, i64* %4, align 8
  call void @llvm.dbg.declare(metadata i64* %4, metadata !457, metadata !DIExpression()), !dbg !458
  store %struct.PAGE** %1, %struct.PAGE*** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.PAGE*** %5, metadata !459, metadata !DIExpression()), !dbg !460
  %6 = load i64, i64* %4, align 8, !dbg !461
  %7 = lshr i64 %6, 12, !dbg !461
  %8 = load i64, i64* %4, align 8, !dbg !461
  %9 = and i64 %8, 4095, !dbg !461
  %10 = icmp ne i64 %9, 0, !dbg !461
  %11 = zext i1 %10 to i64, !dbg !461
  %12 = select i1 %10, i32 1, i32 0, !dbg !461
  %13 = sext i32 %12 to i64, !dbg !461
  %14 = add i64 %7, %13, !dbg !461
  %15 = call i8* @AllocateAlignedPages(i64 noundef %14, i64 noundef 4096) #3, !dbg !461
  %16 = bitcast i8* %15 to %struct.PAGE*, !dbg !461
  %17 = load %struct.PAGE**, %struct.PAGE*** %5, align 8, !dbg !461
  store %struct.PAGE* %16, %struct.PAGE** %17, align 8, !dbg !461
  %18 = load %struct.PAGE**, %struct.PAGE*** %5, align 8, !dbg !462
  %19 = load %struct.PAGE*, %struct.PAGE** %18, align 8, !dbg !462
  %20 = icmp eq %struct.PAGE* %19, null, !dbg !462
  br i1 %20, label %21, label %34, !dbg !462

21:                                               ; preds = %2
  br label %22, !dbg !463

22:                                               ; preds = %21
  %23 = call i8 @DebugPrintEnabled() #3, !dbg !466
  %24 = icmp ne i8 %23, 0, !dbg !466
  br i1 %24, label %25, label %32, !dbg !466

25:                                               ; preds = %22
  br label %26, !dbg !468

26:                                               ; preds = %25
  %27 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !471
  %28 = icmp ne i8 %27, 0, !dbg !471
  br i1 %28, label %29, label %30, !dbg !471

29:                                               ; preds = %26
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.15, i64 0, i64 0)) #3, !dbg !473
  br label %30, !dbg !473

30:                                               ; preds = %29, %26
  br label %31, !dbg !471

31:                                               ; preds = %30
  br label %32, !dbg !468

32:                                               ; preds = %31, %22
  br label %33, !dbg !466

33:                                               ; preds = %32
  store i64 -9223372036854775787, i64* %3, align 8, !dbg !476
  br label %35, !dbg !476

34:                                               ; preds = %2
  store i64 0, i64* %3, align 8, !dbg !477
  br label %35, !dbg !477

35:                                               ; preds = %34, %33
  %36 = load i64, i64* %3, align 8, !dbg !478
  ret i64 %36, !dbg !478
}

; Function Attrs: noimplicitfloat noredzone
declare dso_local i8* @AllocateAlignedPages(i64 noundef, i64 noundef) #2

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @InitializeHeapMetadata() #0 !dbg !479 {
  %1 = alloca i64, align 8
  br label %2, !dbg !480

2:                                                ; preds = %0
  %3 = call i8 @DebugPrintEnabled() #3, !dbg !481
  %4 = icmp ne i8 %3, 0, !dbg !481
  br i1 %4, label %5, label %12, !dbg !481

5:                                                ; preds = %2
  br label %6, !dbg !483

6:                                                ; preds = %5
  %7 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !486
  %8 = icmp ne i8 %7, 0, !dbg !486
  br i1 %8, label %9, label %10, !dbg !486

9:                                                ; preds = %6
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.16, i64 0, i64 0)) #3, !dbg !488
  br label %10, !dbg !488

10:                                               ; preds = %9, %6
  br label %11, !dbg !486

11:                                               ; preds = %10
  br label %12, !dbg !483

12:                                               ; preds = %11, %2
  br label %13, !dbg !481

13:                                               ; preds = %12
  store i64 29, i64* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 1), align 8, !dbg !491
  call void @llvm.dbg.declare(metadata i64* %1, metadata !492, metadata !DIExpression()), !dbg !494
  store i64 0, i64* %1, align 8, !dbg !494
  br label %14, !dbg !494

14:                                               ; preds = %27, %13
  %15 = load i64, i64* %1, align 8, !dbg !494
  %16 = icmp ult i64 %15, 30, !dbg !494
  br i1 %16, label %17, label %30, !dbg !494

17:                                               ; preds = %14
  %18 = load i64, i64* %1, align 8, !dbg !495
  %19 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %18, !dbg !495
  %20 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %19, i32 0, i32 0, !dbg !495
  store %struct.CHUNK* null, %struct.CHUNK** %20, align 8, !dbg !495
  %21 = load i64, i64* %1, align 8, !dbg !498
  %22 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %21, !dbg !498
  %23 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %22, i32 0, i32 1, !dbg !498
  store i64 0, i64* %23, align 8, !dbg !498
  %24 = load i64, i64* %1, align 8, !dbg !499
  %25 = getelementptr inbounds [30 x %struct.Handle_Entry_T], [30 x %struct.Handle_Entry_T]* getelementptr inbounds (%struct.HEAP_METADATA_T, %struct.HEAP_METADATA_T* @HeapMd, i32 0, i32 0), i64 0, i64 %24, !dbg !499
  %26 = getelementptr inbounds %struct.Handle_Entry_T, %struct.Handle_Entry_T* %25, i32 0, i32 2, !dbg !499
  store i64 0, i64* %26, align 8, !dbg !499
  br label %27, !dbg !500

27:                                               ; preds = %17
  %28 = load i64, i64* %1, align 8, !dbg !501
  %29 = add i64 %28, 1, !dbg !501
  store i64 %29, i64* %1, align 8, !dbg !501
  br label %14, !dbg !501, !llvm.loop !502

30:                                               ; preds = %14
  ret i64 0, !dbg !504
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @InitializeHeap() #0 !dbg !505 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.CHUNK*, align 8
  %5 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i64* %2, metadata !506, metadata !DIExpression()), !dbg !507
  store i64 0, i64* %2, align 8, !dbg !507
  br label %6, !dbg !508

6:                                                ; preds = %0
  %7 = call i8 @DebugPrintEnabled() #3, !dbg !509
  %8 = icmp ne i8 %7, 0, !dbg !509
  br i1 %8, label %9, label %16, !dbg !509

9:                                                ; preds = %6
  br label %10, !dbg !511

10:                                               ; preds = %9
  %11 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !514
  %12 = icmp ne i8 %11, 0, !dbg !514
  br i1 %12, label %13, label %14, !dbg !514

13:                                               ; preds = %10
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.17, i64 0, i64 0)) #3, !dbg !516
  br label %14, !dbg !516

14:                                               ; preds = %13, %10
  br label %15, !dbg !514

15:                                               ; preds = %14
  br label %16, !dbg !511

16:                                               ; preds = %15, %6
  br label %17, !dbg !509

17:                                               ; preds = %16
  call void @llvm.dbg.declare(metadata i32* %3, metadata !519, metadata !DIExpression()), !dbg !521
  store i32 0, i32* %3, align 4, !dbg !521
  br label %18, !dbg !521

18:                                               ; preds = %69, %17
  %19 = load i32, i32* %3, align 4, !dbg !521
  %20 = icmp slt i32 %19, 3, !dbg !521
  br i1 %20, label %21, label %72, !dbg !521

21:                                               ; preds = %18
  %22 = load i32, i32* %3, align 4, !dbg !522
  %23 = sext i32 %22 to i64, !dbg !522
  %24 = getelementptr inbounds [3 x i64], [3 x i64]* @BlockSizes, i64 0, i64 %23, !dbg !522
  %25 = load i64, i64* %24, align 8, !dbg !522
  %26 = mul i64 10, %25, !dbg !522
  %27 = load i32, i32* %3, align 4, !dbg !522
  %28 = sext i32 %27 to i64, !dbg !522
  %29 = getelementptr inbounds [3 x %struct.PAGE*], [3 x %struct.PAGE*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 0), i64 0, i64 %28, !dbg !522
  %30 = call i64 @InitializePage(i64 noundef %26, %struct.PAGE** noundef %29) #3, !dbg !522
  store i64 %30, i64* %2, align 8, !dbg !522
  %31 = load i64, i64* %2, align 8, !dbg !525
  %32 = icmp slt i64 %31, 0, !dbg !525
  br i1 %32, label %33, label %35, !dbg !525

33:                                               ; preds = %21
  %34 = load i64, i64* %2, align 8, !dbg !526
  store i64 %34, i64* %1, align 8, !dbg !526
  br label %74, !dbg !526

35:                                               ; preds = %21
  %36 = load i32, i32* %3, align 4, !dbg !529
  %37 = sext i32 %36 to i64, !dbg !529
  %38 = getelementptr inbounds [3 x %struct.PAGE*], [3 x %struct.PAGE*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 0), i64 0, i64 %37, !dbg !529
  %39 = load %struct.PAGE*, %struct.PAGE** %38, align 8, !dbg !529
  %40 = bitcast %struct.PAGE* %39 to %struct.CHUNK*, !dbg !529
  %41 = load i32, i32* %3, align 4, !dbg !529
  %42 = sext i32 %41 to i64, !dbg !529
  %43 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %42, !dbg !529
  store %struct.CHUNK* %40, %struct.CHUNK** %43, align 8, !dbg !529
  call void @llvm.dbg.declare(metadata %struct.CHUNK** %4, metadata !530, metadata !DIExpression()), !dbg !531
  %44 = load i32, i32* %3, align 4, !dbg !531
  %45 = sext i32 %44 to i64, !dbg !531
  %46 = getelementptr inbounds [10 x %struct.CHUNK*], [10 x %struct.CHUNK*]* getelementptr inbounds (%struct.HEAP, %struct.HEAP* @Heap, i32 0, i32 1), i64 0, i64 %45, !dbg !531
  %47 = load %struct.CHUNK*, %struct.CHUNK** %46, align 8, !dbg !531
  store %struct.CHUNK* %47, %struct.CHUNK** %4, align 8, !dbg !531
  call void @llvm.dbg.declare(metadata i32* %5, metadata !532, metadata !DIExpression()), !dbg !534
  store i32 0, i32* %5, align 4, !dbg !534
  br label %48, !dbg !534

48:                                               ; preds = %65, %35
  %49 = load i32, i32* %5, align 4, !dbg !534
  %50 = icmp slt i32 %49, 9, !dbg !534
  br i1 %50, label %51, label %68, !dbg !534

51:                                               ; preds = %48
  %52 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !535
  %53 = bitcast %struct.CHUNK* %52 to i8*, !dbg !535
  %54 = load i32, i32* %3, align 4, !dbg !535
  %55 = sext i32 %54 to i64, !dbg !535
  %56 = getelementptr inbounds [3 x i64], [3 x i64]* @BlockSizes, i64 0, i64 %55, !dbg !535
  %57 = load i64, i64* %56, align 8, !dbg !535
  %58 = getelementptr inbounds i8, i8* %53, i64 %57, !dbg !535
  %59 = bitcast i8* %58 to %struct.CHUNK*, !dbg !535
  %60 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !535
  %61 = getelementptr inbounds %struct.CHUNK, %struct.CHUNK* %60, i32 0, i32 0, !dbg !535
  store %struct.CHUNK* %59, %struct.CHUNK** %61, align 8, !dbg !535
  %62 = load %struct.CHUNK*, %struct.CHUNK** %4, align 8, !dbg !538
  %63 = getelementptr inbounds %struct.CHUNK, %struct.CHUNK* %62, i32 0, i32 0, !dbg !538
  %64 = load %struct.CHUNK*, %struct.CHUNK** %63, align 8, !dbg !538
  store %struct.CHUNK* %64, %struct.CHUNK** %4, align 8, !dbg !538
  br label %65, !dbg !539

65:                                               ; preds = %51
  %66 = load i32, i32* %5, align 4, !dbg !540
  %67 = add nsw i32 %66, 1, !dbg !540
  store i32 %67, i32* %5, align 4, !dbg !540
  br label %48, !dbg !540, !llvm.loop !541

68:                                               ; preds = %48
  br label %69, !dbg !543

69:                                               ; preds = %68
  %70 = load i32, i32* %3, align 4, !dbg !544
  %71 = add nsw i32 %70, 1, !dbg !544
  store i32 %71, i32* %3, align 4, !dbg !544
  br label %18, !dbg !544, !llvm.loop !545

72:                                               ; preds = %18
  %73 = load i64, i64* %2, align 8, !dbg !547
  store i64 %73, i64* %1, align 8, !dbg !547
  br label %74, !dbg !547

74:                                               ; preds = %72, %33
  %75 = load i64, i64* %1, align 8, !dbg !548
  ret i64 %75, !dbg !548
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @HeapManagerEntryPoint(i8* noundef %0, %struct.EFI_SYSTEM_TABLE* noundef %1) #0 !dbg !549 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.EFI_SYSTEM_TABLE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca %struct._HEAP_MANAGER_PROTOCOL*, align 8
  %10 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !1056, metadata !DIExpression()), !dbg !1057
  store %struct.EFI_SYSTEM_TABLE* %1, %struct.EFI_SYSTEM_TABLE** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.EFI_SYSTEM_TABLE** %5, metadata !1058, metadata !DIExpression()), !dbg !1059
  call void @llvm.dbg.declare(metadata i64* %6, metadata !1060, metadata !DIExpression()), !dbg !1061
  call void @llvm.dbg.declare(metadata i8** %7, metadata !1062, metadata !DIExpression()), !dbg !1063
  store i8* null, i8** %7, align 8, !dbg !1063
  call void @llvm.dbg.declare(metadata i8** %8, metadata !1064, metadata !DIExpression()), !dbg !1065
  store i8* null, i8** %8, align 8, !dbg !1065
  call void @llvm.dbg.declare(metadata %struct._HEAP_MANAGER_PROTOCOL** %9, metadata !1066, metadata !DIExpression()), !dbg !1096
  call void @llvm.dbg.declare(metadata i64* %10, metadata !1097, metadata !DIExpression()), !dbg !1098
  store i64 72, i64* %10, align 8, !dbg !1098
  %11 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !1099
  %12 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %11, i32 0, i32 5, !dbg !1099
  %13 = load i64 (i32, i64, i8**)*, i64 (i32, i64, i8**)** %12, align 8, !dbg !1099
  %14 = load i64, i64* %10, align 8, !dbg !1099
  %15 = bitcast %struct._HEAP_MANAGER_PROTOCOL** %9 to i8**, !dbg !1099
  %16 = call i64 %13(i32 noundef 6, i64 noundef %14, i8** noundef %15) #3, !dbg !1099
  store i64 %16, i64* %6, align 8, !dbg !1099
  %17 = load i64, i64* %6, align 8, !dbg !1100
  %18 = icmp slt i64 %17, 0, !dbg !1100
  br i1 %18, label %19, label %21, !dbg !1100

19:                                               ; preds = %2
  %20 = load i64, i64* %6, align 8, !dbg !1101
  store i64 %20, i64* %3, align 8, !dbg !1101
  br label %61, !dbg !1101

21:                                               ; preds = %2
  %22 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !1104
  %23 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %22, i32 0, i32 0, !dbg !1104
  store i64 (i64, i64*)* @GetBlockSize, i64 (i64, i64*)** %23, align 8, !dbg !1104
  %24 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !1105
  %25 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %24, i32 0, i32 1, !dbg !1105
  store i64 (i64, %struct.CHUNK**)* @AllocateChunk, i64 (i64, %struct.CHUNK**)** %25, align 8, !dbg !1105
  %26 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !1106
  %27 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %26, i32 0, i32 2, !dbg !1106
  store i64 (i64)* @FreeChunk, i64 (i64)** %27, align 8, !dbg !1106
  %28 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !1107
  %29 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %28, i32 0, i32 3, !dbg !1107
  store i64 (...)* bitcast (i64 ()* @FreeAllocList to i64 (...)*), i64 (...)** %29, align 8, !dbg !1107
  %30 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !1108
  %31 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %30, i32 0, i32 4, !dbg !1108
  store i64 (...)* bitcast (i64 (i64)* @DisplayFreeList to i64 (...)*), i64 (...)** %31, align 8, !dbg !1108
  %32 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !1109
  %33 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %32, i32 0, i32 5, !dbg !1109
  store i64 (...)* bitcast (i64 ()* @DisplayHeapMetadata to i64 (...)*), i64 (...)** %33, align 8, !dbg !1109
  %34 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !1110
  %35 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %34, i32 0, i32 6, !dbg !1110
  store i64 (i64, %struct.PAGE**)* @InitializePage, i64 (i64, %struct.PAGE**)** %35, align 8, !dbg !1110
  %36 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !1111
  %37 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %36, i32 0, i32 7, !dbg !1111
  store i64 (...)* bitcast (i64 ()* @InitializeHeapMetadata to i64 (...)*), i64 (...)** %37, align 8, !dbg !1111
  %38 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !1112
  %39 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %38, i32 0, i32 8, !dbg !1112
  store i64 (...)* bitcast (i64 ()* @InitializeHeap to i64 (...)*), i64 (...)** %39, align 8, !dbg !1112
  %40 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !1113
  %41 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %40, i32 0, i32 16, !dbg !1113
  %42 = load i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8**, %struct.GUID*, i32, i8*)** %41, align 8, !dbg !1113
  %43 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** %9, align 8, !dbg !1113
  %44 = bitcast %struct._HEAP_MANAGER_PROTOCOL* %43 to i8*, !dbg !1113
  %45 = call i64 %42(i8** noundef %7, %struct.GUID* noundef @gEfiHeapManagerProtocolGuid, i32 noundef 0, i8* noundef %44) #3, !dbg !1113
  store i64 %45, i64* %6, align 8, !dbg !1113
  %46 = load i64, i64* %6, align 8, !dbg !1114
  %47 = icmp slt i64 %46, 0, !dbg !1114
  br i1 %47, label %48, label %50, !dbg !1114

48:                                               ; preds = %21
  %49 = load i64, i64* %6, align 8, !dbg !1115
  store i64 %49, i64* %3, align 8, !dbg !1115
  br label %61, !dbg !1115

50:                                               ; preds = %21
  store i32 -1, i32* getelementptr inbounds (%struct._NOTIFY_PROTOCOL_READY_PROTOCOL, %struct._NOTIFY_PROTOCOL_READY_PROTOCOL* @mHeapManagerReady, i32 0, i32 0), align 4, !dbg !1118
  %51 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !1119
  %52 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %51, i32 0, i32 16, !dbg !1119
  %53 = load i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8**, %struct.GUID*, i32, i8*)** %52, align 8, !dbg !1119
  %54 = call i64 %53(i8** noundef %8, %struct.GUID* noundef @gEfiHeapManagerReadyProtocolGuid, i32 noundef 0, i8* noundef bitcast (%struct._NOTIFY_PROTOCOL_READY_PROTOCOL* @mHeapManagerReady to i8*)) #3, !dbg !1119
  store i64 %54, i64* %6, align 8, !dbg !1119
  %55 = load i64, i64* %6, align 8, !dbg !1120
  %56 = icmp slt i64 %55, 0, !dbg !1120
  br i1 %56, label %57, label %59, !dbg !1120

57:                                               ; preds = %50
  %58 = load i64, i64* %6, align 8, !dbg !1121
  store i64 %58, i64* %3, align 8, !dbg !1121
  br label %61, !dbg !1121

59:                                               ; preds = %50
  %60 = load i64, i64* %6, align 8, !dbg !1124
  store i64 %60, i64* %3, align 8, !dbg !1124
  br label %61, !dbg !1124

61:                                               ; preds = %59, %57, %48, %19
  %62 = load i64, i64* %3, align 8, !dbg !1125
  ret i64 %62, !dbg !1125
}

attributes #0 = { noimplicitfloat noinline noredzone nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-stack-arg-probe" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noimplicitfloat noredzone "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin noimplicitfloat noredzone "no-builtins" "trap-func-name"="undefined_behavior_has_been_optimized_away_by_clang" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!130, !131, !132, !133, !134, !135, !136, !137}
!llvm.ident = !{!138}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "BlockSizes", scope: !2, file: !94, line: 7, type: !129, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !52, globals: !80, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases/Testcases/Sample2Tests/HeapManager/HeapManager.c", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases/Build/OvmfX64/NOOPT_CLANGPDB/X64/Testcases/Sample2Tests/HeapManager/HeapManager", checksumkind: CSK_MD5, checksum: "6c926d8fe363f8895e792556b2d0d8e9")
!4 = !{!5, !13, !20, !39, !44, !47}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 117, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "MdePkg/Include/Uefi/UefiMultiPhase.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "321376346bf760b12510b9ae9d8f46f8")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "EfiResetCold", value: 0)
!10 = !DIEnumerator(name: "EfiResetWarm", value: 1)
!11 = !DIEnumerator(name: "EfiResetShutdown", value: 2)
!12 = !DIEnumerator(name: "EfiResetPlatformSpecific", value: 3)
!13 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !14, line: 29, baseType: !7, size: 32, elements: !15)
!14 = !DIFile(filename: "MdePkg/Include/Uefi/UefiSpec.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "6689a006b5315b366a9c472eecb4d5b8")
!15 = !{!16, !17, !18, !19}
!16 = !DIEnumerator(name: "AllocateAnyPages", value: 0)
!17 = !DIEnumerator(name: "AllocateMaxAddress", value: 1)
!18 = !DIEnumerator(name: "AllocateAddress", value: 2)
!19 = !DIEnumerator(name: "MaxAllocateType", value: 3)
!20 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 38, baseType: !7, size: 32, elements: !21)
!21 = !{!22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38}
!22 = !DIEnumerator(name: "EfiReservedMemoryType", value: 0)
!23 = !DIEnumerator(name: "EfiLoaderCode", value: 1)
!24 = !DIEnumerator(name: "EfiLoaderData", value: 2)
!25 = !DIEnumerator(name: "EfiBootServicesCode", value: 3)
!26 = !DIEnumerator(name: "EfiBootServicesData", value: 4)
!27 = !DIEnumerator(name: "EfiRuntimeServicesCode", value: 5)
!28 = !DIEnumerator(name: "EfiRuntimeServicesData", value: 6)
!29 = !DIEnumerator(name: "EfiConventionalMemory", value: 7)
!30 = !DIEnumerator(name: "EfiUnusableMemory", value: 8)
!31 = !DIEnumerator(name: "EfiACPIReclaimMemory", value: 9)
!32 = !DIEnumerator(name: "EfiACPIMemoryNVS", value: 10)
!33 = !DIEnumerator(name: "EfiMemoryMappedIO", value: 11)
!34 = !DIEnumerator(name: "EfiMemoryMappedIOPortSpace", value: 12)
!35 = !DIEnumerator(name: "EfiPalCode", value: 13)
!36 = !DIEnumerator(name: "EfiPersistentMemory", value: 14)
!37 = !DIEnumerator(name: "EfiUnacceptedMemoryType", value: 15)
!38 = !DIEnumerator(name: "EfiMaxMemoryType", value: 16)
!39 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !14, line: 521, baseType: !7, size: 32, elements: !40)
!40 = !{!41, !42, !43}
!41 = !DIEnumerator(name: "TimerCancel", value: 0)
!42 = !DIEnumerator(name: "TimerPeriodic", value: 1)
!43 = !DIEnumerator(name: "TimerRelative", value: 2)
!44 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !14, line: 1159, baseType: !7, size: 32, elements: !45)
!45 = !{!46}
!46 = !DIEnumerator(name: "EFI_NATIVE_INTERFACE", value: 0)
!47 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !14, line: 1475, baseType: !7, size: 32, elements: !48)
!48 = !{!49, !50, !51}
!49 = !DIEnumerator(name: "AllHandles", value: 0)
!50 = !DIEnumerator(name: "ByRegisterNotify", value: 1)
!51 = !DIEnumerator(name: "ByProtocol", value: 2)
!52 = !{!53, !59, !61, !64, !71, !76, !77, !79}
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "RETURN_STATUS", file: !54, line: 1026, baseType: !55)
!54 = !DIFile(filename: "MdePkg/Include/Base.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "3996263373664be5782f777b907656f6")
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINTN", file: !56, line: 211, baseType: !57)
!56 = !DIFile(filename: "MdePkg/Include/X64/ProcessorBind.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "ef2524a221fe61206fa09ec88dd4f59b")
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT64", file: !56, line: 162, baseType: !58)
!58 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "BOOLEAN", file: !56, line: 192, baseType: !60)
!60 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "INTN", file: !56, line: 216, baseType: !62)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "INT64", file: !56, line: 166, baseType: !63)
!63 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHUNK_T", file: !66, line: 34, baseType: !67)
!66 = !DIFile(filename: "Testcases/Sample2Tests/HeapManager/HeapManager.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "e714afc4efaaf897241f252dc062e7a1")
!67 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CHUNK", file: !66, line: 32, size: 64, elements: !68)
!68 = !{!69}
!69 = !DIDerivedType(tag: DW_TAG_member, name: "Next", scope: !67, file: !66, line: 33, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "PAGE_T", file: !66, line: 38, baseType: !73)
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "PAGE", file: !66, line: 36, size: 64, elements: !74)
!74 = !{!75}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "Self", scope: !73, file: !66, line: 37, baseType: !64, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT8", file: !56, line: 196, baseType: !60)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!80 = !{!0, !81, !84, !86, !88, !90, !92, !100, !113}
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression(DW_OP_constu, 0, DW_OP_stack_value))
!82 = distinct !DIGlobalVariable(name: "B_080", scope: !2, file: !66, line: 27, type: !83, isLocal: true, isDefinition: true)
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIGlobalVariableExpression(var: !85, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!85 = distinct !DIGlobalVariable(name: "B_100", scope: !2, file: !66, line: 28, type: !83, isLocal: true, isDefinition: true)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!87 = distinct !DIGlobalVariable(name: "B_200", scope: !2, file: !66, line: 29, type: !83, isLocal: true, isDefinition: true)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression(DW_OP_constu, 6, DW_OP_stack_value))
!89 = distinct !DIGlobalVariable(name: "EfiRuntimeServicesData", scope: !2, file: !6, line: 70, type: !83, isLocal: true, isDefinition: true)
!90 = !DIGlobalVariableExpression(var: !91, expr: !DIExpression(DW_OP_constu, 0, DW_OP_stack_value))
!91 = distinct !DIGlobalVariable(name: "EFI_NATIVE_INTERFACE", scope: !2, file: !14, line: 1163, type: !83, isLocal: true, isDefinition: true)
!92 = !DIGlobalVariableExpression(var: !93, expr: !DIExpression())
!93 = distinct !DIGlobalVariable(name: "mHeapManagerReady", scope: !2, file: !94, line: 3, type: !95, isLocal: false, isDefinition: true)
!94 = !DIFile(filename: "Testcases/Sample2Tests/HeapManager/HeapManager.c", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "6c926d8fe363f8895e792556b2d0d8e9")
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "NOTIFY_PROTOCOL_READY_PROTOCOL", file: !66, line: 122, baseType: !96)
!96 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_NOTIFY_PROTOCOL_READY_PROTOCOL", file: !66, line: 120, size: 32, elements: !97)
!97 = !{!98}
!98 = !DIDerivedType(tag: DW_TAG_member, name: "ReadyFlags", scope: !96, file: !66, line: 121, baseType: !99, size: 32)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT32", file: !56, line: 170, baseType: !7)
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(name: "Heap", scope: !2, file: !94, line: 5, type: !102, isLocal: false, isDefinition: true)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_T", file: !66, line: 55, baseType: !103)
!103 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "HEAP", file: !66, line: 52, size: 832, elements: !104)
!104 = !{!105, !109}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "Pages", scope: !103, file: !66, line: 53, baseType: !106, size: 192)
!106 = !DICompositeType(tag: DW_TAG_array_type, baseType: !71, size: 192, elements: !107)
!107 = !{!108}
!108 = !DISubrange(count: 3)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "FreeList", scope: !103, file: !66, line: 54, baseType: !110, size: 640, offset: 192)
!110 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, size: 640, elements: !111)
!111 = !{!112}
!112 = !DISubrange(count: 10)
!113 = !DIGlobalVariableExpression(var: !114, expr: !DIExpression())
!114 = distinct !DIGlobalVariable(name: "HeapMd", scope: !2, file: !94, line: 6, type: !115, isLocal: false, isDefinition: true)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_METADATA_T", file: !66, line: 49, baseType: !116)
!116 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "HEAP_METADATA_T", file: !66, line: 46, size: 5824, elements: !117)
!117 = !{!118, !128}
!118 = !DIDerivedType(tag: DW_TAG_member, name: "HandleTable", scope: !116, file: !66, line: 47, baseType: !119, size: 5760)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !120, size: 5760, elements: !126)
!120 = !DIDerivedType(tag: DW_TAG_typedef, name: "Handle_Entry_T", file: !66, line: 44, baseType: !121)
!121 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Handle_Entry_T", file: !66, line: 40, size: 192, elements: !122)
!122 = !{!123, !124, !125}
!123 = !DIDerivedType(tag: DW_TAG_member, name: "ChunkPtr", scope: !121, file: !66, line: 41, baseType: !64, size: 64)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "ChunkSize", scope: !121, file: !66, line: 42, baseType: !55, size: 64, offset: 64)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "InUse", scope: !121, file: !66, line: 43, baseType: !61, size: 64, offset: 128)
!126 = !{!127}
!127 = !DISubrange(count: 30)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "FreeHandleTop", scope: !116, file: !66, line: 48, baseType: !61, size: 64, offset: 5760)
!129 = !DICompositeType(tag: DW_TAG_array_type, baseType: !55, size: 192, elements: !107)
!130 = !{i32 2, !"CodeView", i32 1}
!131 = !{i32 2, !"Debug Info Version", i32 3}
!132 = !{i32 1, !"wchar_size", i32 2}
!133 = !{i32 7, !"PIC Level", i32 2}
!134 = !{i32 1, !"Code Model", i32 1}
!135 = !{i32 7, !"uwtable", i32 1}
!136 = !{i32 1, !"ThinLTO", i32 0}
!137 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!138 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!139 = distinct !DISubprogram(name: "GetBlockSize", scope: !94, file: !94, line: 12, type: !140, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !145)
!140 = !DISubroutineType(types: !141)
!141 = !{!142, !55, !144}
!142 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_STATUS", file: !143, line: 29, baseType: !53)
!143 = !DIFile(filename: "MdePkg/Include/Uefi/UefiBaseType.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "652b6036ee3f46705189b44807c85960")
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!145 = !{}
!146 = !DILocalVariable(name: "Size", arg: 1, scope: !139, file: !94, line: 13, type: !55)
!147 = !DILocation(line: 13, scope: !139)
!148 = !DILocalVariable(name: "BlockSize", arg: 2, scope: !139, file: !94, line: 14, type: !144)
!149 = !DILocation(line: 14, scope: !139)
!150 = !DILocation(line: 17, scope: !139)
!151 = !DILocation(line: 18, scope: !152)
!152 = distinct !DILexicalBlock(scope: !139, file: !94, line: 17)
!153 = !DILocation(line: 19, scope: !139)
!154 = !DILocation(line: 20, scope: !155)
!155 = distinct !DILexicalBlock(scope: !139, file: !94, line: 19)
!156 = !DILocation(line: 21, scope: !139)
!157 = !DILocation(line: 22, scope: !158)
!158 = distinct !DILexicalBlock(scope: !139, file: !94, line: 21)
!159 = !DILocation(line: 24, scope: !158)
!160 = !DILocation(line: 25, scope: !139)
!161 = distinct !DISubprogram(name: "AllocateChunk", scope: !94, file: !94, line: 31, type: !162, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !145)
!162 = !DISubroutineType(types: !163)
!163 = !{!142, !55, !164}
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!165 = !DILocalVariable(name: "ChunkSize", arg: 1, scope: !161, file: !94, line: 32, type: !55)
!166 = !DILocation(line: 32, scope: !161)
!167 = !DILocalVariable(name: "AllocatedChunk", arg: 2, scope: !161, file: !94, line: 33, type: !164)
!168 = !DILocation(line: 33, scope: !161)
!169 = !DILocation(line: 36, scope: !161)
!170 = !DILocation(line: 37, scope: !171)
!171 = distinct !DILexicalBlock(scope: !172, file: !94, line: 36)
!172 = distinct !DILexicalBlock(scope: !161, file: !94, line: 36)
!173 = !DILocation(line: 39, scope: !161)
!174 = !DILocation(line: 40, scope: !175)
!175 = distinct !DILexicalBlock(scope: !176, file: !94, line: 39)
!176 = distinct !DILexicalBlock(scope: !161, file: !94, line: 39)
!177 = !DILocation(line: 40, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !94, line: 40)
!179 = !DILocation(line: 40, scope: !180)
!180 = distinct !DILexicalBlock(scope: !181, file: !94, line: 40)
!181 = distinct !DILexicalBlock(scope: !178, file: !94, line: 40)
!182 = !DILocation(line: 40, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !94, line: 40)
!184 = !DILocation(line: 40, scope: !185)
!185 = distinct !DILexicalBlock(scope: !186, file: !94, line: 40)
!186 = distinct !DILexicalBlock(scope: !183, file: !94, line: 40)
!187 = !DILocation(line: 41, scope: !175)
!188 = !DILocation(line: 44, scope: !161)
!189 = !DILocation(line: 45, scope: !190)
!190 = distinct !DILexicalBlock(scope: !191, file: !94, line: 44)
!191 = distinct !DILexicalBlock(scope: !161, file: !94, line: 44)
!192 = !DILocation(line: 46, scope: !190)
!193 = !DILocation(line: 46, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !94, line: 46)
!195 = !DILocation(line: 46, scope: !196)
!196 = distinct !DILexicalBlock(scope: !197, file: !94, line: 46)
!197 = distinct !DILexicalBlock(scope: !194, file: !94, line: 46)
!198 = !DILocation(line: 46, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !94, line: 46)
!200 = !DILocation(line: 46, scope: !201)
!201 = distinct !DILexicalBlock(scope: !202, file: !94, line: 46)
!202 = distinct !DILexicalBlock(scope: !199, file: !94, line: 46)
!203 = !DILocation(line: 47, scope: !190)
!204 = !DILocation(line: 50, scope: !161)
!205 = !DILocation(line: 51, scope: !161)
!206 = !DILocalVariable(name: "Handle", scope: !161, file: !94, line: 52, type: !61)
!207 = !DILocation(line: 52, scope: !161)
!208 = !DILocation(line: 53, scope: !161)
!209 = !DILocation(line: 54, scope: !161)
!210 = !DILocation(line: 55, scope: !161)
!211 = !DILocation(line: 57, scope: !161)
!212 = !DILocation(line: 58, scope: !161)
!213 = distinct !DISubprogram(name: "FreeChunk", scope: !94, file: !94, line: 62, type: !214, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !145)
!214 = !DISubroutineType(types: !215)
!215 = !{!142, !61}
!216 = !DILocalVariable(name: "Handle", arg: 1, scope: !213, file: !94, line: 63, type: !61)
!217 = !DILocation(line: 63, scope: !213)
!218 = !DILocation(line: 66, scope: !213)
!219 = !DILocation(line: 67, scope: !220)
!220 = distinct !DILexicalBlock(scope: !221, file: !94, line: 66)
!221 = distinct !DILexicalBlock(scope: !213, file: !94, line: 66)
!222 = !DILocation(line: 67, scope: !223)
!223 = distinct !DILexicalBlock(scope: !220, file: !94, line: 67)
!224 = !DILocation(line: 67, scope: !225)
!225 = distinct !DILexicalBlock(scope: !226, file: !94, line: 67)
!226 = distinct !DILexicalBlock(scope: !223, file: !94, line: 67)
!227 = !DILocation(line: 67, scope: !228)
!228 = distinct !DILexicalBlock(scope: !225, file: !94, line: 67)
!229 = !DILocation(line: 67, scope: !230)
!230 = distinct !DILexicalBlock(scope: !231, file: !94, line: 67)
!231 = distinct !DILexicalBlock(scope: !228, file: !94, line: 67)
!232 = !DILocation(line: 68, scope: !220)
!233 = !DILocalVariable(name: "Chunk", scope: !213, file: !94, line: 71, type: !64)
!234 = !DILocation(line: 71, scope: !213)
!235 = !DILocalVariable(name: "ChunkSize", scope: !213, file: !94, line: 72, type: !55)
!236 = !DILocation(line: 72, scope: !213)
!237 = !DILocation(line: 74, scope: !213)
!238 = !DILocation(line: 75, scope: !213)
!239 = !DILocation(line: 77, scope: !213)
!240 = !DILocation(line: 78, scope: !213)
!241 = !DILocation(line: 79, scope: !213)
!242 = !DILocation(line: 79, scope: !243)
!243 = distinct !DILexicalBlock(scope: !213, file: !94, line: 79)
!244 = !DILocation(line: 79, scope: !245)
!245 = distinct !DILexicalBlock(scope: !246, file: !94, line: 79)
!246 = distinct !DILexicalBlock(scope: !243, file: !94, line: 79)
!247 = !DILocation(line: 79, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !94, line: 79)
!249 = !DILocation(line: 79, scope: !250)
!250 = distinct !DILexicalBlock(scope: !251, file: !94, line: 79)
!251 = distinct !DILexicalBlock(scope: !248, file: !94, line: 79)
!252 = !DILocation(line: 80, scope: !213)
!253 = !DILocation(line: 81, scope: !213)
!254 = distinct !DISubprogram(name: "FreeAllocList", scope: !94, file: !94, line: 85, type: !255, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !145)
!255 = !DISubroutineType(types: !256)
!256 = !{!142}
!257 = !DILocalVariable(name: "Status", scope: !254, file: !94, line: 87, type: !142)
!258 = !DILocation(line: 87, scope: !254)
!259 = !DILocalVariable(name: "i", scope: !260, file: !94, line: 89, type: !61)
!260 = distinct !DILexicalBlock(scope: !254, file: !94, line: 89)
!261 = !DILocation(line: 89, scope: !260)
!262 = !DILocation(line: 90, scope: !263)
!263 = distinct !DILexicalBlock(scope: !264, file: !94, line: 89)
!264 = distinct !DILexicalBlock(scope: !260, file: !94, line: 89)
!265 = !DILocation(line: 91, scope: !266)
!266 = distinct !DILexicalBlock(scope: !267, file: !94, line: 90)
!267 = distinct !DILexicalBlock(scope: !263, file: !94, line: 90)
!268 = !DILocation(line: 92, scope: !266)
!269 = !DILocation(line: 94, scope: !270)
!270 = distinct !DILexicalBlock(scope: !271, file: !94, line: 93)
!271 = distinct !DILexicalBlock(scope: !266, file: !94, line: 92)
!272 = !DILocation(line: 96, scope: !266)
!273 = !DILocation(line: 97, scope: !263)
!274 = !DILocation(line: 89, scope: !264)
!275 = distinct !{!275, !261, !276, !277}
!276 = !DILocation(line: 97, scope: !260)
!277 = !{!"llvm.loop.mustprogress"}
!278 = !DILocation(line: 98, scope: !254)
!279 = !DILocation(line: 99, scope: !254)
!280 = distinct !DISubprogram(name: "DisplayFreeList", scope: !94, file: !94, line: 103, type: !281, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !145)
!281 = !DISubroutineType(types: !282)
!282 = !{!142, !55}
!283 = !DILocalVariable(name: "ChunkSize", arg: 1, scope: !280, file: !94, line: 104, type: !55)
!284 = !DILocation(line: 104, scope: !280)
!285 = !DILocation(line: 107, scope: !280)
!286 = !DILocation(line: 108, scope: !287)
!287 = distinct !DILexicalBlock(scope: !288, file: !94, line: 107)
!288 = distinct !DILexicalBlock(scope: !280, file: !94, line: 107)
!289 = !DILocation(line: 108, scope: !290)
!290 = distinct !DILexicalBlock(scope: !287, file: !94, line: 108)
!291 = !DILocation(line: 108, scope: !292)
!292 = distinct !DILexicalBlock(scope: !293, file: !94, line: 108)
!293 = distinct !DILexicalBlock(scope: !290, file: !94, line: 108)
!294 = !DILocation(line: 108, scope: !295)
!295 = distinct !DILexicalBlock(scope: !292, file: !94, line: 108)
!296 = !DILocation(line: 108, scope: !297)
!297 = distinct !DILexicalBlock(scope: !298, file: !94, line: 108)
!298 = distinct !DILexicalBlock(scope: !295, file: !94, line: 108)
!299 = !DILocation(line: 109, scope: !287)
!300 = !DILocalVariable(name: "Current", scope: !280, file: !94, line: 112, type: !64)
!301 = !DILocation(line: 112, scope: !280)
!302 = !DILocation(line: 113, scope: !280)
!303 = !DILocation(line: 114, scope: !304)
!304 = distinct !DILexicalBlock(scope: !305, file: !94, line: 113)
!305 = distinct !DILexicalBlock(scope: !280, file: !94, line: 113)
!306 = !DILocation(line: 114, scope: !307)
!307 = distinct !DILexicalBlock(scope: !304, file: !94, line: 114)
!308 = !DILocation(line: 114, scope: !309)
!309 = distinct !DILexicalBlock(scope: !310, file: !94, line: 114)
!310 = distinct !DILexicalBlock(scope: !307, file: !94, line: 114)
!311 = !DILocation(line: 114, scope: !312)
!312 = distinct !DILexicalBlock(scope: !309, file: !94, line: 114)
!313 = !DILocation(line: 114, scope: !314)
!314 = distinct !DILexicalBlock(scope: !315, file: !94, line: 114)
!315 = distinct !DILexicalBlock(scope: !312, file: !94, line: 114)
!316 = !DILocation(line: 115, scope: !304)
!317 = !DILocation(line: 117, scope: !280)
!318 = !DILocation(line: 117, scope: !319)
!319 = distinct !DILexicalBlock(scope: !280, file: !94, line: 117)
!320 = !DILocation(line: 117, scope: !321)
!321 = distinct !DILexicalBlock(scope: !322, file: !94, line: 117)
!322 = distinct !DILexicalBlock(scope: !319, file: !94, line: 117)
!323 = !DILocation(line: 117, scope: !324)
!324 = distinct !DILexicalBlock(scope: !321, file: !94, line: 117)
!325 = !DILocation(line: 117, scope: !326)
!326 = distinct !DILexicalBlock(scope: !327, file: !94, line: 117)
!327 = distinct !DILexicalBlock(scope: !324, file: !94, line: 117)
!328 = !DILocation(line: 118, scope: !280)
!329 = !DILocation(line: 119, scope: !330)
!330 = distinct !DILexicalBlock(scope: !280, file: !94, line: 118)
!331 = !DILocation(line: 119, scope: !332)
!332 = distinct !DILexicalBlock(scope: !330, file: !94, line: 119)
!333 = !DILocation(line: 119, scope: !334)
!334 = distinct !DILexicalBlock(scope: !335, file: !94, line: 119)
!335 = distinct !DILexicalBlock(scope: !332, file: !94, line: 119)
!336 = !DILocation(line: 119, scope: !337)
!337 = distinct !DILexicalBlock(scope: !334, file: !94, line: 119)
!338 = !DILocation(line: 119, scope: !339)
!339 = distinct !DILexicalBlock(scope: !340, file: !94, line: 119)
!340 = distinct !DILexicalBlock(scope: !337, file: !94, line: 119)
!341 = !DILocation(line: 120, scope: !330)
!342 = distinct !{!342, !328, !343, !277}
!343 = !DILocation(line: 121, scope: !280)
!344 = !DILocation(line: 122, scope: !280)
!345 = !DILocation(line: 123, scope: !280)
!346 = distinct !DISubprogram(name: "DisplayHeapMetadata", scope: !94, file: !94, line: 127, type: !255, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !145)
!347 = !DILocation(line: 129, scope: !346)
!348 = !DILocation(line: 129, scope: !349)
!349 = distinct !DILexicalBlock(scope: !346, file: !94, line: 129)
!350 = !DILocation(line: 129, scope: !351)
!351 = distinct !DILexicalBlock(scope: !352, file: !94, line: 129)
!352 = distinct !DILexicalBlock(scope: !349, file: !94, line: 129)
!353 = !DILocation(line: 129, scope: !354)
!354 = distinct !DILexicalBlock(scope: !351, file: !94, line: 129)
!355 = !DILocation(line: 129, scope: !356)
!356 = distinct !DILexicalBlock(scope: !357, file: !94, line: 129)
!357 = distinct !DILexicalBlock(scope: !354, file: !94, line: 129)
!358 = !DILocation(line: 130, scope: !346)
!359 = !DILocation(line: 130, scope: !360)
!360 = distinct !DILexicalBlock(scope: !346, file: !94, line: 130)
!361 = !DILocation(line: 130, scope: !362)
!362 = distinct !DILexicalBlock(scope: !363, file: !94, line: 130)
!363 = distinct !DILexicalBlock(scope: !360, file: !94, line: 130)
!364 = !DILocation(line: 130, scope: !365)
!365 = distinct !DILexicalBlock(scope: !362, file: !94, line: 130)
!366 = !DILocation(line: 130, scope: !367)
!367 = distinct !DILexicalBlock(scope: !368, file: !94, line: 130)
!368 = distinct !DILexicalBlock(scope: !365, file: !94, line: 130)
!369 = !DILocation(line: 131, scope: !346)
!370 = !DILocation(line: 131, scope: !371)
!371 = distinct !DILexicalBlock(scope: !346, file: !94, line: 131)
!372 = !DILocation(line: 131, scope: !373)
!373 = distinct !DILexicalBlock(scope: !374, file: !94, line: 131)
!374 = distinct !DILexicalBlock(scope: !371, file: !94, line: 131)
!375 = !DILocation(line: 131, scope: !376)
!376 = distinct !DILexicalBlock(scope: !373, file: !94, line: 131)
!377 = !DILocation(line: 131, scope: !378)
!378 = distinct !DILexicalBlock(scope: !379, file: !94, line: 131)
!379 = distinct !DILexicalBlock(scope: !376, file: !94, line: 131)
!380 = !DILocalVariable(name: "i", scope: !381, file: !94, line: 132, type: !61)
!381 = distinct !DILexicalBlock(scope: !346, file: !94, line: 132)
!382 = !DILocation(line: 132, scope: !381)
!383 = !DILocation(line: 133, scope: !384)
!384 = distinct !DILexicalBlock(scope: !385, file: !94, line: 132)
!385 = distinct !DILexicalBlock(scope: !381, file: !94, line: 132)
!386 = !DILocation(line: 134, scope: !387)
!387 = distinct !DILexicalBlock(scope: !388, file: !94, line: 133)
!388 = distinct !DILexicalBlock(scope: !384, file: !94, line: 133)
!389 = !DILocation(line: 134, scope: !390)
!390 = distinct !DILexicalBlock(scope: !387, file: !94, line: 134)
!391 = !DILocation(line: 134, scope: !392)
!392 = distinct !DILexicalBlock(scope: !393, file: !94, line: 134)
!393 = distinct !DILexicalBlock(scope: !390, file: !94, line: 134)
!394 = !DILocation(line: 134, scope: !395)
!395 = distinct !DILexicalBlock(scope: !392, file: !94, line: 134)
!396 = !DILocation(line: 134, scope: !397)
!397 = distinct !DILexicalBlock(scope: !398, file: !94, line: 134)
!398 = distinct !DILexicalBlock(scope: !395, file: !94, line: 134)
!399 = !DILocation(line: 135, scope: !387)
!400 = !DILocation(line: 136, scope: !401)
!401 = distinct !DILexicalBlock(scope: !388, file: !94, line: 135)
!402 = !DILocation(line: 136, scope: !403)
!403 = distinct !DILexicalBlock(scope: !401, file: !94, line: 136)
!404 = !DILocation(line: 136, scope: !405)
!405 = distinct !DILexicalBlock(scope: !406, file: !94, line: 136)
!406 = distinct !DILexicalBlock(scope: !403, file: !94, line: 136)
!407 = !DILocation(line: 136, scope: !408)
!408 = distinct !DILexicalBlock(scope: !405, file: !94, line: 136)
!409 = !DILocation(line: 136, scope: !410)
!410 = distinct !DILexicalBlock(scope: !411, file: !94, line: 136)
!411 = distinct !DILexicalBlock(scope: !408, file: !94, line: 136)
!412 = !DILocation(line: 137, scope: !401)
!413 = !DILocation(line: 138, scope: !384)
!414 = !DILocation(line: 139, scope: !415)
!415 = distinct !DILexicalBlock(scope: !384, file: !94, line: 138)
!416 = !DILocation(line: 139, scope: !417)
!417 = distinct !DILexicalBlock(scope: !415, file: !94, line: 139)
!418 = !DILocation(line: 139, scope: !419)
!419 = distinct !DILexicalBlock(scope: !420, file: !94, line: 139)
!420 = distinct !DILexicalBlock(scope: !417, file: !94, line: 139)
!421 = !DILocation(line: 139, scope: !422)
!422 = distinct !DILexicalBlock(scope: !419, file: !94, line: 139)
!423 = !DILocation(line: 139, scope: !424)
!424 = distinct !DILexicalBlock(scope: !425, file: !94, line: 139)
!425 = distinct !DILexicalBlock(scope: !422, file: !94, line: 139)
!426 = !DILocation(line: 140, scope: !384)
!427 = !DILocation(line: 140, scope: !428)
!428 = distinct !DILexicalBlock(scope: !384, file: !94, line: 140)
!429 = !DILocation(line: 140, scope: !430)
!430 = distinct !DILexicalBlock(scope: !431, file: !94, line: 140)
!431 = distinct !DILexicalBlock(scope: !428, file: !94, line: 140)
!432 = !DILocation(line: 140, scope: !433)
!433 = distinct !DILexicalBlock(scope: !430, file: !94, line: 140)
!434 = !DILocation(line: 140, scope: !435)
!435 = distinct !DILexicalBlock(scope: !436, file: !94, line: 140)
!436 = distinct !DILexicalBlock(scope: !433, file: !94, line: 140)
!437 = !DILocation(line: 141, scope: !384)
!438 = !DILocation(line: 132, scope: !385)
!439 = distinct !{!439, !382, !440, !277}
!440 = !DILocation(line: 141, scope: !381)
!441 = !DILocation(line: 142, scope: !346)
!442 = !DILocation(line: 142, scope: !443)
!443 = distinct !DILexicalBlock(scope: !346, file: !94, line: 142)
!444 = !DILocation(line: 142, scope: !445)
!445 = distinct !DILexicalBlock(scope: !446, file: !94, line: 142)
!446 = distinct !DILexicalBlock(scope: !443, file: !94, line: 142)
!447 = !DILocation(line: 142, scope: !448)
!448 = distinct !DILexicalBlock(scope: !445, file: !94, line: 142)
!449 = !DILocation(line: 142, scope: !450)
!450 = distinct !DILexicalBlock(scope: !451, file: !94, line: 142)
!451 = distinct !DILexicalBlock(scope: !448, file: !94, line: 142)
!452 = !DILocation(line: 143, scope: !346)
!453 = distinct !DISubprogram(name: "InitializePage", scope: !94, file: !94, line: 148, type: !454, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !145)
!454 = !DISubroutineType(types: !455)
!455 = !{!142, !55, !456}
!456 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!457 = !DILocalVariable(name: "Size", arg: 1, scope: !453, file: !94, line: 149, type: !55)
!458 = !DILocation(line: 149, scope: !453)
!459 = !DILocalVariable(name: "Pages", arg: 2, scope: !453, file: !94, line: 150, type: !456)
!460 = !DILocation(line: 150, scope: !453)
!461 = !DILocation(line: 153, scope: !453)
!462 = !DILocation(line: 154, scope: !453)
!463 = !DILocation(line: 155, scope: !464)
!464 = distinct !DILexicalBlock(scope: !465, file: !94, line: 154)
!465 = distinct !DILexicalBlock(scope: !453, file: !94, line: 154)
!466 = !DILocation(line: 155, scope: !467)
!467 = distinct !DILexicalBlock(scope: !464, file: !94, line: 155)
!468 = !DILocation(line: 155, scope: !469)
!469 = distinct !DILexicalBlock(scope: !470, file: !94, line: 155)
!470 = distinct !DILexicalBlock(scope: !467, file: !94, line: 155)
!471 = !DILocation(line: 155, scope: !472)
!472 = distinct !DILexicalBlock(scope: !469, file: !94, line: 155)
!473 = !DILocation(line: 155, scope: !474)
!474 = distinct !DILexicalBlock(scope: !475, file: !94, line: 155)
!475 = distinct !DILexicalBlock(scope: !472, file: !94, line: 155)
!476 = !DILocation(line: 156, scope: !464)
!477 = !DILocation(line: 159, scope: !453)
!478 = !DILocation(line: 160, scope: !453)
!479 = distinct !DISubprogram(name: "InitializeHeapMetadata", scope: !94, file: !94, line: 164, type: !255, scopeLine: 165, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !145)
!480 = !DILocation(line: 166, scope: !479)
!481 = !DILocation(line: 166, scope: !482)
!482 = distinct !DILexicalBlock(scope: !479, file: !94, line: 166)
!483 = !DILocation(line: 166, scope: !484)
!484 = distinct !DILexicalBlock(scope: !485, file: !94, line: 166)
!485 = distinct !DILexicalBlock(scope: !482, file: !94, line: 166)
!486 = !DILocation(line: 166, scope: !487)
!487 = distinct !DILexicalBlock(scope: !484, file: !94, line: 166)
!488 = !DILocation(line: 166, scope: !489)
!489 = distinct !DILexicalBlock(scope: !490, file: !94, line: 166)
!490 = distinct !DILexicalBlock(scope: !487, file: !94, line: 166)
!491 = !DILocation(line: 167, scope: !479)
!492 = !DILocalVariable(name: "i", scope: !493, file: !94, line: 168, type: !55)
!493 = distinct !DILexicalBlock(scope: !479, file: !94, line: 168)
!494 = !DILocation(line: 168, scope: !493)
!495 = !DILocation(line: 169, scope: !496)
!496 = distinct !DILexicalBlock(scope: !497, file: !94, line: 168)
!497 = distinct !DILexicalBlock(scope: !493, file: !94, line: 168)
!498 = !DILocation(line: 170, scope: !496)
!499 = !DILocation(line: 171, scope: !496)
!500 = !DILocation(line: 172, scope: !496)
!501 = !DILocation(line: 168, scope: !497)
!502 = distinct !{!502, !494, !503, !277}
!503 = !DILocation(line: 172, scope: !493)
!504 = !DILocation(line: 174, scope: !479)
!505 = distinct !DISubprogram(name: "InitializeHeap", scope: !94, file: !94, line: 179, type: !255, scopeLine: 180, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !145)
!506 = !DILocalVariable(name: "Status", scope: !505, file: !94, line: 181, type: !142)
!507 = !DILocation(line: 181, scope: !505)
!508 = !DILocation(line: 182, scope: !505)
!509 = !DILocation(line: 182, scope: !510)
!510 = distinct !DILexicalBlock(scope: !505, file: !94, line: 182)
!511 = !DILocation(line: 182, scope: !512)
!512 = distinct !DILexicalBlock(scope: !513, file: !94, line: 182)
!513 = distinct !DILexicalBlock(scope: !510, file: !94, line: 182)
!514 = !DILocation(line: 182, scope: !515)
!515 = distinct !DILexicalBlock(scope: !512, file: !94, line: 182)
!516 = !DILocation(line: 182, scope: !517)
!517 = distinct !DILexicalBlock(scope: !518, file: !94, line: 182)
!518 = distinct !DILexicalBlock(scope: !515, file: !94, line: 182)
!519 = !DILocalVariable(name: "i", scope: !520, file: !94, line: 183, type: !83)
!520 = distinct !DILexicalBlock(scope: !505, file: !94, line: 183)
!521 = !DILocation(line: 183, scope: !520)
!522 = !DILocation(line: 184, scope: !523)
!523 = distinct !DILexicalBlock(scope: !524, file: !94, line: 183)
!524 = distinct !DILexicalBlock(scope: !520, file: !94, line: 183)
!525 = !DILocation(line: 185, scope: !523)
!526 = !DILocation(line: 187, scope: !527)
!527 = distinct !DILexicalBlock(scope: !528, file: !94, line: 186)
!528 = distinct !DILexicalBlock(scope: !523, file: !94, line: 185)
!529 = !DILocation(line: 189, scope: !523)
!530 = !DILocalVariable(name: "Current", scope: !523, file: !94, line: 190, type: !64)
!531 = !DILocation(line: 190, scope: !523)
!532 = !DILocalVariable(name: "j", scope: !533, file: !94, line: 191, type: !83)
!533 = distinct !DILexicalBlock(scope: !523, file: !94, line: 191)
!534 = !DILocation(line: 191, scope: !533)
!535 = !DILocation(line: 192, scope: !536)
!536 = distinct !DILexicalBlock(scope: !537, file: !94, line: 191)
!537 = distinct !DILexicalBlock(scope: !533, file: !94, line: 191)
!538 = !DILocation(line: 193, scope: !536)
!539 = !DILocation(line: 194, scope: !536)
!540 = !DILocation(line: 191, scope: !537)
!541 = distinct !{!541, !534, !542, !277}
!542 = !DILocation(line: 194, scope: !533)
!543 = !DILocation(line: 195, scope: !523)
!544 = !DILocation(line: 183, scope: !524)
!545 = distinct !{!545, !521, !546, !277}
!546 = !DILocation(line: 195, scope: !520)
!547 = !DILocation(line: 196, scope: !505)
!548 = !DILocation(line: 197, scope: !505)
!549 = distinct !DISubprogram(name: "HeapManagerEntryPoint", scope: !94, file: !94, line: 202, type: !550, scopeLine: 206, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !145)
!550 = !DISubroutineType(types: !551)
!551 = !{!142, !552, !553}
!552 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_HANDLE", file: !143, line: 33, baseType: !76)
!553 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !554, size: 64)
!554 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SYSTEM_TABLE", file: !14, line: 2053, baseType: !555)
!555 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_SYSTEM_TABLE", file: !14, line: 1992, size: 960, elements: !556)
!556 = !{!557, !566, !570, !571, !572, !597, !598, !653, !654, !655, !792, !1048, !1049}
!557 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !555, file: !14, line: 1996, baseType: !558, size: 192)
!558 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TABLE_HEADER", file: !6, line: 177, baseType: !559)
!559 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TABLE_HEADER", file: !6, line: 150, size: 192, elements: !560)
!560 = !{!561, !562, !563, !564, !565}
!561 = !DIDerivedType(tag: DW_TAG_member, name: "Signature", scope: !559, file: !6, line: 156, baseType: !57, size: 64)
!562 = !DIDerivedType(tag: DW_TAG_member, name: "Revision", scope: !559, file: !6, line: 163, baseType: !99, size: 32, offset: 64)
!563 = !DIDerivedType(tag: DW_TAG_member, name: "HeaderSize", scope: !559, file: !6, line: 167, baseType: !99, size: 32, offset: 96)
!564 = !DIDerivedType(tag: DW_TAG_member, name: "CRC32", scope: !559, file: !6, line: 172, baseType: !99, size: 32, offset: 128)
!565 = !DIDerivedType(tag: DW_TAG_member, name: "Reserved", scope: !559, file: !6, line: 176, baseType: !99, size: 32, offset: 160)
!566 = !DIDerivedType(tag: DW_TAG_member, name: "FirmwareVendor", scope: !555, file: !14, line: 2001, baseType: !567, size: 64, offset: 192)
!567 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !568, size: 64)
!568 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR16", file: !56, line: 183, baseType: !569)
!569 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!570 = !DIDerivedType(tag: DW_TAG_member, name: "FirmwareRevision", scope: !555, file: !14, line: 2006, baseType: !99, size: 32, offset: 256)
!571 = !DIDerivedType(tag: DW_TAG_member, name: "ConsoleInHandle", scope: !555, file: !14, line: 2011, baseType: !552, size: 64, offset: 320)
!572 = !DIDerivedType(tag: DW_TAG_member, name: "ConIn", scope: !555, file: !14, line: 2016, baseType: !573, size: 64, offset: 384)
!573 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !574, size: 64)
!574 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_INPUT_PROTOCOL", file: !575, line: 20, baseType: !576)
!575 = !DIFile(filename: "MdePkg/Include/Protocol/SimpleTextIn.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "239cf4f3dddb25a8596c70fa738413fd")
!576 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EFI_SIMPLE_TEXT_INPUT_PROTOCOL", file: !575, line: 116, size: 192, elements: !577)
!577 = !{!578, !583, !595}
!578 = !DIDerivedType(tag: DW_TAG_member, name: "Reset", scope: !576, file: !575, line: 117, baseType: !579, size: 64)
!579 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_RESET", file: !575, line: 86, baseType: !580)
!580 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !581, size: 64)
!581 = !DISubroutineType(types: !582)
!582 = !{!142, !573, !59}
!583 = !DIDerivedType(tag: DW_TAG_member, name: "ReadKeyStroke", scope: !576, file: !575, line: 118, baseType: !584, size: 64, offset: 64)
!584 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_READ_KEY", file: !575, line: 107, baseType: !585)
!585 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !586, size: 64)
!586 = !DISubroutineType(types: !587)
!587 = !{!142, !573, !588}
!588 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !589, size: 64)
!589 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_KEY", file: !575, line: 38, baseType: !590)
!590 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_INPUT_KEY", file: !575, line: 35, size: 32, elements: !591)
!591 = !{!592, !594}
!592 = !DIDerivedType(tag: DW_TAG_member, name: "ScanCode", scope: !590, file: !575, line: 36, baseType: !593, size: 16)
!593 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT16", file: !56, line: 178, baseType: !569)
!594 = !DIDerivedType(tag: DW_TAG_member, name: "UnicodeChar", scope: !590, file: !575, line: 37, baseType: !568, size: 16, offset: 16)
!595 = !DIDerivedType(tag: DW_TAG_member, name: "WaitForKey", scope: !576, file: !575, line: 122, baseType: !596, size: 64, offset: 128)
!596 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EVENT", file: !143, line: 37, baseType: !76)
!597 = !DIDerivedType(tag: DW_TAG_member, name: "ConsoleOutHandle", scope: !555, file: !14, line: 2020, baseType: !552, size: 64, offset: 448)
!598 = !DIDerivedType(tag: DW_TAG_member, name: "ConOut", scope: !555, file: !14, line: 2025, baseType: !599, size: 64, offset: 512)
!599 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !600, size: 64)
!600 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL", file: !601, line: 27, baseType: !602)
!601 = !DIFile(filename: "MdePkg/Include/Protocol/SimpleTextOut.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "685bec042927ad46d31bf42ae7f6ddcd")
!602 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL", file: !601, line: 387, size: 640, elements: !603)
!603 = !{!604, !609, !614, !616, !622, !627, !629, !634, !639, !641}
!604 = !DIDerivedType(tag: DW_TAG_member, name: "Reset", scope: !602, file: !601, line: 388, baseType: !605, size: 64)
!605 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_RESET", file: !601, line: 167, baseType: !606)
!606 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !607, size: 64)
!607 = !DISubroutineType(types: !608)
!608 = !{!142, !599, !59}
!609 = !DIDerivedType(tag: DW_TAG_member, name: "OutputString", scope: !602, file: !601, line: 390, baseType: !610, size: 64, offset: 64)
!610 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_STRING", file: !601, line: 192, baseType: !611)
!611 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !612, size: 64)
!612 = !DISubroutineType(types: !613)
!613 = !{!142, !599, !567}
!614 = !DIDerivedType(tag: DW_TAG_member, name: "TestString", scope: !602, file: !601, line: 391, baseType: !615, size: 64, offset: 128)
!615 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_TEST_STRING", file: !601, line: 213, baseType: !611)
!616 = !DIDerivedType(tag: DW_TAG_member, name: "QueryMode", scope: !602, file: !601, line: 393, baseType: !617, size: 64, offset: 192)
!617 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_QUERY_MODE", file: !601, line: 236, baseType: !618)
!618 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !619, size: 64)
!619 = !DISubroutineType(types: !620)
!620 = !{!142, !599, !55, !621, !621}
!621 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!622 = !DIDerivedType(tag: DW_TAG_member, name: "SetMode", scope: !602, file: !601, line: 394, baseType: !623, size: 64, offset: 256)
!623 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_MODE", file: !601, line: 256, baseType: !624)
!624 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !625, size: 64)
!625 = !DISubroutineType(types: !626)
!626 = !{!142, !599, !55}
!627 = !DIDerivedType(tag: DW_TAG_member, name: "SetAttribute", scope: !602, file: !601, line: 395, baseType: !628, size: 64, offset: 320)
!628 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_ATTRIBUTE", file: !601, line: 277, baseType: !624)
!629 = !DIDerivedType(tag: DW_TAG_member, name: "ClearScreen", scope: !602, file: !601, line: 397, baseType: !630, size: 64, offset: 384)
!630 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_CLEAR_SCREEN", file: !601, line: 295, baseType: !631)
!631 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !632, size: 64)
!632 = !DISubroutineType(types: !633)
!633 = !{!142, !599}
!634 = !DIDerivedType(tag: DW_TAG_member, name: "SetCursorPosition", scope: !602, file: !601, line: 398, baseType: !635, size: 64, offset: 448)
!635 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_CURSOR_POSITION", file: !601, line: 318, baseType: !636)
!636 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !637, size: 64)
!637 = !DISubroutineType(types: !638)
!638 = !{!142, !599, !55, !55}
!639 = !DIDerivedType(tag: DW_TAG_member, name: "EnableCursor", scope: !602, file: !601, line: 399, baseType: !640, size: 64, offset: 512)
!640 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_ENABLE_CURSOR", file: !601, line: 340, baseType: !606)
!641 = !DIDerivedType(tag: DW_TAG_member, name: "Mode", scope: !602, file: !601, line: 404, baseType: !642, size: 64, offset: 576)
!642 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !643, size: 64)
!643 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_OUTPUT_MODE", file: !601, line: 379, baseType: !644)
!644 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_SIMPLE_TEXT_OUTPUT_MODE", file: !601, line: 349, size: 192, elements: !645)
!645 = !{!646, !648, !649, !650, !651, !652}
!646 = !DIDerivedType(tag: DW_TAG_member, name: "MaxMode", scope: !644, file: !601, line: 353, baseType: !647, size: 32)
!647 = !DIDerivedType(tag: DW_TAG_typedef, name: "INT32", file: !56, line: 174, baseType: !83)
!648 = !DIDerivedType(tag: DW_TAG_member, name: "Mode", scope: !644, file: !601, line: 362, baseType: !647, size: 32, offset: 32)
!649 = !DIDerivedType(tag: DW_TAG_member, name: "Attribute", scope: !644, file: !601, line: 366, baseType: !647, size: 32, offset: 64)
!650 = !DIDerivedType(tag: DW_TAG_member, name: "CursorColumn", scope: !644, file: !601, line: 370, baseType: !647, size: 32, offset: 96)
!651 = !DIDerivedType(tag: DW_TAG_member, name: "CursorRow", scope: !644, file: !601, line: 374, baseType: !647, size: 32, offset: 128)
!652 = !DIDerivedType(tag: DW_TAG_member, name: "CursorVisible", scope: !644, file: !601, line: 378, baseType: !59, size: 8, offset: 160)
!653 = !DIDerivedType(tag: DW_TAG_member, name: "StandardErrorHandle", scope: !555, file: !14, line: 2030, baseType: !552, size: 64, offset: 576)
!654 = !DIDerivedType(tag: DW_TAG_member, name: "StdErr", scope: !555, file: !14, line: 2035, baseType: !599, size: 64, offset: 640)
!655 = !DIDerivedType(tag: DW_TAG_member, name: "RuntimeServices", scope: !555, file: !14, line: 2039, baseType: !656, size: 64, offset: 704)
!656 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !657, size: 64)
!657 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RUNTIME_SERVICES", file: !14, line: 1871, baseType: !658)
!658 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_RUNTIME_SERVICES", file: !14, line: 1828, size: 1088, elements: !659)
!659 = !{!660, !661, !690, !695, !701, !706, !722, !727, !745, !750, !755, !760, !766, !780, !787}
!660 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !658, file: !14, line: 1832, baseType: !558, size: 192)
!661 = !DIDerivedType(tag: DW_TAG_member, name: "GetTime", scope: !658, file: !14, line: 1837, baseType: !662, size: 64, offset: 192)
!662 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_TIME", file: !14, line: 816, baseType: !663)
!663 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !664, size: 64)
!664 = !DISubroutineType(types: !665)
!665 = !{!142, !666, !683}
!666 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !667, size: 64)
!667 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIME", file: !143, line: 80, baseType: !668)
!668 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TIME", file: !143, line: 68, size: 128, elements: !669)
!669 = !{!670, !671, !672, !673, !674, !675, !676, !677, !678, !681, !682}
!670 = !DIDerivedType(tag: DW_TAG_member, name: "Year", scope: !668, file: !143, line: 69, baseType: !593, size: 16)
!671 = !DIDerivedType(tag: DW_TAG_member, name: "Month", scope: !668, file: !143, line: 70, baseType: !78, size: 8, offset: 16)
!672 = !DIDerivedType(tag: DW_TAG_member, name: "Day", scope: !668, file: !143, line: 71, baseType: !78, size: 8, offset: 24)
!673 = !DIDerivedType(tag: DW_TAG_member, name: "Hour", scope: !668, file: !143, line: 72, baseType: !78, size: 8, offset: 32)
!674 = !DIDerivedType(tag: DW_TAG_member, name: "Minute", scope: !668, file: !143, line: 73, baseType: !78, size: 8, offset: 40)
!675 = !DIDerivedType(tag: DW_TAG_member, name: "Second", scope: !668, file: !143, line: 74, baseType: !78, size: 8, offset: 48)
!676 = !DIDerivedType(tag: DW_TAG_member, name: "Pad1", scope: !668, file: !143, line: 75, baseType: !78, size: 8, offset: 56)
!677 = !DIDerivedType(tag: DW_TAG_member, name: "Nanosecond", scope: !668, file: !143, line: 76, baseType: !99, size: 32, offset: 64)
!678 = !DIDerivedType(tag: DW_TAG_member, name: "TimeZone", scope: !668, file: !143, line: 77, baseType: !679, size: 16, offset: 96)
!679 = !DIDerivedType(tag: DW_TAG_typedef, name: "INT16", file: !56, line: 187, baseType: !680)
!680 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!681 = !DIDerivedType(tag: DW_TAG_member, name: "Daylight", scope: !668, file: !143, line: 78, baseType: !78, size: 8, offset: 112)
!682 = !DIDerivedType(tag: DW_TAG_member, name: "Pad2", scope: !668, file: !143, line: 79, baseType: !78, size: 8, offset: 120)
!683 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !684, size: 64)
!684 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIME_CAPABILITIES", file: !14, line: 799, baseType: !685)
!685 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TIME_CAPABILITIES", file: !14, line: 776, size: 96, elements: !686)
!686 = !{!687, !688, !689}
!687 = !DIDerivedType(tag: DW_TAG_member, name: "Resolution", scope: !685, file: !14, line: 783, baseType: !99, size: 32)
!688 = !DIDerivedType(tag: DW_TAG_member, name: "Accuracy", scope: !685, file: !14, line: 790, baseType: !99, size: 32, offset: 32)
!689 = !DIDerivedType(tag: DW_TAG_member, name: "SetsToZero", scope: !685, file: !14, line: 798, baseType: !59, size: 8, offset: 64)
!690 = !DIDerivedType(tag: DW_TAG_member, name: "SetTime", scope: !658, file: !14, line: 1838, baseType: !691, size: 64, offset: 256)
!691 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_TIME", file: !14, line: 833, baseType: !692)
!692 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !693, size: 64)
!693 = !DISubroutineType(types: !694)
!694 = !{!142, !666}
!695 = !DIDerivedType(tag: DW_TAG_member, name: "GetWakeupTime", scope: !658, file: !14, line: 1839, baseType: !696, size: 64, offset: 320)
!696 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_WAKEUP_TIME", file: !14, line: 854, baseType: !697)
!697 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !698, size: 64)
!698 = !DISubroutineType(types: !699)
!699 = !{!142, !700, !700, !666}
!700 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!701 = !DIDerivedType(tag: DW_TAG_member, name: "SetWakeupTime", scope: !658, file: !14, line: 1840, baseType: !702, size: 64, offset: 384)
!702 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_WAKEUP_TIME", file: !14, line: 876, baseType: !703)
!703 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !704, size: 64)
!704 = !DISubroutineType(types: !705)
!705 = !{!142, !59, !666}
!706 = !DIDerivedType(tag: DW_TAG_member, name: "SetVirtualAddressMap", scope: !658, file: !14, line: 1845, baseType: !707, size: 64, offset: 448)
!707 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_VIRTUAL_ADDRESS_MAP", file: !14, line: 327, baseType: !708)
!708 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !709, size: 64)
!709 = !DISubroutineType(types: !710)
!710 = !{!142, !55, !55, !99, !711}
!711 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !712, size: 64)
!712 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_MEMORY_DESCRIPTOR", file: !14, line: 175, baseType: !713)
!713 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_MEMORY_DESCRIPTOR", file: !14, line: 143, size: 320, elements: !714)
!714 = !{!715, !716, !718, !720, !721}
!715 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !713, file: !14, line: 149, baseType: !99, size: 32)
!716 = !DIDerivedType(tag: DW_TAG_member, name: "PhysicalStart", scope: !713, file: !14, line: 155, baseType: !717, size: 64, offset: 64)
!717 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_PHYSICAL_ADDRESS", file: !143, line: 50, baseType: !57)
!718 = !DIDerivedType(tag: DW_TAG_member, name: "VirtualStart", scope: !713, file: !14, line: 161, baseType: !719, size: 64, offset: 128)
!719 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_VIRTUAL_ADDRESS", file: !143, line: 55, baseType: !57)
!720 = !DIDerivedType(tag: DW_TAG_member, name: "NumberOfPages", scope: !713, file: !14, line: 168, baseType: !57, size: 64, offset: 192)
!721 = !DIDerivedType(tag: DW_TAG_member, name: "Attribute", scope: !713, file: !14, line: 174, baseType: !57, size: 64, offset: 256)
!722 = !DIDerivedType(tag: DW_TAG_member, name: "ConvertPointer", scope: !658, file: !14, line: 1846, baseType: !723, size: 64, offset: 512)
!723 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONVERT_POINTER", file: !14, line: 422, baseType: !724)
!724 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !725, size: 64)
!725 = !DISubroutineType(types: !726)
!726 = !{!142, !55, !79}
!727 = !DIDerivedType(tag: DW_TAG_member, name: "GetVariable", scope: !658, file: !14, line: 1851, baseType: !728, size: 64, offset: 576)
!728 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_VARIABLE", file: !14, line: 686, baseType: !729)
!729 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !730, size: 64)
!730 = !DISubroutineType(types: !731)
!731 = !{!142, !567, !732, !744, !621, !76}
!732 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !733, size: 64)
!733 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GUID", file: !143, line: 25, baseType: !734)
!734 = !DIDerivedType(tag: DW_TAG_typedef, name: "GUID", file: !54, line: 218, baseType: !735)
!735 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GUID", file: !54, line: 213, size: 128, elements: !736)
!736 = !{!737, !738, !739, !740}
!737 = !DIDerivedType(tag: DW_TAG_member, name: "Data1", scope: !735, file: !54, line: 214, baseType: !99, size: 32)
!738 = !DIDerivedType(tag: DW_TAG_member, name: "Data2", scope: !735, file: !54, line: 215, baseType: !593, size: 16, offset: 32)
!739 = !DIDerivedType(tag: DW_TAG_member, name: "Data3", scope: !735, file: !54, line: 216, baseType: !593, size: 16, offset: 48)
!740 = !DIDerivedType(tag: DW_TAG_member, name: "Data4", scope: !735, file: !54, line: 217, baseType: !741, size: 64, offset: 64)
!741 = !DICompositeType(tag: DW_TAG_array_type, baseType: !78, size: 64, elements: !742)
!742 = !{!743}
!743 = !DISubrange(count: 8)
!744 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!745 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextVariableName", scope: !658, file: !14, line: 1852, baseType: !746, size: 64, offset: 640)
!746 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_VARIABLE_NAME", file: !14, line: 722, baseType: !747)
!747 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !748, size: 64)
!748 = !DISubroutineType(types: !749)
!749 = !{!142, !621, !567, !732}
!750 = !DIDerivedType(tag: DW_TAG_member, name: "SetVariable", scope: !658, file: !14, line: 1853, baseType: !751, size: 64, offset: 704)
!751 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_VARIABLE", file: !14, line: 764, baseType: !752)
!752 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !753, size: 64)
!753 = !DISubroutineType(types: !754)
!754 = !{!142, !567, !732, !99, !55, !76}
!755 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextHighMonotonicCount", scope: !658, file: !14, line: 1858, baseType: !756, size: 64, offset: 768)
!756 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_HIGH_MONO_COUNT", file: !14, line: 1097, baseType: !757)
!757 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !758, size: 64)
!758 = !DISubroutineType(types: !759)
!759 = !{!142, !744}
!760 = !DIDerivedType(tag: DW_TAG_member, name: "ResetSystem", scope: !658, file: !14, line: 1859, baseType: !761, size: 64, offset: 832)
!761 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RESET_SYSTEM", file: !14, line: 1062, baseType: !762)
!762 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !763, size: 64)
!763 = !DISubroutineType(types: !764)
!764 = !{null, !765, !142, !55, !76}
!765 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RESET_TYPE", file: !6, line: 145, baseType: !5)
!766 = !DIDerivedType(tag: DW_TAG_member, name: "UpdateCapsule", scope: !658, file: !14, line: 1864, baseType: !767, size: 64, offset: 896)
!767 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UPDATE_CAPSULE", file: !14, line: 1723, baseType: !768)
!768 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !769, size: 64)
!769 = !DISubroutineType(types: !770)
!770 = !{!142, !771, !55, !717}
!771 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !772, size: 64)
!772 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !773, size: 64)
!773 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CAPSULE_HEADER", file: !14, line: 1669, baseType: !774)
!774 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_CAPSULE_HEADER", file: !14, line: 1648, size: 224, elements: !775)
!775 = !{!776, !777, !778, !779}
!776 = !DIDerivedType(tag: DW_TAG_member, name: "CapsuleGuid", scope: !774, file: !14, line: 1652, baseType: !733, size: 128)
!777 = !DIDerivedType(tag: DW_TAG_member, name: "HeaderSize", scope: !774, file: !14, line: 1658, baseType: !99, size: 32, offset: 128)
!778 = !DIDerivedType(tag: DW_TAG_member, name: "Flags", scope: !774, file: !14, line: 1664, baseType: !99, size: 32, offset: 160)
!779 = !DIDerivedType(tag: DW_TAG_member, name: "CapsuleImageSize", scope: !774, file: !14, line: 1668, baseType: !99, size: 32, offset: 192)
!780 = !DIDerivedType(tag: DW_TAG_member, name: "QueryCapsuleCapabilities", scope: !658, file: !14, line: 1865, baseType: !781, size: 64, offset: 960)
!781 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_QUERY_CAPSULE_CAPABILITIES", file: !14, line: 1754, baseType: !782)
!782 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !783, size: 64)
!783 = !DISubroutineType(types: !784)
!784 = !{!142, !771, !55, !785, !786}
!785 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!786 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !765, size: 64)
!787 = !DIDerivedType(tag: DW_TAG_member, name: "QueryVariableInfo", scope: !658, file: !14, line: 1870, baseType: !788, size: 64, offset: 1024)
!788 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_QUERY_VARIABLE_INFO", file: !14, line: 1785, baseType: !789)
!789 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !790, size: 64)
!790 = !DISubroutineType(types: !791)
!791 = !{!142, !99, !785, !785, !785}
!792 = !DIDerivedType(tag: DW_TAG_member, name: "BootServices", scope: !555, file: !14, line: 2043, baseType: !793, size: 64, offset: 768)
!793 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !794, size: 64)
!794 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_BOOT_SERVICES", file: !14, line: 1972, baseType: !795)
!795 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_BOOT_SERVICES", file: !14, line: 1879, size: 3008, elements: !796)
!796 = !{!797, !798, !804, !809, !817, !822, !827, !832, !837, !847, !853, !858, !863, !865, !867, !874, !879, !884, !889, !890, !895, !901, !918, !923, !928, !934, !939, !944, !949, !954, !957, !962, !967, !972, !977, !982, !996, !1003, !1009, !1014, !1019, !1024, !1029, !1034, !1039}
!797 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !795, file: !14, line: 1883, baseType: !558, size: 192)
!798 = !DIDerivedType(tag: DW_TAG_member, name: "RaiseTPL", scope: !795, file: !14, line: 1888, baseType: !799, size: 64, offset: 192)
!799 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RAISE_TPL", file: !14, line: 644, baseType: !800)
!800 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !801, size: 64)
!801 = !DISubroutineType(types: !802)
!802 = !{!803, !803}
!803 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TPL", file: !143, line: 41, baseType: !55)
!804 = !DIDerivedType(tag: DW_TAG_member, name: "RestoreTPL", scope: !795, file: !14, line: 1889, baseType: !805, size: 64, offset: 256)
!805 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RESTORE_TPL", file: !14, line: 656, baseType: !806)
!806 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !807, size: 64)
!807 = !DISubroutineType(types: !808)
!808 = !{null, !803}
!809 = !DIDerivedType(tag: DW_TAG_member, name: "AllocatePages", scope: !795, file: !14, line: 1894, baseType: !810, size: 64, offset: 320)
!810 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_ALLOCATE_PAGES", file: !14, line: 203, baseType: !811)
!811 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !812, size: 64)
!812 = !DISubroutineType(types: !813)
!813 = !{!142, !814, !815, !55, !816}
!814 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_ALLOCATE_TYPE", file: !14, line: 47, baseType: !13)
!815 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_MEMORY_TYPE", file: !6, line: 112, baseType: !20)
!816 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !717, size: 64)
!817 = !DIDerivedType(tag: DW_TAG_member, name: "FreePages", scope: !795, file: !14, line: 1895, baseType: !818, size: 64, offset: 384)
!818 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_FREE_PAGES", file: !14, line: 224, baseType: !819)
!819 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !820, size: 64)
!820 = !DISubroutineType(types: !821)
!821 = !{!142, !717, !55}
!822 = !DIDerivedType(tag: DW_TAG_member, name: "GetMemoryMap", scope: !795, file: !14, line: 1896, baseType: !823, size: 64, offset: 448)
!823 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_MEMORY_MAP", file: !14, line: 256, baseType: !824)
!824 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !825, size: 64)
!825 = !DISubroutineType(types: !826)
!826 = !{!142, !621, !711, !621, !621, !744}
!827 = !DIDerivedType(tag: DW_TAG_member, name: "AllocatePool", scope: !795, file: !14, line: 1897, baseType: !828, size: 64, offset: 512)
!828 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_ALLOCATE_POOL", file: !14, line: 285, baseType: !829)
!829 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !830, size: 64)
!830 = !DISubroutineType(types: !831)
!831 = !{!142, !815, !55, !79}
!832 = !DIDerivedType(tag: DW_TAG_member, name: "FreePool", scope: !795, file: !14, line: 1898, baseType: !833, size: 64, offset: 576)
!833 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_FREE_POOL", file: !14, line: 302, baseType: !834)
!834 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !835, size: 64)
!835 = !DISubroutineType(types: !836)
!836 = !{!142, !76}
!837 = !DIDerivedType(tag: DW_TAG_member, name: "CreateEvent", scope: !795, file: !14, line: 1903, baseType: !838, size: 64, offset: 640)
!838 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CREATE_EVENT", file: !14, line: 480, baseType: !839)
!839 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !840, size: 64)
!840 = !DISubroutineType(types: !841)
!841 = !{!142, !99, !803, !842, !76, !846}
!842 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EVENT_NOTIFY", file: !14, line: 457, baseType: !843)
!843 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !844, size: 64)
!844 = !DISubroutineType(types: !845)
!845 = !{null, !596, !76}
!846 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !596, size: 64)
!847 = !DIDerivedType(tag: DW_TAG_member, name: "SetTimer", scope: !795, file: !14, line: 1904, baseType: !848, size: 64, offset: 704)
!848 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_TIMER", file: !14, line: 554, baseType: !849)
!849 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !850, size: 64)
!850 = !DISubroutineType(types: !851)
!851 = !{!142, !596, !852, !57}
!852 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIMER_DELAY", file: !14, line: 534, baseType: !39)
!853 = !DIDerivedType(tag: DW_TAG_member, name: "WaitForEvent", scope: !795, file: !14, line: 1905, baseType: !854, size: 64, offset: 768)
!854 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_WAIT_FOR_EVENT", file: !14, line: 590, baseType: !855)
!855 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !856, size: 64)
!856 = !DISubroutineType(types: !857)
!857 = !{!142, !55, !846, !621}
!858 = !DIDerivedType(tag: DW_TAG_member, name: "SignalEvent", scope: !795, file: !14, line: 1906, baseType: !859, size: 64, offset: 832)
!859 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIGNAL_EVENT", file: !14, line: 570, baseType: !860)
!860 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !861, size: 64)
!861 = !DISubroutineType(types: !862)
!862 = !{!142, !596}
!863 = !DIDerivedType(tag: DW_TAG_member, name: "CloseEvent", scope: !795, file: !14, line: 1907, baseType: !864, size: 64, offset: 896)
!864 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CLOSE_EVENT", file: !14, line: 606, baseType: !860)
!865 = !DIDerivedType(tag: DW_TAG_member, name: "CheckEvent", scope: !795, file: !14, line: 1908, baseType: !866, size: 64, offset: 960)
!866 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CHECK_EVENT", file: !14, line: 622, baseType: !860)
!867 = !DIDerivedType(tag: DW_TAG_member, name: "InstallProtocolInterface", scope: !795, file: !14, line: 1913, baseType: !868, size: 64, offset: 1024)
!868 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_PROTOCOL_INTERFACE", file: !14, line: 1188, baseType: !869)
!869 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !870, size: 64)
!870 = !DISubroutineType(types: !871)
!871 = !{!142, !872, !732, !873, !76}
!872 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !552, size: 64)
!873 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INTERFACE_TYPE", file: !14, line: 1164, baseType: !44)
!874 = !DIDerivedType(tag: DW_TAG_member, name: "ReinstallProtocolInterface", scope: !795, file: !14, line: 1914, baseType: !875, size: 64, offset: 1088)
!875 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_REINSTALL_PROTOCOL_INTERFACE", file: !14, line: 1238, baseType: !876)
!876 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !877, size: 64)
!877 = !DISubroutineType(types: !878)
!878 = !{!142, !552, !732, !76, !76}
!879 = !DIDerivedType(tag: DW_TAG_member, name: "UninstallProtocolInterface", scope: !795, file: !14, line: 1915, baseType: !880, size: 64, offset: 1152)
!880 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UNINSTALL_PROTOCOL_INTERFACE", file: !14, line: 1264, baseType: !881)
!881 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !882, size: 64)
!882 = !DISubroutineType(types: !883)
!883 = !{!142, !552, !732, !76}
!884 = !DIDerivedType(tag: DW_TAG_member, name: "HandleProtocol", scope: !795, file: !14, line: 1916, baseType: !885, size: 64, offset: 1216)
!885 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_HANDLE_PROTOCOL", file: !14, line: 1305, baseType: !886)
!886 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !887, size: 64)
!887 = !DISubroutineType(types: !888)
!888 = !{!142, !552, !732, !79}
!889 = !DIDerivedType(tag: DW_TAG_member, name: "Reserved", scope: !795, file: !14, line: 1917, baseType: !76, size: 64, offset: 1280)
!890 = !DIDerivedType(tag: DW_TAG_member, name: "RegisterProtocolNotify", scope: !795, file: !14, line: 1918, baseType: !891, size: 64, offset: 1344)
!891 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_REGISTER_PROTOCOL_NOTIFY", file: !14, line: 1466, baseType: !892)
!892 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !893, size: 64)
!893 = !DISubroutineType(types: !894)
!894 = !{!142, !732, !596, !79}
!895 = !DIDerivedType(tag: DW_TAG_member, name: "LocateHandle", scope: !795, file: !14, line: 1919, baseType: !896, size: 64, offset: 1408)
!896 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_HANDLE", file: !14, line: 1515, baseType: !897)
!897 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !898, size: 64)
!898 = !DISubroutineType(types: !899)
!899 = !{!142, !900, !732, !76, !621, !872}
!900 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_SEARCH_TYPE", file: !14, line: 1489, baseType: !47)
!901 = !DIDerivedType(tag: DW_TAG_member, name: "LocateDevicePath", scope: !795, file: !14, line: 1920, baseType: !902, size: 64, offset: 1472)
!902 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_DEVICE_PATH", file: !14, line: 1541, baseType: !903)
!903 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !904, size: 64)
!904 = !DISubroutineType(types: !905)
!905 = !{!142, !732, !906, !872}
!906 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !907, size: 64)
!907 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !908, size: 64)
!908 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_DEVICE_PATH_PROTOCOL", file: !909, line: 58, baseType: !910)
!909 = !DIFile(filename: "MdePkg/Include/Protocol/DevicePath.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "6b6d593d171f69b933a87911e52d4607")
!910 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_DEVICE_PATH_PROTOCOL", file: !909, line: 43, size: 32, elements: !911)
!911 = !{!912, !913, !914}
!912 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !910, file: !909, line: 44, baseType: !78, size: 8)
!913 = !DIDerivedType(tag: DW_TAG_member, name: "SubType", scope: !910, file: !909, line: 51, baseType: !78, size: 8, offset: 8)
!914 = !DIDerivedType(tag: DW_TAG_member, name: "Length", scope: !910, file: !909, line: 56, baseType: !915, size: 16, offset: 16)
!915 = !DICompositeType(tag: DW_TAG_array_type, baseType: !78, size: 16, elements: !916)
!916 = !{!917}
!917 = !DISubrange(count: 2)
!918 = !DIDerivedType(tag: DW_TAG_member, name: "InstallConfigurationTable", scope: !795, file: !14, line: 1921, baseType: !919, size: 64, offset: 1536)
!919 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_CONFIGURATION_TABLE", file: !14, line: 1562, baseType: !920)
!920 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !921, size: 64)
!921 = !DISubroutineType(types: !922)
!922 = !{!142, !732, !76}
!923 = !DIDerivedType(tag: DW_TAG_member, name: "LoadImage", scope: !795, file: !14, line: 1926, baseType: !924, size: 64, offset: 1600)
!924 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_LOAD", file: !14, line: 913, baseType: !925)
!925 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !926, size: 64)
!926 = !DISubroutineType(types: !927)
!927 = !{!142, !59, !552, !907, !76, !55, !872}
!928 = !DIDerivedType(tag: DW_TAG_member, name: "StartImage", scope: !795, file: !14, line: 1927, baseType: !929, size: 64, offset: 1664)
!929 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_START", file: !14, line: 938, baseType: !930)
!930 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !931, size: 64)
!931 = !DISubroutineType(types: !932)
!932 = !{!142, !552, !621, !933}
!933 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !567, size: 64)
!934 = !DIDerivedType(tag: DW_TAG_member, name: "Exit", scope: !795, file: !14, line: 1928, baseType: !935, size: 64, offset: 1728)
!935 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EXIT", file: !14, line: 966, baseType: !936)
!936 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !937, size: 64)
!937 = !DISubroutineType(types: !938)
!938 = !{!142, !552, !142, !55, !567}
!939 = !DIDerivedType(tag: DW_TAG_member, name: "UnloadImage", scope: !795, file: !14, line: 1929, baseType: !940, size: 64, offset: 1792)
!940 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_UNLOAD", file: !14, line: 984, baseType: !941)
!941 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !942, size: 64)
!942 = !DISubroutineType(types: !943)
!943 = !{!142, !552}
!944 = !DIDerivedType(tag: DW_TAG_member, name: "ExitBootServices", scope: !795, file: !14, line: 1930, baseType: !945, size: 64, offset: 1856)
!945 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EXIT_BOOT_SERVICES", file: !14, line: 1000, baseType: !946)
!946 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !947, size: 64)
!947 = !DISubroutineType(types: !948)
!948 = !{!142, !552, !55}
!949 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextMonotonicCount", scope: !795, file: !14, line: 1935, baseType: !950, size: 64, offset: 1920)
!950 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_MONOTONIC_COUNT", file: !14, line: 1081, baseType: !951)
!951 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !952, size: 64)
!952 = !DISubroutineType(types: !953)
!953 = !{!142, !785}
!954 = !DIDerivedType(tag: DW_TAG_member, name: "Stall", scope: !795, file: !14, line: 1936, baseType: !955, size: 64, offset: 1984)
!955 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_STALL", file: !14, line: 1016, baseType: !956)
!956 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !281, size: 64)
!957 = !DIDerivedType(tag: DW_TAG_member, name: "SetWatchdogTimer", scope: !795, file: !14, line: 1937, baseType: !958, size: 64, offset: 2048)
!958 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_WATCHDOG_TIMER", file: !14, line: 1038, baseType: !959)
!959 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !960, size: 64)
!960 = !DISubroutineType(types: !961)
!961 = !{!142, !55, !57, !55, !567}
!962 = !DIDerivedType(tag: DW_TAG_member, name: "ConnectController", scope: !795, file: !14, line: 1942, baseType: !963, size: 64, offset: 2112)
!963 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONNECT_CONTROLLER", file: !14, line: 361, baseType: !964)
!964 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !965, size: 64)
!965 = !DISubroutineType(types: !966)
!966 = !{!142, !552, !872, !907, !59}
!967 = !DIDerivedType(tag: DW_TAG_member, name: "DisconnectController", scope: !795, file: !14, line: 1943, baseType: !968, size: 64, offset: 2176)
!968 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_DISCONNECT_CONTROLLER", file: !14, line: 394, baseType: !969)
!969 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !970, size: 64)
!970 = !DISubroutineType(types: !971)
!971 = !{!142, !552, !552, !552}
!972 = !DIDerivedType(tag: DW_TAG_member, name: "OpenProtocol", scope: !795, file: !14, line: 1948, baseType: !973, size: 64, offset: 2240)
!973 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL", file: !14, line: 1347, baseType: !974)
!974 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !975, size: 64)
!975 = !DISubroutineType(types: !976)
!976 = !{!142, !552, !732, !79, !552, !552, !99}
!977 = !DIDerivedType(tag: DW_TAG_member, name: "CloseProtocol", scope: !795, file: !14, line: 1949, baseType: !978, size: 64, offset: 2304)
!978 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CLOSE_PROTOCOL", file: !14, line: 1379, baseType: !979)
!979 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !980, size: 64)
!980 = !DISubroutineType(types: !981)
!981 = !{!142, !552, !732, !552, !552}
!982 = !DIDerivedType(tag: DW_TAG_member, name: "OpenProtocolInformation", scope: !795, file: !14, line: 1950, baseType: !983, size: 64, offset: 2368)
!983 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL_INFORMATION", file: !14, line: 1413, baseType: !984)
!984 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !985, size: 64)
!985 = !DISubroutineType(types: !986)
!986 = !{!142, !552, !732, !987, !621}
!987 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !988, size: 64)
!988 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !989, size: 64)
!989 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL_INFORMATION_ENTRY", file: !14, line: 1394, baseType: !990)
!990 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_OPEN_PROTOCOL_INFORMATION_ENTRY", file: !14, line: 1389, size: 192, elements: !991)
!991 = !{!992, !993, !994, !995}
!992 = !DIDerivedType(tag: DW_TAG_member, name: "AgentHandle", scope: !990, file: !14, line: 1390, baseType: !552, size: 64)
!993 = !DIDerivedType(tag: DW_TAG_member, name: "ControllerHandle", scope: !990, file: !14, line: 1391, baseType: !552, size: 64, offset: 64)
!994 = !DIDerivedType(tag: DW_TAG_member, name: "Attributes", scope: !990, file: !14, line: 1392, baseType: !99, size: 32, offset: 128)
!995 = !DIDerivedType(tag: DW_TAG_member, name: "OpenCount", scope: !990, file: !14, line: 1393, baseType: !99, size: 32, offset: 160)
!996 = !DIDerivedType(tag: DW_TAG_member, name: "ProtocolsPerHandle", scope: !795, file: !14, line: 1955, baseType: !997, size: 64, offset: 2432)
!997 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_PROTOCOLS_PER_HANDLE", file: !14, line: 1443, baseType: !998)
!998 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !999, size: 64)
!999 = !DISubroutineType(types: !1000)
!1000 = !{!142, !552, !1001, !621}
!1001 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1002, size: 64)
!1002 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !732, size: 64)
!1003 = !DIDerivedType(tag: DW_TAG_member, name: "LocateHandleBuffer", scope: !795, file: !14, line: 1956, baseType: !1004, size: 64, offset: 2496)
!1004 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_HANDLE_BUFFER", file: !14, line: 1588, baseType: !1005)
!1005 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1006, size: 64)
!1006 = !DISubroutineType(types: !1007)
!1007 = !{!142, !900, !732, !76, !621, !1008}
!1008 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !872, size: 64)
!1009 = !DIDerivedType(tag: DW_TAG_member, name: "LocateProtocol", scope: !795, file: !14, line: 1957, baseType: !1010, size: 64, offset: 2560)
!1010 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_PROTOCOL", file: !14, line: 1615, baseType: !1011)
!1011 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1012, size: 64)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{!142, !732, !76, !79}
!1014 = !DIDerivedType(tag: DW_TAG_member, name: "InstallMultipleProtocolInterfaces", scope: !795, file: !14, line: 1958, baseType: !1015, size: 64, offset: 2624)
!1015 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_MULTIPLE_PROTOCOL_INTERFACES", file: !14, line: 1213, baseType: !1016)
!1016 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1017, size: 64)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{!142, !872, null}
!1019 = !DIDerivedType(tag: DW_TAG_member, name: "UninstallMultipleProtocolInterfaces", scope: !795, file: !14, line: 1959, baseType: !1020, size: 64, offset: 2688)
!1020 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UNINSTALL_MULTIPLE_PROTOCOL_INTERFACES", file: !14, line: 1283, baseType: !1021)
!1021 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1022, size: 64)
!1022 = !DISubroutineType(types: !1023)
!1023 = !{!142, !552, null}
!1024 = !DIDerivedType(tag: DW_TAG_member, name: "CalculateCrc32", scope: !795, file: !14, line: 1964, baseType: !1025, size: 64, offset: 2752)
!1025 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CALCULATE_CRC32", file: !14, line: 1118, baseType: !1026)
!1026 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1027, size: 64)
!1027 = !DISubroutineType(types: !1028)
!1028 = !{!142, !76, !55, !744}
!1029 = !DIDerivedType(tag: DW_TAG_member, name: "CopyMem", scope: !795, file: !14, line: 1969, baseType: !1030, size: 64, offset: 2816)
!1030 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_COPY_MEM", file: !14, line: 1134, baseType: !1031)
!1031 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1032, size: 64)
!1032 = !DISubroutineType(types: !1033)
!1033 = !{null, !76, !76, !55}
!1034 = !DIDerivedType(tag: DW_TAG_member, name: "SetMem", scope: !795, file: !14, line: 1970, baseType: !1035, size: 64, offset: 2880)
!1035 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_MEM", file: !14, line: 1150, baseType: !1036)
!1036 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1037, size: 64)
!1037 = !DISubroutineType(types: !1038)
!1038 = !{null, !76, !55, !78}
!1039 = !DIDerivedType(tag: DW_TAG_member, name: "CreateEventEx", scope: !795, file: !14, line: 1971, baseType: !1040, size: 64, offset: 2944)
!1040 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CREATE_EVENT_EX", file: !14, line: 509, baseType: !1041)
!1041 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1042, size: 64)
!1042 = !DISubroutineType(types: !1043)
!1043 = !{!142, !99, !803, !842, !1044, !1046, !846}
!1044 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1045, size: 64)
!1045 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!1046 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1047, size: 64)
!1047 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !733)
!1048 = !DIDerivedType(tag: DW_TAG_member, name: "NumberOfTableEntries", scope: !555, file: !14, line: 2047, baseType: !55, size: 64, offset: 832)
!1049 = !DIDerivedType(tag: DW_TAG_member, name: "ConfigurationTable", scope: !555, file: !14, line: 2052, baseType: !1050, size: 64, offset: 896)
!1050 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1051, size: 64)
!1051 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONFIGURATION_TABLE", file: !14, line: 1987, baseType: !1052)
!1052 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_CONFIGURATION_TABLE", file: !14, line: 1978, size: 192, elements: !1053)
!1053 = !{!1054, !1055}
!1054 = !DIDerivedType(tag: DW_TAG_member, name: "VendorGuid", scope: !1052, file: !14, line: 1982, baseType: !733, size: 128)
!1055 = !DIDerivedType(tag: DW_TAG_member, name: "VendorTable", scope: !1052, file: !14, line: 1986, baseType: !76, size: 64, offset: 128)
!1056 = !DILocalVariable(name: "ImageHandle", arg: 1, scope: !549, file: !94, line: 203, type: !552)
!1057 = !DILocation(line: 203, scope: !549)
!1058 = !DILocalVariable(name: "SystemTable", arg: 2, scope: !549, file: !94, line: 204, type: !553)
!1059 = !DILocation(line: 204, scope: !549)
!1060 = !DILocalVariable(name: "Status", scope: !549, file: !94, line: 207, type: !142)
!1061 = !DILocation(line: 207, scope: !549)
!1062 = !DILocalVariable(name: "HandleProtoc", scope: !549, file: !94, line: 208, type: !552)
!1063 = !DILocation(line: 208, scope: !549)
!1064 = !DILocalVariable(name: "HandleNotify", scope: !549, file: !94, line: 209, type: !552)
!1065 = !DILocation(line: 209, scope: !549)
!1066 = !DILocalVariable(name: "mHeapManager", scope: !549, file: !94, line: 210, type: !1067)
!1067 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1068, size: 64)
!1068 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_PROTOCOL", file: !66, line: 118, baseType: !1069)
!1069 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_HEAP_MANAGER_PROTOCOL", file: !66, line: 108, size: 576, elements: !1070)
!1070 = !{!1071, !1074, !1077, !1080, !1085, !1087, !1089, !1092, !1094}
!1071 = !DIDerivedType(tag: DW_TAG_member, name: "GetBlockSize", scope: !1069, file: !66, line: 109, baseType: !1072, size: 64)
!1072 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_GET_BLOCK_SIZE", file: !66, line: 63, baseType: !1073)
!1073 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !140, size: 64)
!1074 = !DIDerivedType(tag: DW_TAG_member, name: "AllocateChunk", scope: !1069, file: !66, line: 110, baseType: !1075, size: 64, offset: 64)
!1075 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_ALLOCATE_CHUNK", file: !66, line: 70, baseType: !1076)
!1076 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64)
!1077 = !DIDerivedType(tag: DW_TAG_member, name: "FreeChunk", scope: !1069, file: !66, line: 111, baseType: !1078, size: 64, offset: 128)
!1078 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_FREE_CHUNK", file: !66, line: 77, baseType: !1079)
!1079 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !214, size: 64)
!1080 = !DIDerivedType(tag: DW_TAG_member, name: "FreeAllocList", scope: !1069, file: !66, line: 112, baseType: !1081, size: 64, offset: 192)
!1081 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_FREE_ALLOC_LIST", file: !66, line: 83, baseType: !1082)
!1082 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1083, size: 64)
!1083 = !DISubroutineType(types: !1084)
!1084 = !{!142, null}
!1085 = !DIDerivedType(tag: DW_TAG_member, name: "DisplayFreeList", scope: !1069, file: !66, line: 113, baseType: !1086, size: 64, offset: 256)
!1086 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_DISPLAY_FREE_LIST", file: !66, line: 87, baseType: !1082)
!1087 = !DIDerivedType(tag: DW_TAG_member, name: "DisplayHeapMetadata", scope: !1069, file: !66, line: 114, baseType: !1088, size: 64, offset: 320)
!1088 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_DISPLAY_HEAP_METADATA", file: !66, line: 91, baseType: !1082)
!1089 = !DIDerivedType(tag: DW_TAG_member, name: "InitializePage", scope: !1069, file: !66, line: 115, baseType: !1090, size: 64, offset: 384)
!1090 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_PAGE", file: !66, line: 95, baseType: !1091)
!1091 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !454, size: 64)
!1092 = !DIDerivedType(tag: DW_TAG_member, name: "InitializeHeapMetadata", scope: !1069, file: !66, line: 116, baseType: !1093, size: 64, offset: 448)
!1093 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_HEAP_METADATA", file: !66, line: 102, baseType: !1082)
!1094 = !DIDerivedType(tag: DW_TAG_member, name: "InitializeHeap", scope: !1069, file: !66, line: 117, baseType: !1095, size: 64, offset: 512)
!1095 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_HEAP", file: !66, line: 106, baseType: !1082)
!1096 = !DILocation(line: 210, scope: !549)
!1097 = !DILocalVariable(name: "ProtocolSize", scope: !549, file: !94, line: 211, type: !55)
!1098 = !DILocation(line: 211, scope: !549)
!1099 = !DILocation(line: 216, scope: !549)
!1100 = !DILocation(line: 221, scope: !549)
!1101 = !DILocation(line: 222, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1103, file: !94, line: 221)
!1103 = distinct !DILexicalBlock(scope: !549, file: !94, line: 221)
!1104 = !DILocation(line: 228, scope: !549)
!1105 = !DILocation(line: 229, scope: !549)
!1106 = !DILocation(line: 230, scope: !549)
!1107 = !DILocation(line: 231, scope: !549)
!1108 = !DILocation(line: 232, scope: !549)
!1109 = !DILocation(line: 233, scope: !549)
!1110 = !DILocation(line: 234, scope: !549)
!1111 = !DILocation(line: 235, scope: !549)
!1112 = !DILocation(line: 236, scope: !549)
!1113 = !DILocation(line: 241, scope: !549)
!1114 = !DILocation(line: 247, scope: !549)
!1115 = !DILocation(line: 248, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1117, file: !94, line: 247)
!1117 = distinct !DILexicalBlock(scope: !549, file: !94, line: 247)
!1118 = !DILocation(line: 251, scope: !549)
!1119 = !DILocation(line: 252, scope: !549)
!1120 = !DILocation(line: 258, scope: !549)
!1121 = !DILocation(line: 259, scope: !1122)
!1122 = distinct !DILexicalBlock(scope: !1123, file: !94, line: 258)
!1123 = distinct !DILexicalBlock(scope: !549, file: !94, line: 258)
!1124 = !DILocation(line: 262, scope: !549)
!1125 = !DILocation(line: 263, scope: !549)

^0 = module: (path: "./HeapManager.bc", hash: (0, 0, 0, 0, 0))
^1 = gv: (name: ".str.17", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 141040196425922864
^2 = gv: (name: "FreeAllocList", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 35, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^33)), refs: (^22)))) ; guid = 394767403519461630
^3 = gv: (name: "DebugPrint") ; guid = 478242322684871111
^4 = gv: (name: "Heap", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 1410362099990425173
^5 = gv: (name: ".str.6", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 3243746044686683540
^6 = gv: (name: "InitializePage", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 41, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^40), (callee: ^31), (callee: ^16), (callee: ^3)), refs: (^24)))) ; guid = 3839274994811824158
^7 = gv: (name: ".str.13", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 4898081547979299713
^8 = gv: (name: ".str.12", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 5180664476913028248
^9 = gv: (name: ".str.4", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 5616862481351956325
^10 = gv: (name: "gSmst") ; guid = 6336347229606852196
^11 = gv: (name: "InitializeHeap", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 89, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^31), (callee: ^16), (callee: ^3), (callee: ^6)), refs: (^1, ^38, ^4)))) ; guid = 6341636451930749015
^12 = gv: (name: "AllocateChunk", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 86, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^31), (callee: ^16), (callee: ^3)), refs: (^4, ^15, ^22, ^35)))) ; guid = 7678099193032758281
^13 = gv: (name: "InitializeHeapMetadata", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 38, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^31), (callee: ^16), (callee: ^3)), refs: (^14, ^22)))) ; guid = 8161855654290772892
^14 = gv: (name: ".str.16", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 8490326437529512423
^15 = gv: (name: ".str", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 9657821728405362758
^16 = gv: (name: "DebugPrintLevelEnabled") ; guid = 10095421576718565903
^17 = gv: (name: ".str.3", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 11057645615347473022
^18 = gv: (name: "HeapManagerEntryPoint", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 83, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 1, mustBeUnreachable: 0), refs: (^10, ^37, ^12, ^33, ^2, ^20, ^30, ^6, ^13, ^11, ^19, ^23, ^25)))) ; guid = 11190844650327418707
^19 = gv: (name: "gEfiHeapManagerProtocolGuid") ; guid = 11449330682667165830
^20 = gv: (name: "DisplayFreeList", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 95, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^31), (callee: ^16), (callee: ^3)), refs: (^9, ^4, ^34, ^38, ^5, ^21)))) ; guid = 11517836955775969220
^21 = gv: (name: ".str.7", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 11610824857088539702
^22 = gv: (name: "HeapMd", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 11690222212050619538
^23 = gv: (name: "mHeapManagerReady", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 11973168439334706683
^24 = gv: (name: ".str.15", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 12283081360225698677
^25 = gv: (name: "gEfiHeapManagerReadyProtocolGuid") ; guid = 13373684940576142575
^26 = gv: (name: "llvm.dbg.declare") ; guid = 13513223491971101989
^27 = gv: (name: ".str.14", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 14816405178521703237
^28 = gv: (name: ".str.8", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 14931984042415843656
^29 = gv: (name: ".str.11", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 15193019921558517229
^30 = gv: (name: "DisplayHeapMetadata", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 141, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^31), (callee: ^16), (callee: ^3)), refs: (^28, ^39, ^36, ^22, ^38, ^29, ^8, ^7, ^27)))) ; guid = 15632894110962014274
^31 = gv: (name: "DebugPrintEnabled") ; guid = 15723647242063003913
^32 = gv: (name: ".str.2", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 15944873893444278873
^33 = gv: (name: "FreeChunk", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 82, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^31), (callee: ^16), (callee: ^3)), refs: (^22, ^32, ^4, ^38, ^17)))) ; guid = 16434329687795456382
^34 = gv: (name: ".str.5", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 16517687220976621596
^35 = gv: (name: ".str.1", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 16526136657999018443
^36 = gv: (name: ".str.10", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 16697252304878820671
^37 = gv: (name: "GetBlockSize", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 26, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0)))) ; guid = 17346048734911914632
^38 = gv: (name: "BlockSizes", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 17937231987077690294
^39 = gv: (name: ".str.9", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 18219188214314821319
^40 = gv: (name: "AllocateAlignedPages") ; guid = 18287436239200348807
^41 = flags: 8
^42 = blockcount: 233
