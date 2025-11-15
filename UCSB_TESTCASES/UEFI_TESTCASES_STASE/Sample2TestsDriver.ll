; ModuleID = './Sample2TestsDriver.bc'
source_filename = "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases/Testcases/Sample2Tests/Sample2TestsDriver/Sample2TestsDriver.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-windows-gnu"

%struct._HEAP_MANAGER_PROTOCOL = type { i64 (i64, i64*)*, i64 (i64, %struct.CHUNK**)*, i64 (i64)*, i64 (...)*, i64 (...)*, i64 (...)*, i64 (i64, %struct.PAGE**)*, i64 (...)*, i64 (...)* }
%struct.CHUNK = type { %struct.CHUNK* }
%struct.PAGE = type { %struct.CHUNK* }
%struct._CHAR_CONVERTER_PROTOCOL = type { i64 (i8*, i8*, %struct.ICONV_T**)*, i64 (%struct.ICONV_T*, i8*, i64, i8**, i64*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)* }
%struct.ICONV_T = type { i8*, i8* }
%struct._EFI_SMM_SYSTEM_TABLE2 = type { %struct.EFI_TABLE_HEADER, i16*, i32, i64 (%struct._EFI_SMM_SYSTEM_TABLE2*, %struct.GUID*, i8*, i64)*, %struct._EFI_MM_CPU_IO_PROTOCOL, i64 (i32, i64, i8**)*, i64 (i8*)*, i64 (i32, i32, i64, i64*)*, i64 (i64, i64)*, i64 (void (i8*)*, i64, i8*)*, i64, i64, i64*, i8**, i64, %struct.EFI_CONFIGURATION_TABLE*, i64 (i8**, %struct.GUID*, i32, i8*)*, i64 (i8*, %struct.GUID*, i8*)*, i64 (i8*, %struct.GUID*, i8**)*, i64 (%struct.GUID*, i64 (%struct.GUID*, i8*, i8*)*, i8**)*, i64 (i32, %struct.GUID*, i8*, i64*, i8**)*, i64 (%struct.GUID*, i8*, i8**)*, i64 (%struct.GUID*, i8*, i8*, i64*)*, i64 (i64 (i8*, i8*, i8*, i64*)*, %struct.GUID*, i8**)*, i64 (i8*)* }
%struct.EFI_TABLE_HEADER = type { i64, i32, i32, i32, i32 }
%struct.GUID = type { i32, i16, i16, [8 x i8] }
%struct._EFI_MM_CPU_IO_PROTOCOL = type { %struct.EFI_MM_IO_ACCESS, %struct.EFI_MM_IO_ACCESS }
%struct.EFI_MM_IO_ACCESS = type { i64 (%struct._EFI_MM_CPU_IO_PROTOCOL*, i32, i64, i64, i8*)*, i64 (%struct._EFI_MM_CPU_IO_PROTOCOL*, i32, i64, i64, i8*)* }
%struct.EFI_CONFIGURATION_TABLE = type { %struct.GUID, i8* }
%struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER = type { %struct.GUID, i32, i32, [1024 x i8] }
%struct.CHAR_CONVERTER_DATA = type { i64, [512 x i8] }
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

@mHeapManager = dso_local global %struct._HEAP_MANAGER_PROTOCOL* null, align 8, !dbg !0
@mCharConverter = dso_local global %struct._CHAR_CONVERTER_PROTOCOL* null, align 8, !dbg !118
@.str = private unnamed_addr constant [7 x i16] [i16 72, i16 101, i16 108, i16 108, i16 111, i16 0, i16 0], align 2
@w_msg = dso_local global i16* getelementptr inbounds ([7 x i16], [7 x i16]* @.str, i32 0, i32 0), align 8, !dbg !209
@.str.1 = private unnamed_addr constant [7 x i8] c"pwned\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c" - this Sample has a WMP.\0A\00", align 1
@.str.4 = private unnamed_addr constant [92 x i8] c"Here's a couple addresses - just cuz: \0A\09Winning Msg function (%p)\0A\09A function pointer (%p)\0A\00", align 1
@funcptr = dso_local global void (...)* null, align 8, !dbg !213
@.str.5 = private unnamed_addr constant [17 x i8] c"INVALID Input!!\0A\00", align 1
@gSmst = external global %struct._EFI_SMM_SYSTEM_TABLE2*, align 8
@gEfiHeapManagerProtocolGuid = external global %struct.GUID, align 4
@.str.6 = private unnamed_addr constant [58 x i8] c"%a: Failed to locate ProcessFirmwareProtocol. Status: %r\0A\00", align 1
@__func__.HeapManagerReadyCallback = private unnamed_addr constant [25 x i8] c"HeapManagerReadyCallback\00", align 1
@.str.7 = private unnamed_addr constant [26 x i8] c"HeapManagerReadyCallback\0A\00", align 1
@gEfiCharConverterProtocolGuid = external global %struct.GUID, align 4
@__func__.CharConverterReadyCallback = private unnamed_addr constant [27 x i8] c"CharConverterReadyCallback\00", align 1
@.str.8 = private unnamed_addr constant [28 x i8] c"CharConverterReadyCallback\0A\00", align 1
@gEfiHeapManagerReadyProtocolGuid = external global %struct.GUID, align 4
@.str.9 = private unnamed_addr constant [40 x i8] c"%a: Could not register protocol notify\0A\00", align 1
@__func__.Sample2TestsDriverEntryPoint = private unnamed_addr constant [29 x i8] c"Sample2TestsDriverEntryPoint\00", align 1
@gEfiCharConverterReadyProtocolGuid = external global %struct.GUID, align 4
@gEfiSample2TestsDriverCommGuid = external global %struct.GUID, align 4
@.str.10 = private unnamed_addr constant [62 x i8] c"%a: Failed to register Sample2TestsDriverHandler. Status: %r\0A\00", align 1

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local void @winning_msg() #0 !dbg !227 {
  br label %1, !dbg !231

1:                                                ; preds = %0
  %2 = call i8 @DebugPrintEnabled() #3, !dbg !232
  %3 = icmp ne i8 %2, 0, !dbg !232
  br i1 %3, label %4, label %11, !dbg !232

4:                                                ; preds = %1
  br label %5, !dbg !234

5:                                                ; preds = %4
  %6 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !237
  %7 = icmp ne i8 %6, 0, !dbg !237
  br i1 %7, label %8, label %9, !dbg !237

8:                                                ; preds = %5
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #3, !dbg !239
  br label %9, !dbg !239

9:                                                ; preds = %8, %5
  br label %10, !dbg !237

10:                                               ; preds = %9
  br label %11, !dbg !234

11:                                               ; preds = %10, %1
  br label %12, !dbg !232

12:                                               ; preds = %11
  ret void, !dbg !242
}

; Function Attrs: noimplicitfloat noredzone
declare dso_local i8 @DebugPrintEnabled() #1

; Function Attrs: noimplicitfloat noredzone
declare dso_local i8 @DebugPrintLevelEnabled(i64 noundef) #1

; Function Attrs: noimplicitfloat noredzone
declare dso_local void @DebugPrint(i64 noundef, i8* noundef, ...) #1

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local void @welcome_msg() #0 !dbg !243 {
  br label %1, !dbg !244

1:                                                ; preds = %0
  %2 = call i8 @DebugPrintEnabled() #3, !dbg !245
  %3 = icmp ne i8 %2, 0, !dbg !245
  br i1 %3, label %4, label %12, !dbg !245

4:                                                ; preds = %1
  br label %5, !dbg !247

5:                                                ; preds = %4
  %6 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !250
  %7 = icmp ne i8 %6, 0, !dbg !250
  br i1 %7, label %8, label %10, !dbg !250

8:                                                ; preds = %5
  %9 = load i16*, i16** @w_msg, align 8, !dbg !252
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i16* noundef %9) #3, !dbg !252
  br label %10, !dbg !252

10:                                               ; preds = %8, %5
  br label %11, !dbg !250

11:                                               ; preds = %10
  br label %12, !dbg !247

12:                                               ; preds = %11, %1
  br label %13, !dbg !245

13:                                               ; preds = %12
  br label %14, !dbg !255

14:                                               ; preds = %13
  %15 = call i8 @DebugPrintEnabled() #3, !dbg !256
  %16 = icmp ne i8 %15, 0, !dbg !256
  br i1 %16, label %17, label %24, !dbg !256

17:                                               ; preds = %14
  br label %18, !dbg !258

18:                                               ; preds = %17
  %19 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !261
  %20 = icmp ne i8 %19, 0, !dbg !261
  br i1 %20, label %21, label %22, !dbg !261

21:                                               ; preds = %18
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0)) #3, !dbg !263
  br label %22, !dbg !263

22:                                               ; preds = %21, %18
  br label %23, !dbg !261

23:                                               ; preds = %22
  br label %24, !dbg !258

24:                                               ; preds = %23, %14
  br label %25, !dbg !256

25:                                               ; preds = %24
  br label %26, !dbg !266

26:                                               ; preds = %25
  %27 = call i8 @DebugPrintEnabled() #3, !dbg !267
  %28 = icmp ne i8 %27, 0, !dbg !267
  br i1 %28, label %29, label %36, !dbg !267

29:                                               ; preds = %26
  br label %30, !dbg !269

30:                                               ; preds = %29
  %31 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !272
  %32 = icmp ne i8 %31, 0, !dbg !272
  br i1 %32, label %33, label %34, !dbg !272

33:                                               ; preds = %30
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([92 x i8], [92 x i8]* @.str.4, i64 0, i64 0), void (...)* noundef bitcast (void ()* @winning_msg to void (...)*), void (...)** noundef @funcptr) #3, !dbg !274
  br label %34, !dbg !274

34:                                               ; preds = %33, %30
  br label %35, !dbg !272

35:                                               ; preds = %34
  br label %36, !dbg !269

36:                                               ; preds = %35, %26
  br label %37, !dbg !267

37:                                               ; preds = %36
  ret void, !dbg !277
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @convert(%struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** noundef %0) #0 !dbg !278 {
  %2 = alloca %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER**, align 8
  %3 = alloca i64, align 8
  %4 = alloca %struct.CHAR_CONVERTER_DATA*, align 8
  store %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %0, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*** %2, align 8
  call void @llvm.dbg.declare(metadata %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*** %2, metadata !282, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.declare(metadata i64* %3, metadata !284, metadata !DIExpression()), !dbg !285
  store i64 0, i64* %3, align 8, !dbg !285
  call void @llvm.dbg.declare(metadata %struct.CHAR_CONVERTER_DATA** %4, metadata !286, metadata !DIExpression()), !dbg !287
  %5 = load %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER**, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*** %2, align 8, !dbg !287
  %6 = load %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %5, align 8, !dbg !287
  %7 = getelementptr inbounds %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER* %6, i32 0, i32 3, !dbg !287
  %8 = getelementptr inbounds [1024 x i8], [1024 x i8]* %7, i64 0, i64 0, !dbg !287
  %9 = bitcast i8* %8 to %struct.CHAR_CONVERTER_DATA*, !dbg !287
  store %struct.CHAR_CONVERTER_DATA* %9, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !287
  %10 = load %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER**, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*** %2, align 8, !dbg !288
  %11 = load %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %10, align 8, !dbg !288
  %12 = getelementptr inbounds %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER* %11, i32 0, i32 2, !dbg !288
  %13 = load i32, i32* %12, align 4, !dbg !288
  switch i32 %13, label %47 [
    i32 0, label %14
    i32 1, label %25
    i32 2, label %36
  ], !dbg !288

14:                                               ; preds = %1
  %15 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** @mCharConverter, align 8, !dbg !289
  %16 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %15, i32 0, i32 2, !dbg !289
  %17 = load i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)** %16, align 8, !dbg !289
  %18 = load %struct.CHAR_CONVERTER_DATA*, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !289
  %19 = getelementptr inbounds %struct.CHAR_CONVERTER_DATA, %struct.CHAR_CONVERTER_DATA* %18, i32 0, i32 1, !dbg !289
  %20 = getelementptr inbounds [512 x i8], [512 x i8]* %19, i64 0, i64 0, !dbg !289
  %21 = load %struct.CHAR_CONVERTER_DATA*, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !289
  %22 = getelementptr inbounds %struct.CHAR_CONVERTER_DATA, %struct.CHAR_CONVERTER_DATA* %21, i32 0, i32 0, !dbg !289
  %23 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !289
  %24 = call i64 %17(i8* noundef %20, i64* noundef %22, %struct._HEAP_MANAGER_PROTOCOL* noundef %23) #3, !dbg !289
  store i64 %24, i64* %3, align 8, !dbg !289
  br label %60, !dbg !291

25:                                               ; preds = %1
  %26 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** @mCharConverter, align 8, !dbg !292
  %27 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %26, i32 0, i32 3, !dbg !292
  %28 = load i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)** %27, align 8, !dbg !292
  %29 = load %struct.CHAR_CONVERTER_DATA*, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !292
  %30 = getelementptr inbounds %struct.CHAR_CONVERTER_DATA, %struct.CHAR_CONVERTER_DATA* %29, i32 0, i32 1, !dbg !292
  %31 = getelementptr inbounds [512 x i8], [512 x i8]* %30, i64 0, i64 0, !dbg !292
  %32 = load %struct.CHAR_CONVERTER_DATA*, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !292
  %33 = getelementptr inbounds %struct.CHAR_CONVERTER_DATA, %struct.CHAR_CONVERTER_DATA* %32, i32 0, i32 0, !dbg !292
  %34 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !292
  %35 = call i64 %28(i8* noundef %31, i64* noundef %33, %struct._HEAP_MANAGER_PROTOCOL* noundef %34) #3, !dbg !292
  store i64 %35, i64* %3, align 8, !dbg !292
  br label %60, !dbg !293

36:                                               ; preds = %1
  %37 = load %struct._CHAR_CONVERTER_PROTOCOL*, %struct._CHAR_CONVERTER_PROTOCOL** @mCharConverter, align 8, !dbg !294
  %38 = getelementptr inbounds %struct._CHAR_CONVERTER_PROTOCOL, %struct._CHAR_CONVERTER_PROTOCOL* %37, i32 0, i32 4, !dbg !294
  %39 = load i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)*, i64 (i8*, i64*, %struct._HEAP_MANAGER_PROTOCOL*)** %38, align 8, !dbg !294
  %40 = load %struct.CHAR_CONVERTER_DATA*, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !294
  %41 = getelementptr inbounds %struct.CHAR_CONVERTER_DATA, %struct.CHAR_CONVERTER_DATA* %40, i32 0, i32 1, !dbg !294
  %42 = getelementptr inbounds [512 x i8], [512 x i8]* %41, i64 0, i64 0, !dbg !294
  %43 = load %struct.CHAR_CONVERTER_DATA*, %struct.CHAR_CONVERTER_DATA** %4, align 8, !dbg !294
  %44 = getelementptr inbounds %struct.CHAR_CONVERTER_DATA, %struct.CHAR_CONVERTER_DATA* %43, i32 0, i32 0, !dbg !294
  %45 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !294
  %46 = call i64 %39(i8* noundef %42, i64* noundef %44, %struct._HEAP_MANAGER_PROTOCOL* noundef %45) #3, !dbg !294
  store i64 %46, i64* %3, align 8, !dbg !294
  br label %60, !dbg !295

47:                                               ; preds = %1
  br label %48, !dbg !296

48:                                               ; preds = %47
  %49 = call i8 @DebugPrintEnabled() #3, !dbg !297
  %50 = icmp ne i8 %49, 0, !dbg !297
  br i1 %50, label %51, label %58, !dbg !297

51:                                               ; preds = %48
  br label %52, !dbg !299

52:                                               ; preds = %51
  %53 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !302
  %54 = icmp ne i8 %53, 0, !dbg !302
  br i1 %54, label %55, label %56, !dbg !302

55:                                               ; preds = %52
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)) #3, !dbg !304
  br label %56, !dbg !304

56:                                               ; preds = %55, %52
  br label %57, !dbg !302

57:                                               ; preds = %56
  br label %58, !dbg !299

58:                                               ; preds = %57, %48
  br label %59, !dbg !297

59:                                               ; preds = %58
  store i64 -9223372036854775806, i64* %3, align 8, !dbg !307
  br label %60, !dbg !308

60:                                               ; preds = %59, %36, %25, %14
  %61 = load i64, i64* %3, align 8, !dbg !309
  ret i64 %61, !dbg !309
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @Sample2TestsDriverHandler(i8* noundef %0, i8* noundef %1, i8* noundef %2, i64* noundef %3) #0 !dbg !310 {
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64*, align 8
  %10 = alloca i64, align 8
  %11 = alloca %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*, align 8
  store i8* %0, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !317, metadata !DIExpression()), !dbg !318
  store i8* %1, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !319, metadata !DIExpression()), !dbg !320
  store i8* %2, i8** %8, align 8
  call void @llvm.dbg.declare(metadata i8** %8, metadata !321, metadata !DIExpression()), !dbg !322
  store i64* %3, i64** %9, align 8
  call void @llvm.dbg.declare(metadata i64** %9, metadata !323, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.declare(metadata i64* %10, metadata !325, metadata !DIExpression()), !dbg !326
  call void @llvm.dbg.declare(metadata %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %11, metadata !327, metadata !DIExpression()), !dbg !328
  %12 = load i8*, i8** %8, align 8, !dbg !329
  %13 = icmp eq i8* %12, null, !dbg !329
  br i1 %13, label %17, label %14, !dbg !329

14:                                               ; preds = %4
  %15 = load i64*, i64** %9, align 8, !dbg !329
  %16 = icmp eq i64* %15, null, !dbg !329
  br i1 %16, label %17, label %18, !dbg !329

17:                                               ; preds = %14, %4
  store i64 -9223372036854775806, i64* %5, align 8, !dbg !330
  br label %59, !dbg !330

18:                                               ; preds = %14
  %19 = load i8*, i8** %8, align 8, !dbg !333
  %20 = bitcast i8* %19 to %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*, !dbg !333
  store %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER* %20, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %11, align 8, !dbg !333
  %21 = load %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %11, align 8, !dbg !334
  %22 = getelementptr inbounds %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER* %21, i32 0, i32 1, !dbg !334
  %23 = load i32, i32* %22, align 4, !dbg !334
  switch i32 %23, label %57 [
    i32 0, label %24
    i32 1, label %26
    i32 2, label %32
    i32 3, label %48
    i32 4, label %54
  ], !dbg !334

24:                                               ; preds = %18
  %25 = call i64 @convert(%struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** noundef %11) #3, !dbg !335
  br label %58, !dbg !337

26:                                               ; preds = %18
  %27 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !338
  %28 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %27, i32 0, i32 3, !dbg !338
  %29 = load i64 (...)*, i64 (...)** %28, align 8, !dbg !338
  %30 = bitcast i64 (...)* %29 to i64 ()*, !dbg !338
  %31 = call i64 %30() #3, !dbg !338
  br label %58, !dbg !339

32:                                               ; preds = %18
  %33 = load %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER*, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER** %11, align 8, !dbg !340
  %34 = getelementptr inbounds %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER, %struct.SAMPLE2_TESTS_DRIVER_COMM_BUFFER* %33, i32 0, i32 3, !dbg !340
  %35 = getelementptr inbounds [1024 x i8], [1024 x i8]* %34, i64 0, i64 0, !dbg !340
  %36 = load i8, i8* %35, align 4, !dbg !340
  %37 = zext i8 %36 to i64, !dbg !340
  store i64 %37, i64* %10, align 8, !dbg !340
  %38 = load i64, i64* %10, align 8, !dbg !341
  %39 = icmp eq i64 %38, 0, !dbg !341
  br i1 %39, label %40, label %41, !dbg !341

40:                                               ; preds = %32
  store i64 1, i64* %10, align 8, !dbg !342
  br label %41, !dbg !345

41:                                               ; preds = %40, %32
  %42 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !346
  %43 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %42, i32 0, i32 4, !dbg !346
  %44 = load i64 (...)*, i64 (...)** %43, align 8, !dbg !346
  %45 = load i64, i64* %10, align 8, !dbg !346
  %46 = bitcast i64 (...)* %44 to i64 (i64)*, !dbg !346
  %47 = call i64 %46(i64 noundef %45) #3, !dbg !346
  br label %58, !dbg !347

48:                                               ; preds = %18
  %49 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !348
  %50 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %49, i32 0, i32 5, !dbg !348
  %51 = load i64 (...)*, i64 (...)** %50, align 8, !dbg !348
  %52 = bitcast i64 (...)* %51 to i64 ()*, !dbg !348
  %53 = call i64 %52() #3, !dbg !348
  br label %58, !dbg !349

54:                                               ; preds = %18
  %55 = load void (...)*, void (...)** @funcptr, align 8, !dbg !350
  %56 = bitcast void (...)* %55 to void ()*, !dbg !350
  call void %56() #3, !dbg !350
  br label %58, !dbg !351

57:                                               ; preds = %18
  br label %58, !dbg !352

58:                                               ; preds = %57, %54, %48, %41, %26, %24
  store i64 0, i64* %5, align 8, !dbg !353
  br label %59, !dbg !353

59:                                               ; preds = %58, %17
  %60 = load i64, i64* %5, align 8, !dbg !354
  ret i64 %60, !dbg !354
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @HeapManagerReadyCallback(%struct.GUID* noundef %0, i8* noundef %1, i8* noundef %2) #0 !dbg !355 {
  %4 = alloca i64, align 8
  %5 = alloca %struct.GUID*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  store %struct.GUID* %0, %struct.GUID** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.GUID** %5, metadata !360, metadata !DIExpression()), !dbg !361
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !362, metadata !DIExpression()), !dbg !363
  store i8* %2, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !364, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.declare(metadata i64* %8, metadata !366, metadata !DIExpression()), !dbg !367
  %9 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !368
  %10 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %9, i32 0, i32 21, !dbg !368
  %11 = load i64 (%struct.GUID*, i8*, i8**)*, i64 (%struct.GUID*, i8*, i8**)** %10, align 8, !dbg !368
  %12 = call i64 %11(%struct.GUID* noundef @gEfiHeapManagerProtocolGuid, i8* noundef null, i8** noundef bitcast (%struct._HEAP_MANAGER_PROTOCOL** @mHeapManager to i8**)) #3, !dbg !368
  store i64 %12, i64* %8, align 8, !dbg !368
  %13 = load i64, i64* %8, align 8, !dbg !369
  %14 = icmp slt i64 %13, 0, !dbg !369
  br i1 %14, label %15, label %30, !dbg !369

15:                                               ; preds = %3
  br label %16, !dbg !370

16:                                               ; preds = %15
  %17 = call i8 @DebugPrintEnabled() #3, !dbg !373
  %18 = icmp ne i8 %17, 0, !dbg !373
  br i1 %18, label %19, label %27, !dbg !373

19:                                               ; preds = %16
  br label %20, !dbg !375

20:                                               ; preds = %19
  %21 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !378
  %22 = icmp ne i8 %21, 0, !dbg !378
  br i1 %22, label %23, label %25, !dbg !378

23:                                               ; preds = %20
  %24 = load i64, i64* %8, align 8, !dbg !380
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([58 x i8], [58 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @__func__.HeapManagerReadyCallback, i64 0, i64 0), i64 noundef %24) #3, !dbg !380
  br label %25, !dbg !380

25:                                               ; preds = %23, %20
  br label %26, !dbg !378

26:                                               ; preds = %25
  br label %27, !dbg !375

27:                                               ; preds = %26, %16
  br label %28, !dbg !373

28:                                               ; preds = %27
  %29 = load i64, i64* %8, align 8, !dbg !383
  store i64 %29, i64* %4, align 8, !dbg !383
  br label %53, !dbg !383

30:                                               ; preds = %3
  br label %31, !dbg !384

31:                                               ; preds = %30
  %32 = call i8 @DebugPrintEnabled() #3, !dbg !385
  %33 = icmp ne i8 %32, 0, !dbg !385
  br i1 %33, label %34, label %41, !dbg !385

34:                                               ; preds = %31
  br label %35, !dbg !387

35:                                               ; preds = %34
  %36 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !390
  %37 = icmp ne i8 %36, 0, !dbg !390
  br i1 %37, label %38, label %39, !dbg !390

38:                                               ; preds = %35
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.7, i64 0, i64 0)) #3, !dbg !392
  br label %39, !dbg !392

39:                                               ; preds = %38, %35
  br label %40, !dbg !390

40:                                               ; preds = %39
  br label %41, !dbg !387

41:                                               ; preds = %40, %31
  br label %42, !dbg !385

42:                                               ; preds = %41
  %43 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !395
  %44 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %43, i32 0, i32 8, !dbg !395
  %45 = load i64 (...)*, i64 (...)** %44, align 8, !dbg !395
  %46 = bitcast i64 (...)* %45 to i64 ()*, !dbg !395
  %47 = call i64 %46() #3, !dbg !395
  %48 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !396
  %49 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %48, i32 0, i32 7, !dbg !396
  %50 = load i64 (...)*, i64 (...)** %49, align 8, !dbg !396
  %51 = bitcast i64 (...)* %50 to i64 ()*, !dbg !396
  %52 = call i64 %51() #3, !dbg !396
  store i64 0, i64* %4, align 8, !dbg !397
  br label %53, !dbg !397

53:                                               ; preds = %42, %28
  %54 = load i64, i64* %4, align 8, !dbg !398
  ret i64 %54, !dbg !398
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @CharConverterReadyCallback(%struct.GUID* noundef %0, i8* noundef %1, i8* noundef %2) #0 !dbg !399 {
  %4 = alloca i64, align 8
  %5 = alloca %struct.GUID*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  store %struct.GUID* %0, %struct.GUID** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.GUID** %5, metadata !400, metadata !DIExpression()), !dbg !401
  store i8* %1, i8** %6, align 8
  call void @llvm.dbg.declare(metadata i8** %6, metadata !402, metadata !DIExpression()), !dbg !403
  store i8* %2, i8** %7, align 8
  call void @llvm.dbg.declare(metadata i8** %7, metadata !404, metadata !DIExpression()), !dbg !405
  call void @llvm.dbg.declare(metadata i64* %8, metadata !406, metadata !DIExpression()), !dbg !407
  %9 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !408
  %10 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %9, i32 0, i32 21, !dbg !408
  %11 = load i64 (%struct.GUID*, i8*, i8**)*, i64 (%struct.GUID*, i8*, i8**)** %10, align 8, !dbg !408
  %12 = call i64 %11(%struct.GUID* noundef @gEfiCharConverterProtocolGuid, i8* noundef null, i8** noundef bitcast (%struct._CHAR_CONVERTER_PROTOCOL** @mCharConverter to i8**)) #3, !dbg !408
  store i64 %12, i64* %8, align 8, !dbg !408
  %13 = load i64, i64* %8, align 8, !dbg !409
  %14 = icmp slt i64 %13, 0, !dbg !409
  br i1 %14, label %15, label %30, !dbg !409

15:                                               ; preds = %3
  br label %16, !dbg !410

16:                                               ; preds = %15
  %17 = call i8 @DebugPrintEnabled() #3, !dbg !413
  %18 = icmp ne i8 %17, 0, !dbg !413
  br i1 %18, label %19, label %27, !dbg !413

19:                                               ; preds = %16
  br label %20, !dbg !415

20:                                               ; preds = %19
  %21 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !418
  %22 = icmp ne i8 %21, 0, !dbg !418
  br i1 %22, label %23, label %25, !dbg !418

23:                                               ; preds = %20
  %24 = load i64, i64* %8, align 8, !dbg !420
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([58 x i8], [58 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @__func__.CharConverterReadyCallback, i64 0, i64 0), i64 noundef %24) #3, !dbg !420
  br label %25, !dbg !420

25:                                               ; preds = %23, %20
  br label %26, !dbg !418

26:                                               ; preds = %25
  br label %27, !dbg !415

27:                                               ; preds = %26, %16
  br label %28, !dbg !413

28:                                               ; preds = %27
  %29 = load i64, i64* %8, align 8, !dbg !423
  store i64 %29, i64* %4, align 8, !dbg !423
  br label %43, !dbg !423

30:                                               ; preds = %3
  br label %31, !dbg !424

31:                                               ; preds = %30
  %32 = call i8 @DebugPrintEnabled() #3, !dbg !425
  %33 = icmp ne i8 %32, 0, !dbg !425
  br i1 %33, label %34, label %41, !dbg !425

34:                                               ; preds = %31
  br label %35, !dbg !427

35:                                               ; preds = %34
  %36 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !430
  %37 = icmp ne i8 %36, 0, !dbg !430
  br i1 %37, label %38, label %39, !dbg !430

38:                                               ; preds = %35
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.8, i64 0, i64 0)) #3, !dbg !432
  br label %39, !dbg !432

39:                                               ; preds = %38, %35
  br label %40, !dbg !430

40:                                               ; preds = %39
  br label %41, !dbg !427

41:                                               ; preds = %40, %31
  br label %42, !dbg !425

42:                                               ; preds = %41
  store i64 0, i64* %4, align 8, !dbg !435
  br label %43, !dbg !435

43:                                               ; preds = %42, %28
  %44 = load i64, i64* %4, align 8, !dbg !436
  ret i64 %44, !dbg !436
}

; Function Attrs: noimplicitfloat noinline noredzone nounwind uwtable
define dso_local i64 @Sample2TestsDriverEntryPoint(i8* noundef %0, %struct.EFI_SYSTEM_TABLE* noundef %1) #0 !dbg !437 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca %struct.EFI_SYSTEM_TABLE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  call void @llvm.dbg.declare(metadata i8** %4, metadata !926, metadata !DIExpression()), !dbg !927
  store %struct.EFI_SYSTEM_TABLE* %1, %struct.EFI_SYSTEM_TABLE** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.EFI_SYSTEM_TABLE** %5, metadata !928, metadata !DIExpression()), !dbg !929
  call void @llvm.dbg.declare(metadata i64* %6, metadata !930, metadata !DIExpression()), !dbg !931
  call void @llvm.dbg.declare(metadata i8** %7, metadata !932, metadata !DIExpression()), !dbg !933
  call void @llvm.dbg.declare(metadata i8** %8, metadata !934, metadata !DIExpression()), !dbg !935
  call void @llvm.dbg.declare(metadata i8** %9, metadata !936, metadata !DIExpression()), !dbg !937
  %10 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !938
  %11 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %10, i32 0, i32 21, !dbg !938
  %12 = load i64 (%struct.GUID*, i8*, i8**)*, i64 (%struct.GUID*, i8*, i8**)** %11, align 8, !dbg !938
  %13 = call i64 %12(%struct.GUID* noundef @gEfiHeapManagerProtocolGuid, i8* noundef null, i8** noundef bitcast (%struct._HEAP_MANAGER_PROTOCOL** @mHeapManager to i8**)) #3, !dbg !938
  store i64 %13, i64* %6, align 8, !dbg !938
  %14 = load i64, i64* %6, align 8, !dbg !939
  %15 = icmp slt i64 %14, 0, !dbg !939
  br i1 %15, label %16, label %38, !dbg !939

16:                                               ; preds = %2
  %17 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !940
  %18 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %17, i32 0, i32 19, !dbg !940
  %19 = load i64 (%struct.GUID*, i64 (%struct.GUID*, i8*, i8*)*, i8**)*, i64 (%struct.GUID*, i64 (%struct.GUID*, i8*, i8*)*, i8**)** %18, align 8, !dbg !940
  %20 = call i64 %19(%struct.GUID* noundef @gEfiHeapManagerReadyProtocolGuid, i64 (%struct.GUID*, i8*, i8*)* noundef @HeapManagerReadyCallback, i8** noundef %8) #3, !dbg !940
  store i64 %20, i64* %6, align 8, !dbg !940
  %21 = load i64, i64* %6, align 8, !dbg !943
  %22 = icmp slt i64 %21, 0, !dbg !943
  br i1 %22, label %23, label %37, !dbg !943

23:                                               ; preds = %16
  br label %24, !dbg !944

24:                                               ; preds = %23
  %25 = call i8 @DebugPrintEnabled() #3, !dbg !947
  %26 = icmp ne i8 %25, 0, !dbg !947
  br i1 %26, label %27, label %34, !dbg !947

27:                                               ; preds = %24
  br label %28, !dbg !949

28:                                               ; preds = %27
  %29 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !952
  %30 = icmp ne i8 %29, 0, !dbg !952
  br i1 %30, label %31, label %32, !dbg !952

31:                                               ; preds = %28
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([40 x i8], [40 x i8]* @.str.9, i64 0, i64 0), i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @__func__.Sample2TestsDriverEntryPoint, i64 0, i64 0)) #3, !dbg !954
  br label %32, !dbg !954

32:                                               ; preds = %31, %28
  br label %33, !dbg !952

33:                                               ; preds = %32
  br label %34, !dbg !949

34:                                               ; preds = %33, %24
  br label %35, !dbg !947

35:                                               ; preds = %34
  %36 = load i64, i64* %6, align 8, !dbg !957
  store i64 %36, i64* %3, align 8, !dbg !957
  br label %96, !dbg !957

37:                                               ; preds = %16
  br label %49, !dbg !958

38:                                               ; preds = %2
  %39 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !959
  %40 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %39, i32 0, i32 8, !dbg !959
  %41 = load i64 (...)*, i64 (...)** %40, align 8, !dbg !959
  %42 = bitcast i64 (...)* %41 to i64 ()*, !dbg !959
  %43 = call i64 %42() #3, !dbg !959
  %44 = load %struct._HEAP_MANAGER_PROTOCOL*, %struct._HEAP_MANAGER_PROTOCOL** @mHeapManager, align 8, !dbg !961
  %45 = getelementptr inbounds %struct._HEAP_MANAGER_PROTOCOL, %struct._HEAP_MANAGER_PROTOCOL* %44, i32 0, i32 7, !dbg !961
  %46 = load i64 (...)*, i64 (...)** %45, align 8, !dbg !961
  %47 = bitcast i64 (...)* %46 to i64 ()*, !dbg !961
  %48 = call i64 %47() #3, !dbg !961
  br label %49, !dbg !962

49:                                               ; preds = %38, %37
  store void (...)* bitcast (void ()* @welcome_msg to void (...)*), void (...)** @funcptr, align 8, !dbg !963
  %50 = load void (...)*, void (...)** @funcptr, align 8, !dbg !964
  %51 = bitcast void (...)* %50 to void ()*, !dbg !964
  call void %51() #3, !dbg !964
  %52 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !965
  %53 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %52, i32 0, i32 19, !dbg !965
  %54 = load i64 (%struct.GUID*, i64 (%struct.GUID*, i8*, i8*)*, i8**)*, i64 (%struct.GUID*, i64 (%struct.GUID*, i8*, i8*)*, i8**)** %53, align 8, !dbg !965
  %55 = call i64 %54(%struct.GUID* noundef @gEfiCharConverterReadyProtocolGuid, i64 (%struct.GUID*, i8*, i8*)* noundef @CharConverterReadyCallback, i8** noundef %9) #3, !dbg !965
  store i64 %55, i64* %6, align 8, !dbg !965
  %56 = load i64, i64* %6, align 8, !dbg !966
  %57 = icmp slt i64 %56, 0, !dbg !966
  br i1 %57, label %58, label %72, !dbg !966

58:                                               ; preds = %49
  br label %59, !dbg !967

59:                                               ; preds = %58
  %60 = call i8 @DebugPrintEnabled() #3, !dbg !970
  %61 = icmp ne i8 %60, 0, !dbg !970
  br i1 %61, label %62, label %69, !dbg !970

62:                                               ; preds = %59
  br label %63, !dbg !972

63:                                               ; preds = %62
  %64 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !975
  %65 = icmp ne i8 %64, 0, !dbg !975
  br i1 %65, label %66, label %67, !dbg !975

66:                                               ; preds = %63
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([40 x i8], [40 x i8]* @.str.9, i64 0, i64 0), i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @__func__.Sample2TestsDriverEntryPoint, i64 0, i64 0)) #3, !dbg !977
  br label %67, !dbg !977

67:                                               ; preds = %66, %63
  br label %68, !dbg !975

68:                                               ; preds = %67
  br label %69, !dbg !972

69:                                               ; preds = %68, %59
  br label %70, !dbg !970

70:                                               ; preds = %69
  %71 = load i64, i64* %6, align 8, !dbg !980
  store i64 %71, i64* %3, align 8, !dbg !980
  br label %96, !dbg !980

72:                                               ; preds = %49
  %73 = load %struct._EFI_SMM_SYSTEM_TABLE2*, %struct._EFI_SMM_SYSTEM_TABLE2** @gSmst, align 8, !dbg !981
  %74 = getelementptr inbounds %struct._EFI_SMM_SYSTEM_TABLE2, %struct._EFI_SMM_SYSTEM_TABLE2* %73, i32 0, i32 23, !dbg !981
  %75 = load i64 (i64 (i8*, i8*, i8*, i64*)*, %struct.GUID*, i8**)*, i64 (i64 (i8*, i8*, i8*, i64*)*, %struct.GUID*, i8**)** %74, align 8, !dbg !981
  %76 = call i64 %75(i64 (i8*, i8*, i8*, i64*)* noundef @Sample2TestsDriverHandler, %struct.GUID* noundef @gEfiSample2TestsDriverCommGuid, i8** noundef %7) #3, !dbg !981
  store i64 %76, i64* %6, align 8, !dbg !981
  %77 = load i64, i64* %6, align 8, !dbg !982
  %78 = icmp slt i64 %77, 0, !dbg !982
  br i1 %78, label %79, label %94, !dbg !982

79:                                               ; preds = %72
  br label %80, !dbg !983

80:                                               ; preds = %79
  %81 = call i8 @DebugPrintEnabled() #3, !dbg !986
  %82 = icmp ne i8 %81, 0, !dbg !986
  br i1 %82, label %83, label %91, !dbg !986

83:                                               ; preds = %80
  br label %84, !dbg !988

84:                                               ; preds = %83
  %85 = call i8 @DebugPrintLevelEnabled(i64 noundef 2147483648) #3, !dbg !991
  %86 = icmp ne i8 %85, 0, !dbg !991
  br i1 %86, label %87, label %89, !dbg !991

87:                                               ; preds = %84
  %88 = load i64, i64* %6, align 8, !dbg !993
  call void (i64, i8*, ...) @DebugPrint(i64 noundef 2147483648, i8* noundef getelementptr inbounds ([62 x i8], [62 x i8]* @.str.10, i64 0, i64 0), i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @__func__.Sample2TestsDriverEntryPoint, i64 0, i64 0), i64 noundef %88) #3, !dbg !993
  br label %89, !dbg !993

89:                                               ; preds = %87, %84
  br label %90, !dbg !991

90:                                               ; preds = %89
  br label %91, !dbg !988

91:                                               ; preds = %90, %80
  br label %92, !dbg !986

92:                                               ; preds = %91
  %93 = load i64, i64* %6, align 8, !dbg !996
  store i64 %93, i64* %3, align 8, !dbg !996
  br label %96, !dbg !996

94:                                               ; preds = %72
  %95 = load i64, i64* %6, align 8, !dbg !997
  store i64 %95, i64* %3, align 8, !dbg !997
  br label %96, !dbg !997

96:                                               ; preds = %94, %92, %70, %35
  %97 = load i64, i64* %3, align 8, !dbg !998
  ret i64 %97, !dbg !998
}

attributes #0 = { noimplicitfloat noinline noredzone nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-stack-arg-probe" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noimplicitfloat noredzone "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nobuiltin noimplicitfloat noredzone "no-builtins" "trap-func-name"="undefined_behavior_has_been_optimized_away_by_clang" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!218, !219, !220, !221, !222, !223, !224, !225}
!llvm.ident = !{!226}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "mHeapManager", scope: !2, file: !120, line: 3, type: !154, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !65, globals: !117, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases/Testcases/Sample2Tests/Sample2TestsDriver/Sample2TestsDriver.c", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases/Build/OvmfX64/NOOPT_CLANGPDB/X64/Testcases/Sample2Tests/Sample2TestsDriver/Sample2TestsDriver", checksumkind: CSK_MD5, checksum: "3adaf1c4a19765f62b2ca720d13894ba")
!4 = !{!5, !14, !19, !26, !33, !52, !57, !60}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "OP_TYPE", file: !6, line: 17, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "Testcases/Sample2Tests/Sample2TestsDriver/Sample2TestsDriver.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "aaa522c4986706b69bb07c8847f73366")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "CONVERT", value: 0)
!10 = !DIEnumerator(name: "FREE_LIST", value: 1)
!11 = !DIEnumerator(name: "DISPLAY_LIST", value: 2)
!12 = !DIEnumerator(name: "DISPLAY_METADATA", value: 3)
!13 = !DIEnumerator(name: "MSG", value: 4)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "CONVERT_TYPE", file: !6, line: 25, baseType: !7, size: 32, elements: !15)
!15 = !{!16, !17, !18}
!16 = !DIEnumerator(name: "STANDARD", value: 0)
!17 = !DIEnumerator(name: "LIBXML2", value: 1)
!18 = !DIEnumerator(name: "PKEXEC", value: 2)
!19 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !20, line: 117, baseType: !7, size: 32, elements: !21)
!20 = !DIFile(filename: "MdePkg/Include/Uefi/UefiMultiPhase.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "321376346bf760b12510b9ae9d8f46f8")
!21 = !{!22, !23, !24, !25}
!22 = !DIEnumerator(name: "EfiResetCold", value: 0)
!23 = !DIEnumerator(name: "EfiResetWarm", value: 1)
!24 = !DIEnumerator(name: "EfiResetShutdown", value: 2)
!25 = !DIEnumerator(name: "EfiResetPlatformSpecific", value: 3)
!26 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !27, line: 29, baseType: !7, size: 32, elements: !28)
!27 = !DIFile(filename: "MdePkg/Include/Uefi/UefiSpec.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "6689a006b5315b366a9c472eecb4d5b8")
!28 = !{!29, !30, !31, !32}
!29 = !DIEnumerator(name: "AllocateAnyPages", value: 0)
!30 = !DIEnumerator(name: "AllocateMaxAddress", value: 1)
!31 = !DIEnumerator(name: "AllocateAddress", value: 2)
!32 = !DIEnumerator(name: "MaxAllocateType", value: 3)
!33 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !20, line: 38, baseType: !7, size: 32, elements: !34)
!34 = !{!35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51}
!35 = !DIEnumerator(name: "EfiReservedMemoryType", value: 0)
!36 = !DIEnumerator(name: "EfiLoaderCode", value: 1)
!37 = !DIEnumerator(name: "EfiLoaderData", value: 2)
!38 = !DIEnumerator(name: "EfiBootServicesCode", value: 3)
!39 = !DIEnumerator(name: "EfiBootServicesData", value: 4)
!40 = !DIEnumerator(name: "EfiRuntimeServicesCode", value: 5)
!41 = !DIEnumerator(name: "EfiRuntimeServicesData", value: 6)
!42 = !DIEnumerator(name: "EfiConventionalMemory", value: 7)
!43 = !DIEnumerator(name: "EfiUnusableMemory", value: 8)
!44 = !DIEnumerator(name: "EfiACPIReclaimMemory", value: 9)
!45 = !DIEnumerator(name: "EfiACPIMemoryNVS", value: 10)
!46 = !DIEnumerator(name: "EfiMemoryMappedIO", value: 11)
!47 = !DIEnumerator(name: "EfiMemoryMappedIOPortSpace", value: 12)
!48 = !DIEnumerator(name: "EfiPalCode", value: 13)
!49 = !DIEnumerator(name: "EfiPersistentMemory", value: 14)
!50 = !DIEnumerator(name: "EfiUnacceptedMemoryType", value: 15)
!51 = !DIEnumerator(name: "EfiMaxMemoryType", value: 16)
!52 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !27, line: 521, baseType: !7, size: 32, elements: !53)
!53 = !{!54, !55, !56}
!54 = !DIEnumerator(name: "TimerCancel", value: 0)
!55 = !DIEnumerator(name: "TimerPeriodic", value: 1)
!56 = !DIEnumerator(name: "TimerRelative", value: 2)
!57 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !27, line: 1159, baseType: !7, size: 32, elements: !58)
!58 = !{!59}
!59 = !DIEnumerator(name: "EFI_NATIVE_INTERFACE", value: 0)
!60 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !27, line: 1475, baseType: !7, size: 32, elements: !61)
!61 = !{!62, !63, !64}
!62 = !DIEnumerator(name: "AllHandles", value: 0)
!63 = !DIEnumerator(name: "ByRegisterNotify", value: 1)
!64 = !DIEnumerator(name: "ByProtocol", value: 2)
!65 = !{!66, !69, !74, !88, !89, !116, !79}
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "BOOLEAN", file: !67, line: 192, baseType: !68)
!67 = !DIFile(filename: "MdePkg/Include/X64/ProcessorBind.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "ef2524a221fe61206fa09ec88dd4f59b")
!68 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "RETURN_STATUS", file: !70, line: 1026, baseType: !71)
!70 = !DIFile(filename: "MdePkg/Include/Base.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "3996263373664be5782f777b907656f6")
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINTN", file: !67, line: 211, baseType: !72)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT64", file: !67, line: 162, baseType: !73)
!73 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_DATA", file: !6, line: 37, baseType: !76)
!76 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CHAR_CONVERTER_DATA", file: !6, line: 34, size: 4160, elements: !77)
!77 = !{!78, !82}
!78 = !DIDerivedType(tag: DW_TAG_member, name: "Size", scope: !76, file: !6, line: 35, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "INTN", file: !67, line: 216, baseType: !80)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "INT64", file: !67, line: 166, baseType: !81)
!81 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "Data", scope: !76, file: !6, line: 36, baseType: !83, size: 4096, offset: 64)
!83 = !DICompositeType(tag: DW_TAG_array_type, baseType: !84, size: 4096, elements: !86)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR8", file: !67, line: 200, baseType: !85)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!86 = !{!87}
!87 = !DISubrange(count: 512)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "SAMPLE2_TESTS_DRIVER_COMM_BUFFER", file: !6, line: 44, baseType: !91)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "SAMPLE2_TESTS_DRIVER_COMM_BUFFER", file: !6, line: 39, size: 8384, elements: !92)
!92 = !{!93, !110, !111, !112}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "Sample2Guid", scope: !91, file: !6, line: 40, baseType: !94, size: 128)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GUID", file: !95, line: 25, baseType: !96)
!95 = !DIFile(filename: "MdePkg/Include/Uefi/UefiBaseType.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "652b6036ee3f46705189b44807c85960")
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "GUID", file: !70, line: 218, baseType: !97)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "GUID", file: !70, line: 213, size: 128, elements: !98)
!98 = !{!99, !101, !104, !105}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "Data1", scope: !97, file: !70, line: 214, baseType: !100, size: 32)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT32", file: !67, line: 170, baseType: !7)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "Data2", scope: !97, file: !70, line: 215, baseType: !102, size: 16, offset: 32)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT16", file: !67, line: 178, baseType: !103)
!103 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "Data3", scope: !97, file: !70, line: 216, baseType: !102, size: 16, offset: 48)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "Data4", scope: !97, file: !70, line: 217, baseType: !106, size: 64, offset: 64)
!106 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 64, elements: !108)
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "UINT8", file: !67, line: 196, baseType: !68)
!108 = !{!109}
!109 = !DISubrange(count: 8)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "Operation", scope: !91, file: !6, line: 41, baseType: !5, size: 32, offset: 128)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "Conversion", scope: !91, file: !6, line: 42, baseType: !14, size: 32, offset: 160)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "Data", scope: !91, file: !6, line: 43, baseType: !113, size: 8192, offset: 192)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 8192, elements: !114)
!114 = !{!115}
!115 = !DISubrange(count: 1024)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!117 = !{!0, !118, !209, !213}
!118 = !DIGlobalVariableExpression(var: !119, expr: !DIExpression())
!119 = distinct !DIGlobalVariable(name: "mCharConverter", scope: !2, file: !120, line: 4, type: !121, isLocal: false, isDefinition: true)
!120 = !DIFile(filename: "Testcases/Sample2Tests/Sample2TestsDriver/Sample2TestsDriver.c", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "3adaf1c4a19765f62b2ca720d13894ba")
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_PROTOCOL", file: !123, line: 83, baseType: !124)
!123 = !DIFile(filename: "Testcases/Sample2Tests/Sample2TestsDriver/../CharConverter/CharConverter.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "ac05300bbbb33b9bef78614a50737cb1")
!124 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CHAR_CONVERTER_PROTOCOL", file: !123, line: 77, size: 320, elements: !125)
!125 = !{!126, !142, !149, !205, !207}
!126 = !DIDerivedType(tag: DW_TAG_member, name: "IconvOpen", scope: !124, file: !123, line: 78, baseType: !127, size: 64)
!127 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_ICONV_OPEN", file: !123, line: 37, baseType: !128)
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64)
!129 = !DISubroutineType(types: !130)
!130 = !{!131, !132, !132, !134}
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_STATUS", file: !95, line: 29, baseType: !69)
!132 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !133, size: 64)
!133 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !84)
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 64)
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "ICONV_T", file: !123, line: 25, baseType: !137)
!137 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ICONV_T", file: !123, line: 22, size: 128, elements: !138)
!138 = !{!139, !141}
!139 = !DIDerivedType(tag: DW_TAG_member, name: "FromEncoding", scope: !137, file: !123, line: 23, baseType: !140, size: 64)
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "ToEncoding", scope: !137, file: !123, line: 24, baseType: !140, size: 64, offset: 64)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "Iconv", scope: !124, file: !123, line: 79, baseType: !143, size: 64, offset: 64)
!143 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_ICONV", file: !123, line: 45, baseType: !144)
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !145, size: 64)
!145 = !DISubroutineType(types: !146)
!146 = !{!131, !135, !140, !79, !147, !148}
!147 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !140, size: 64)
!148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "StandardConvert", scope: !124, file: !123, line: 80, baseType: !150, size: 64, offset: 128)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_STANDARD_CONVERT", file: !123, line: 55, baseType: !151)
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !152, size: 64)
!152 = !DISubroutineType(types: !153)
!153 = !{!131, !140, !148, !154}
!154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !155, size: 64)
!155 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_PROTOCOL", file: !156, line: 118, baseType: !157)
!156 = !DIFile(filename: "Testcases/Sample2Tests/Sample2TestsDriver/../CharConverter/../HeapManager/HeapManager.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "e714afc4efaaf897241f252dc062e7a1")
!157 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_HEAP_MANAGER_PROTOCOL", file: !156, line: 108, size: 576, elements: !158)
!158 = !{!159, !164, !176, !181, !186, !188, !190, !201, !203}
!159 = !DIDerivedType(tag: DW_TAG_member, name: "GetBlockSize", scope: !157, file: !156, line: 109, baseType: !160, size: 64)
!160 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_GET_BLOCK_SIZE", file: !156, line: 63, baseType: !161)
!161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64)
!162 = !DISubroutineType(types: !163)
!163 = !{!131, !71, !148}
!164 = !DIDerivedType(tag: DW_TAG_member, name: "AllocateChunk", scope: !157, file: !156, line: 110, baseType: !165, size: 64, offset: 64)
!165 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_ALLOCATE_CHUNK", file: !156, line: 70, baseType: !166)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = !DISubroutineType(types: !168)
!168 = !{!131, !71, !169}
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 64)
!170 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !171, size: 64)
!171 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHUNK_T", file: !156, line: 34, baseType: !172)
!172 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "CHUNK", file: !156, line: 32, size: 64, elements: !173)
!173 = !{!174}
!174 = !DIDerivedType(tag: DW_TAG_member, name: "Next", scope: !172, file: !156, line: 33, baseType: !175, size: 64)
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "FreeChunk", scope: !157, file: !156, line: 111, baseType: !177, size: 64, offset: 128)
!177 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_FREE_CHUNK", file: !156, line: 77, baseType: !178)
!178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!179 = !DISubroutineType(types: !180)
!180 = !{!131, !79}
!181 = !DIDerivedType(tag: DW_TAG_member, name: "FreeAllocList", scope: !157, file: !156, line: 112, baseType: !182, size: 64, offset: 192)
!182 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_FREE_ALLOC_LIST", file: !156, line: 83, baseType: !183)
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !184, size: 64)
!184 = !DISubroutineType(types: !185)
!185 = !{!131, null}
!186 = !DIDerivedType(tag: DW_TAG_member, name: "DisplayFreeList", scope: !157, file: !156, line: 113, baseType: !187, size: 64, offset: 256)
!187 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_DISPLAY_FREE_LIST", file: !156, line: 87, baseType: !183)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "DisplayHeapMetadata", scope: !157, file: !156, line: 114, baseType: !189, size: 64, offset: 320)
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_DISPLAY_HEAP_METADATA", file: !156, line: 91, baseType: !183)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "InitializePage", scope: !157, file: !156, line: 115, baseType: !191, size: 64, offset: 384)
!191 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_PAGE", file: !156, line: 95, baseType: !192)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!193 = !DISubroutineType(types: !194)
!194 = !{!131, !71, !195}
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !196, size: 64)
!196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !197, size: 64)
!197 = !DIDerivedType(tag: DW_TAG_typedef, name: "PAGE_T", file: !156, line: 38, baseType: !198)
!198 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "PAGE", file: !156, line: 36, size: 64, elements: !199)
!199 = !{!200}
!200 = !DIDerivedType(tag: DW_TAG_member, name: "Self", scope: !198, file: !156, line: 37, baseType: !170, size: 64)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "InitializeHeapMetadata", scope: !157, file: !156, line: 116, baseType: !202, size: 64, offset: 448)
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_HEAP_METADATA", file: !156, line: 102, baseType: !183)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "InitializeHeap", scope: !157, file: !156, line: 117, baseType: !204, size: 64, offset: 512)
!204 = !DIDerivedType(tag: DW_TAG_typedef, name: "HEAP_MANAGER_INITIALIZE_HEAP", file: !156, line: 106, baseType: !183)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "Libxml2Convert", scope: !124, file: !123, line: 81, baseType: !206, size: 64, offset: 192)
!206 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_LIBXML2_CONVERT", file: !123, line: 63, baseType: !151)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "PkexecConvert", scope: !124, file: !123, line: 82, baseType: !208, size: 64, offset: 256)
!208 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR_CONVERTER_PKEXEC_CONVERT", file: !123, line: 71, baseType: !151)
!209 = !DIGlobalVariableExpression(var: !210, expr: !DIExpression())
!210 = distinct !DIGlobalVariable(name: "w_msg", scope: !2, file: !120, line: 7, type: !211, isLocal: false, isDefinition: true)
!211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 64)
!212 = !DIDerivedType(tag: DW_TAG_typedef, name: "CHAR16", file: !67, line: 183, baseType: !103)
!213 = !DIGlobalVariableExpression(var: !214, expr: !DIExpression())
!214 = distinct !DIGlobalVariable(name: "funcptr", scope: !2, file: !120, line: 8, type: !215, isLocal: false, isDefinition: true)
!215 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !216, size: 64)
!216 = !DISubroutineType(types: !217)
!217 = !{null, null}
!218 = !{i32 2, !"CodeView", i32 1}
!219 = !{i32 2, !"Debug Info Version", i32 3}
!220 = !{i32 1, !"wchar_size", i32 2}
!221 = !{i32 7, !"PIC Level", i32 2}
!222 = !{i32 1, !"Code Model", i32 1}
!223 = !{i32 7, !"uwtable", i32 1}
!224 = !{i32 1, !"ThinLTO", i32 0}
!225 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!226 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!227 = distinct !DISubprogram(name: "winning_msg", scope: !120, file: !120, line: 10, type: !228, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !230)
!228 = !DISubroutineType(types: !229)
!229 = !{null}
!230 = !{}
!231 = !DILocation(line: 11, scope: !227)
!232 = !DILocation(line: 11, scope: !233)
!233 = distinct !DILexicalBlock(scope: !227, file: !120, line: 11)
!234 = !DILocation(line: 11, scope: !235)
!235 = distinct !DILexicalBlock(scope: !236, file: !120, line: 11)
!236 = distinct !DILexicalBlock(scope: !233, file: !120, line: 11)
!237 = !DILocation(line: 11, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !120, line: 11)
!239 = !DILocation(line: 11, scope: !240)
!240 = distinct !DILexicalBlock(scope: !241, file: !120, line: 11)
!241 = distinct !DILexicalBlock(scope: !238, file: !120, line: 11)
!242 = !DILocation(line: 12, scope: !227)
!243 = distinct !DISubprogram(name: "welcome_msg", scope: !120, file: !120, line: 14, type: !228, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !230)
!244 = !DILocation(line: 15, scope: !243)
!245 = !DILocation(line: 15, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !120, line: 15)
!247 = !DILocation(line: 15, scope: !248)
!248 = distinct !DILexicalBlock(scope: !249, file: !120, line: 15)
!249 = distinct !DILexicalBlock(scope: !246, file: !120, line: 15)
!250 = !DILocation(line: 15, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !120, line: 15)
!252 = !DILocation(line: 15, scope: !253)
!253 = distinct !DILexicalBlock(scope: !254, file: !120, line: 15)
!254 = distinct !DILexicalBlock(scope: !251, file: !120, line: 15)
!255 = !DILocation(line: 16, scope: !243)
!256 = !DILocation(line: 16, scope: !257)
!257 = distinct !DILexicalBlock(scope: !243, file: !120, line: 16)
!258 = !DILocation(line: 16, scope: !259)
!259 = distinct !DILexicalBlock(scope: !260, file: !120, line: 16)
!260 = distinct !DILexicalBlock(scope: !257, file: !120, line: 16)
!261 = !DILocation(line: 16, scope: !262)
!262 = distinct !DILexicalBlock(scope: !259, file: !120, line: 16)
!263 = !DILocation(line: 16, scope: !264)
!264 = distinct !DILexicalBlock(scope: !265, file: !120, line: 16)
!265 = distinct !DILexicalBlock(scope: !262, file: !120, line: 16)
!266 = !DILocation(line: 17, scope: !243)
!267 = !DILocation(line: 17, scope: !268)
!268 = distinct !DILexicalBlock(scope: !243, file: !120, line: 17)
!269 = !DILocation(line: 17, scope: !270)
!270 = distinct !DILexicalBlock(scope: !271, file: !120, line: 17)
!271 = distinct !DILexicalBlock(scope: !268, file: !120, line: 17)
!272 = !DILocation(line: 17, scope: !273)
!273 = distinct !DILexicalBlock(scope: !270, file: !120, line: 17)
!274 = !DILocation(line: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !276, file: !120, line: 17)
!276 = distinct !DILexicalBlock(scope: !273, file: !120, line: 17)
!277 = !DILocation(line: 18, scope: !243)
!278 = distinct !DISubprogram(name: "convert", scope: !120, file: !120, line: 21, type: !279, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !230)
!279 = !DISubroutineType(types: !280)
!280 = !{!131, !281}
!281 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!282 = !DILocalVariable(name: "Buffer", arg: 1, scope: !278, file: !120, line: 21, type: !281)
!283 = !DILocation(line: 21, scope: !278)
!284 = !DILocalVariable(name: "Status", scope: !278, file: !120, line: 23, type: !131)
!285 = !DILocation(line: 23, scope: !278)
!286 = !DILocalVariable(name: "Input", scope: !278, file: !120, line: 24, type: !74)
!287 = !DILocation(line: 24, scope: !278)
!288 = !DILocation(line: 25, scope: !278)
!289 = !DILocation(line: 28, scope: !290)
!290 = distinct !DILexicalBlock(scope: !278, file: !120, line: 26)
!291 = !DILocation(line: 29, scope: !290)
!292 = !DILocation(line: 31, scope: !290)
!293 = !DILocation(line: 32, scope: !290)
!294 = !DILocation(line: 34, scope: !290)
!295 = !DILocation(line: 35, scope: !290)
!296 = !DILocation(line: 37, scope: !290)
!297 = !DILocation(line: 37, scope: !298)
!298 = distinct !DILexicalBlock(scope: !290, file: !120, line: 37)
!299 = !DILocation(line: 37, scope: !300)
!300 = distinct !DILexicalBlock(scope: !301, file: !120, line: 37)
!301 = distinct !DILexicalBlock(scope: !298, file: !120, line: 37)
!302 = !DILocation(line: 37, scope: !303)
!303 = distinct !DILexicalBlock(scope: !300, file: !120, line: 37)
!304 = !DILocation(line: 37, scope: !305)
!305 = distinct !DILexicalBlock(scope: !306, file: !120, line: 37)
!306 = distinct !DILexicalBlock(scope: !303, file: !120, line: 37)
!307 = !DILocation(line: 38, scope: !290)
!308 = !DILocation(line: 39, scope: !290)
!309 = !DILocation(line: 41, scope: !278)
!310 = distinct !DISubprogram(name: "Sample2TestsDriverHandler", scope: !120, file: !120, line: 60, type: !311, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !230)
!311 = !DISubroutineType(types: !312)
!312 = !{!131, !313, !314, !88, !316}
!313 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_HANDLE", file: !95, line: 33, baseType: !88)
!314 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !315, size: 64)
!315 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!316 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!317 = !DILocalVariable(name: "DispatchHandle", arg: 1, scope: !310, file: !120, line: 61, type: !313)
!318 = !DILocation(line: 61, scope: !310)
!319 = !DILocalVariable(name: "Context", arg: 2, scope: !310, file: !120, line: 62, type: !314)
!320 = !DILocation(line: 62, scope: !310)
!321 = !DILocalVariable(name: "CommBuffer", arg: 3, scope: !310, file: !120, line: 63, type: !88)
!322 = !DILocation(line: 63, scope: !310)
!323 = !DILocalVariable(name: "CommBufferSize", arg: 4, scope: !310, file: !120, line: 64, type: !316)
!324 = !DILocation(line: 64, scope: !310)
!325 = !DILocalVariable(name: "ChunkSize", scope: !310, file: !120, line: 67, type: !71)
!326 = !DILocation(line: 67, scope: !310)
!327 = !DILocalVariable(name: "TmpCommBuffer", scope: !310, file: !120, line: 69, type: !89)
!328 = !DILocation(line: 69, scope: !310)
!329 = !DILocation(line: 71, scope: !310)
!330 = !DILocation(line: 72, scope: !331)
!331 = distinct !DILexicalBlock(scope: !332, file: !120, line: 71)
!332 = distinct !DILexicalBlock(scope: !310, file: !120, line: 71)
!333 = !DILocation(line: 75, scope: !310)
!334 = !DILocation(line: 77, scope: !310)
!335 = !DILocation(line: 80, scope: !336)
!336 = distinct !DILexicalBlock(scope: !310, file: !120, line: 78)
!337 = !DILocation(line: 81, scope: !336)
!338 = !DILocation(line: 83, scope: !336)
!339 = !DILocation(line: 84, scope: !336)
!340 = !DILocation(line: 86, scope: !336)
!341 = !DILocation(line: 87, scope: !336)
!342 = !DILocation(line: 88, scope: !343)
!343 = distinct !DILexicalBlock(scope: !344, file: !120, line: 87)
!344 = distinct !DILexicalBlock(scope: !336, file: !120, line: 87)
!345 = !DILocation(line: 89, scope: !343)
!346 = !DILocation(line: 90, scope: !336)
!347 = !DILocation(line: 91, scope: !336)
!348 = !DILocation(line: 93, scope: !336)
!349 = !DILocation(line: 94, scope: !336)
!350 = !DILocation(line: 96, scope: !336)
!351 = !DILocation(line: 97, scope: !336)
!352 = !DILocation(line: 99, scope: !336)
!353 = !DILocation(line: 102, scope: !310)
!354 = !DILocation(line: 103, scope: !310)
!355 = distinct !DISubprogram(name: "HeapManagerReadyCallback", scope: !120, file: !120, line: 119, type: !356, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !230)
!356 = !DISubroutineType(types: !357)
!357 = !{!131, !358, !88, !313}
!358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !359, size: 64)
!359 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !94)
!360 = !DILocalVariable(name: "Protocol", arg: 1, scope: !355, file: !120, line: 120, type: !358)
!361 = !DILocation(line: 120, scope: !355)
!362 = !DILocalVariable(name: "Interface", arg: 2, scope: !355, file: !120, line: 121, type: !88)
!363 = !DILocation(line: 121, scope: !355)
!364 = !DILocalVariable(name: "Handle", arg: 3, scope: !355, file: !120, line: 122, type: !313)
!365 = !DILocation(line: 122, scope: !355)
!366 = !DILocalVariable(name: "Status", scope: !355, file: !120, line: 125, type: !131)
!367 = !DILocation(line: 125, scope: !355)
!368 = !DILocation(line: 127, scope: !355)
!369 = !DILocation(line: 128, scope: !355)
!370 = !DILocation(line: 129, scope: !371)
!371 = distinct !DILexicalBlock(scope: !372, file: !120, line: 128)
!372 = distinct !DILexicalBlock(scope: !355, file: !120, line: 128)
!373 = !DILocation(line: 129, scope: !374)
!374 = distinct !DILexicalBlock(scope: !371, file: !120, line: 129)
!375 = !DILocation(line: 129, scope: !376)
!376 = distinct !DILexicalBlock(scope: !377, file: !120, line: 129)
!377 = distinct !DILexicalBlock(scope: !374, file: !120, line: 129)
!378 = !DILocation(line: 129, scope: !379)
!379 = distinct !DILexicalBlock(scope: !376, file: !120, line: 129)
!380 = !DILocation(line: 129, scope: !381)
!381 = distinct !DILexicalBlock(scope: !382, file: !120, line: 129)
!382 = distinct !DILexicalBlock(scope: !379, file: !120, line: 129)
!383 = !DILocation(line: 130, scope: !371)
!384 = !DILocation(line: 132, scope: !355)
!385 = !DILocation(line: 132, scope: !386)
!386 = distinct !DILexicalBlock(scope: !355, file: !120, line: 132)
!387 = !DILocation(line: 132, scope: !388)
!388 = distinct !DILexicalBlock(scope: !389, file: !120, line: 132)
!389 = distinct !DILexicalBlock(scope: !386, file: !120, line: 132)
!390 = !DILocation(line: 132, scope: !391)
!391 = distinct !DILexicalBlock(scope: !388, file: !120, line: 132)
!392 = !DILocation(line: 132, scope: !393)
!393 = distinct !DILexicalBlock(scope: !394, file: !120, line: 132)
!394 = distinct !DILexicalBlock(scope: !391, file: !120, line: 132)
!395 = !DILocation(line: 133, scope: !355)
!396 = !DILocation(line: 134, scope: !355)
!397 = !DILocation(line: 136, scope: !355)
!398 = !DILocation(line: 137, scope: !355)
!399 = distinct !DISubprogram(name: "CharConverterReadyCallback", scope: !120, file: !120, line: 152, type: !356, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !230)
!400 = !DILocalVariable(name: "Protocol", arg: 1, scope: !399, file: !120, line: 153, type: !358)
!401 = !DILocation(line: 153, scope: !399)
!402 = !DILocalVariable(name: "Interface", arg: 2, scope: !399, file: !120, line: 154, type: !88)
!403 = !DILocation(line: 154, scope: !399)
!404 = !DILocalVariable(name: "Handle", arg: 3, scope: !399, file: !120, line: 155, type: !313)
!405 = !DILocation(line: 155, scope: !399)
!406 = !DILocalVariable(name: "Status", scope: !399, file: !120, line: 158, type: !131)
!407 = !DILocation(line: 158, scope: !399)
!408 = !DILocation(line: 160, scope: !399)
!409 = !DILocation(line: 161, scope: !399)
!410 = !DILocation(line: 162, scope: !411)
!411 = distinct !DILexicalBlock(scope: !412, file: !120, line: 161)
!412 = distinct !DILexicalBlock(scope: !399, file: !120, line: 161)
!413 = !DILocation(line: 162, scope: !414)
!414 = distinct !DILexicalBlock(scope: !411, file: !120, line: 162)
!415 = !DILocation(line: 162, scope: !416)
!416 = distinct !DILexicalBlock(scope: !417, file: !120, line: 162)
!417 = distinct !DILexicalBlock(scope: !414, file: !120, line: 162)
!418 = !DILocation(line: 162, scope: !419)
!419 = distinct !DILexicalBlock(scope: !416, file: !120, line: 162)
!420 = !DILocation(line: 162, scope: !421)
!421 = distinct !DILexicalBlock(scope: !422, file: !120, line: 162)
!422 = distinct !DILexicalBlock(scope: !419, file: !120, line: 162)
!423 = !DILocation(line: 163, scope: !411)
!424 = !DILocation(line: 165, scope: !399)
!425 = !DILocation(line: 165, scope: !426)
!426 = distinct !DILexicalBlock(scope: !399, file: !120, line: 165)
!427 = !DILocation(line: 165, scope: !428)
!428 = distinct !DILexicalBlock(scope: !429, file: !120, line: 165)
!429 = distinct !DILexicalBlock(scope: !426, file: !120, line: 165)
!430 = !DILocation(line: 165, scope: !431)
!431 = distinct !DILexicalBlock(scope: !428, file: !120, line: 165)
!432 = !DILocation(line: 165, scope: !433)
!433 = distinct !DILexicalBlock(scope: !434, file: !120, line: 165)
!434 = distinct !DILexicalBlock(scope: !431, file: !120, line: 165)
!435 = !DILocation(line: 167, scope: !399)
!436 = !DILocation(line: 168, scope: !399)
!437 = distinct !DISubprogram(name: "Sample2TestsDriverEntryPoint", scope: !120, file: !120, line: 179, type: !438, scopeLine: 183, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !230)
!438 = !DISubroutineType(types: !439)
!439 = !{!131, !313, !440}
!440 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !441, size: 64)
!441 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SYSTEM_TABLE", file: !27, line: 2053, baseType: !442)
!442 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_SYSTEM_TABLE", file: !27, line: 1992, size: 960, elements: !443)
!443 = !{!444, !453, !454, !455, !456, !480, !481, !536, !537, !538, !664, !918, !919}
!444 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !442, file: !27, line: 1996, baseType: !445, size: 192)
!445 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TABLE_HEADER", file: !20, line: 177, baseType: !446)
!446 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TABLE_HEADER", file: !20, line: 150, size: 192, elements: !447)
!447 = !{!448, !449, !450, !451, !452}
!448 = !DIDerivedType(tag: DW_TAG_member, name: "Signature", scope: !446, file: !20, line: 156, baseType: !72, size: 64)
!449 = !DIDerivedType(tag: DW_TAG_member, name: "Revision", scope: !446, file: !20, line: 163, baseType: !100, size: 32, offset: 64)
!450 = !DIDerivedType(tag: DW_TAG_member, name: "HeaderSize", scope: !446, file: !20, line: 167, baseType: !100, size: 32, offset: 96)
!451 = !DIDerivedType(tag: DW_TAG_member, name: "CRC32", scope: !446, file: !20, line: 172, baseType: !100, size: 32, offset: 128)
!452 = !DIDerivedType(tag: DW_TAG_member, name: "Reserved", scope: !446, file: !20, line: 176, baseType: !100, size: 32, offset: 160)
!453 = !DIDerivedType(tag: DW_TAG_member, name: "FirmwareVendor", scope: !442, file: !27, line: 2001, baseType: !211, size: 64, offset: 192)
!454 = !DIDerivedType(tag: DW_TAG_member, name: "FirmwareRevision", scope: !442, file: !27, line: 2006, baseType: !100, size: 32, offset: 256)
!455 = !DIDerivedType(tag: DW_TAG_member, name: "ConsoleInHandle", scope: !442, file: !27, line: 2011, baseType: !313, size: 64, offset: 320)
!456 = !DIDerivedType(tag: DW_TAG_member, name: "ConIn", scope: !442, file: !27, line: 2016, baseType: !457, size: 64, offset: 384)
!457 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !458, size: 64)
!458 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_INPUT_PROTOCOL", file: !459, line: 20, baseType: !460)
!459 = !DIFile(filename: "MdePkg/Include/Protocol/SimpleTextIn.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "239cf4f3dddb25a8596c70fa738413fd")
!460 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EFI_SIMPLE_TEXT_INPUT_PROTOCOL", file: !459, line: 116, size: 192, elements: !461)
!461 = !{!462, !467, !478}
!462 = !DIDerivedType(tag: DW_TAG_member, name: "Reset", scope: !460, file: !459, line: 117, baseType: !463, size: 64)
!463 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_RESET", file: !459, line: 86, baseType: !464)
!464 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !465, size: 64)
!465 = !DISubroutineType(types: !466)
!466 = !{!131, !457, !66}
!467 = !DIDerivedType(tag: DW_TAG_member, name: "ReadKeyStroke", scope: !460, file: !459, line: 118, baseType: !468, size: 64, offset: 64)
!468 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_READ_KEY", file: !459, line: 107, baseType: !469)
!469 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !470, size: 64)
!470 = !DISubroutineType(types: !471)
!471 = !{!131, !457, !472}
!472 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !473, size: 64)
!473 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INPUT_KEY", file: !459, line: 38, baseType: !474)
!474 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_INPUT_KEY", file: !459, line: 35, size: 32, elements: !475)
!475 = !{!476, !477}
!476 = !DIDerivedType(tag: DW_TAG_member, name: "ScanCode", scope: !474, file: !459, line: 36, baseType: !102, size: 16)
!477 = !DIDerivedType(tag: DW_TAG_member, name: "UnicodeChar", scope: !474, file: !459, line: 37, baseType: !212, size: 16, offset: 16)
!478 = !DIDerivedType(tag: DW_TAG_member, name: "WaitForKey", scope: !460, file: !459, line: 122, baseType: !479, size: 64, offset: 128)
!479 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EVENT", file: !95, line: 37, baseType: !88)
!480 = !DIDerivedType(tag: DW_TAG_member, name: "ConsoleOutHandle", scope: !442, file: !27, line: 2020, baseType: !313, size: 64, offset: 448)
!481 = !DIDerivedType(tag: DW_TAG_member, name: "ConOut", scope: !442, file: !27, line: 2025, baseType: !482, size: 64, offset: 512)
!482 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !483, size: 64)
!483 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL", file: !484, line: 27, baseType: !485)
!484 = !DIFile(filename: "MdePkg/Include/Protocol/SimpleTextOut.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "685bec042927ad46d31bf42ae7f6ddcd")
!485 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL", file: !484, line: 387, size: 640, elements: !486)
!486 = !{!487, !492, !497, !499, !504, !509, !511, !516, !521, !523}
!487 = !DIDerivedType(tag: DW_TAG_member, name: "Reset", scope: !485, file: !484, line: 388, baseType: !488, size: 64)
!488 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_RESET", file: !484, line: 167, baseType: !489)
!489 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !490, size: 64)
!490 = !DISubroutineType(types: !491)
!491 = !{!131, !482, !66}
!492 = !DIDerivedType(tag: DW_TAG_member, name: "OutputString", scope: !485, file: !484, line: 390, baseType: !493, size: 64, offset: 64)
!493 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_STRING", file: !484, line: 192, baseType: !494)
!494 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !495, size: 64)
!495 = !DISubroutineType(types: !496)
!496 = !{!131, !482, !211}
!497 = !DIDerivedType(tag: DW_TAG_member, name: "TestString", scope: !485, file: !484, line: 391, baseType: !498, size: 64, offset: 128)
!498 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_TEST_STRING", file: !484, line: 213, baseType: !494)
!499 = !DIDerivedType(tag: DW_TAG_member, name: "QueryMode", scope: !485, file: !484, line: 393, baseType: !500, size: 64, offset: 192)
!500 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_QUERY_MODE", file: !484, line: 236, baseType: !501)
!501 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !502, size: 64)
!502 = !DISubroutineType(types: !503)
!503 = !{!131, !482, !71, !316, !316}
!504 = !DIDerivedType(tag: DW_TAG_member, name: "SetMode", scope: !485, file: !484, line: 394, baseType: !505, size: 64, offset: 256)
!505 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_MODE", file: !484, line: 256, baseType: !506)
!506 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !507, size: 64)
!507 = !DISubroutineType(types: !508)
!508 = !{!131, !482, !71}
!509 = !DIDerivedType(tag: DW_TAG_member, name: "SetAttribute", scope: !485, file: !484, line: 395, baseType: !510, size: 64, offset: 320)
!510 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_ATTRIBUTE", file: !484, line: 277, baseType: !506)
!511 = !DIDerivedType(tag: DW_TAG_member, name: "ClearScreen", scope: !485, file: !484, line: 397, baseType: !512, size: 64, offset: 384)
!512 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_CLEAR_SCREEN", file: !484, line: 295, baseType: !513)
!513 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !514, size: 64)
!514 = !DISubroutineType(types: !515)
!515 = !{!131, !482}
!516 = !DIDerivedType(tag: DW_TAG_member, name: "SetCursorPosition", scope: !485, file: !484, line: 398, baseType: !517, size: 64, offset: 448)
!517 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_SET_CURSOR_POSITION", file: !484, line: 318, baseType: !518)
!518 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !519, size: 64)
!519 = !DISubroutineType(types: !520)
!520 = !{!131, !482, !71, !71}
!521 = !DIDerivedType(tag: DW_TAG_member, name: "EnableCursor", scope: !485, file: !484, line: 399, baseType: !522, size: 64, offset: 512)
!522 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TEXT_ENABLE_CURSOR", file: !484, line: 340, baseType: !489)
!523 = !DIDerivedType(tag: DW_TAG_member, name: "Mode", scope: !485, file: !484, line: 404, baseType: !524, size: 64, offset: 576)
!524 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !525, size: 64)
!525 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIMPLE_TEXT_OUTPUT_MODE", file: !484, line: 379, baseType: !526)
!526 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_SIMPLE_TEXT_OUTPUT_MODE", file: !484, line: 349, size: 192, elements: !527)
!527 = !{!528, !531, !532, !533, !534, !535}
!528 = !DIDerivedType(tag: DW_TAG_member, name: "MaxMode", scope: !526, file: !484, line: 353, baseType: !529, size: 32)
!529 = !DIDerivedType(tag: DW_TAG_typedef, name: "INT32", file: !67, line: 174, baseType: !530)
!530 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!531 = !DIDerivedType(tag: DW_TAG_member, name: "Mode", scope: !526, file: !484, line: 362, baseType: !529, size: 32, offset: 32)
!532 = !DIDerivedType(tag: DW_TAG_member, name: "Attribute", scope: !526, file: !484, line: 366, baseType: !529, size: 32, offset: 64)
!533 = !DIDerivedType(tag: DW_TAG_member, name: "CursorColumn", scope: !526, file: !484, line: 370, baseType: !529, size: 32, offset: 96)
!534 = !DIDerivedType(tag: DW_TAG_member, name: "CursorRow", scope: !526, file: !484, line: 374, baseType: !529, size: 32, offset: 128)
!535 = !DIDerivedType(tag: DW_TAG_member, name: "CursorVisible", scope: !526, file: !484, line: 378, baseType: !66, size: 8, offset: 160)
!536 = !DIDerivedType(tag: DW_TAG_member, name: "StandardErrorHandle", scope: !442, file: !27, line: 2030, baseType: !313, size: 64, offset: 576)
!537 = !DIDerivedType(tag: DW_TAG_member, name: "StdErr", scope: !442, file: !27, line: 2035, baseType: !482, size: 64, offset: 640)
!538 = !DIDerivedType(tag: DW_TAG_member, name: "RuntimeServices", scope: !442, file: !27, line: 2039, baseType: !539, size: 64, offset: 704)
!539 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !540, size: 64)
!540 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RUNTIME_SERVICES", file: !27, line: 1871, baseType: !541)
!541 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_RUNTIME_SERVICES", file: !27, line: 1828, size: 1088, elements: !542)
!542 = !{!543, !544, !573, !578, !584, !589, !605, !610, !617, !622, !627, !632, !638, !652, !659}
!543 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !541, file: !27, line: 1832, baseType: !445, size: 192)
!544 = !DIDerivedType(tag: DW_TAG_member, name: "GetTime", scope: !541, file: !27, line: 1837, baseType: !545, size: 64, offset: 192)
!545 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_TIME", file: !27, line: 816, baseType: !546)
!546 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !547, size: 64)
!547 = !DISubroutineType(types: !548)
!548 = !{!131, !549, !566}
!549 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !550, size: 64)
!550 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIME", file: !95, line: 80, baseType: !551)
!551 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TIME", file: !95, line: 68, size: 128, elements: !552)
!552 = !{!553, !554, !555, !556, !557, !558, !559, !560, !561, !564, !565}
!553 = !DIDerivedType(tag: DW_TAG_member, name: "Year", scope: !551, file: !95, line: 69, baseType: !102, size: 16)
!554 = !DIDerivedType(tag: DW_TAG_member, name: "Month", scope: !551, file: !95, line: 70, baseType: !107, size: 8, offset: 16)
!555 = !DIDerivedType(tag: DW_TAG_member, name: "Day", scope: !551, file: !95, line: 71, baseType: !107, size: 8, offset: 24)
!556 = !DIDerivedType(tag: DW_TAG_member, name: "Hour", scope: !551, file: !95, line: 72, baseType: !107, size: 8, offset: 32)
!557 = !DIDerivedType(tag: DW_TAG_member, name: "Minute", scope: !551, file: !95, line: 73, baseType: !107, size: 8, offset: 40)
!558 = !DIDerivedType(tag: DW_TAG_member, name: "Second", scope: !551, file: !95, line: 74, baseType: !107, size: 8, offset: 48)
!559 = !DIDerivedType(tag: DW_TAG_member, name: "Pad1", scope: !551, file: !95, line: 75, baseType: !107, size: 8, offset: 56)
!560 = !DIDerivedType(tag: DW_TAG_member, name: "Nanosecond", scope: !551, file: !95, line: 76, baseType: !100, size: 32, offset: 64)
!561 = !DIDerivedType(tag: DW_TAG_member, name: "TimeZone", scope: !551, file: !95, line: 77, baseType: !562, size: 16, offset: 96)
!562 = !DIDerivedType(tag: DW_TAG_typedef, name: "INT16", file: !67, line: 187, baseType: !563)
!563 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!564 = !DIDerivedType(tag: DW_TAG_member, name: "Daylight", scope: !551, file: !95, line: 78, baseType: !107, size: 8, offset: 112)
!565 = !DIDerivedType(tag: DW_TAG_member, name: "Pad2", scope: !551, file: !95, line: 79, baseType: !107, size: 8, offset: 120)
!566 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !567, size: 64)
!567 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIME_CAPABILITIES", file: !27, line: 799, baseType: !568)
!568 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_TIME_CAPABILITIES", file: !27, line: 776, size: 96, elements: !569)
!569 = !{!570, !571, !572}
!570 = !DIDerivedType(tag: DW_TAG_member, name: "Resolution", scope: !568, file: !27, line: 783, baseType: !100, size: 32)
!571 = !DIDerivedType(tag: DW_TAG_member, name: "Accuracy", scope: !568, file: !27, line: 790, baseType: !100, size: 32, offset: 32)
!572 = !DIDerivedType(tag: DW_TAG_member, name: "SetsToZero", scope: !568, file: !27, line: 798, baseType: !66, size: 8, offset: 64)
!573 = !DIDerivedType(tag: DW_TAG_member, name: "SetTime", scope: !541, file: !27, line: 1838, baseType: !574, size: 64, offset: 256)
!574 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_TIME", file: !27, line: 833, baseType: !575)
!575 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !576, size: 64)
!576 = !DISubroutineType(types: !577)
!577 = !{!131, !549}
!578 = !DIDerivedType(tag: DW_TAG_member, name: "GetWakeupTime", scope: !541, file: !27, line: 1839, baseType: !579, size: 64, offset: 320)
!579 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_WAKEUP_TIME", file: !27, line: 854, baseType: !580)
!580 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !581, size: 64)
!581 = !DISubroutineType(types: !582)
!582 = !{!131, !583, !583, !549}
!583 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!584 = !DIDerivedType(tag: DW_TAG_member, name: "SetWakeupTime", scope: !541, file: !27, line: 1840, baseType: !585, size: 64, offset: 384)
!585 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_WAKEUP_TIME", file: !27, line: 876, baseType: !586)
!586 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !587, size: 64)
!587 = !DISubroutineType(types: !588)
!588 = !{!131, !66, !549}
!589 = !DIDerivedType(tag: DW_TAG_member, name: "SetVirtualAddressMap", scope: !541, file: !27, line: 1845, baseType: !590, size: 64, offset: 448)
!590 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_VIRTUAL_ADDRESS_MAP", file: !27, line: 327, baseType: !591)
!591 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !592, size: 64)
!592 = !DISubroutineType(types: !593)
!593 = !{!131, !71, !71, !100, !594}
!594 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !595, size: 64)
!595 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_MEMORY_DESCRIPTOR", file: !27, line: 175, baseType: !596)
!596 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_MEMORY_DESCRIPTOR", file: !27, line: 143, size: 320, elements: !597)
!597 = !{!598, !599, !601, !603, !604}
!598 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !596, file: !27, line: 149, baseType: !100, size: 32)
!599 = !DIDerivedType(tag: DW_TAG_member, name: "PhysicalStart", scope: !596, file: !27, line: 155, baseType: !600, size: 64, offset: 64)
!600 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_PHYSICAL_ADDRESS", file: !95, line: 50, baseType: !72)
!601 = !DIDerivedType(tag: DW_TAG_member, name: "VirtualStart", scope: !596, file: !27, line: 161, baseType: !602, size: 64, offset: 128)
!602 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_VIRTUAL_ADDRESS", file: !95, line: 55, baseType: !72)
!603 = !DIDerivedType(tag: DW_TAG_member, name: "NumberOfPages", scope: !596, file: !27, line: 168, baseType: !72, size: 64, offset: 192)
!604 = !DIDerivedType(tag: DW_TAG_member, name: "Attribute", scope: !596, file: !27, line: 174, baseType: !72, size: 64, offset: 256)
!605 = !DIDerivedType(tag: DW_TAG_member, name: "ConvertPointer", scope: !541, file: !27, line: 1846, baseType: !606, size: 64, offset: 512)
!606 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONVERT_POINTER", file: !27, line: 422, baseType: !607)
!607 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !608, size: 64)
!608 = !DISubroutineType(types: !609)
!609 = !{!131, !71, !116}
!610 = !DIDerivedType(tag: DW_TAG_member, name: "GetVariable", scope: !541, file: !27, line: 1851, baseType: !611, size: 64, offset: 576)
!611 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_VARIABLE", file: !27, line: 686, baseType: !612)
!612 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !613, size: 64)
!613 = !DISubroutineType(types: !614)
!614 = !{!131, !211, !615, !616, !316, !88}
!615 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!616 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!617 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextVariableName", scope: !541, file: !27, line: 1852, baseType: !618, size: 64, offset: 640)
!618 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_VARIABLE_NAME", file: !27, line: 722, baseType: !619)
!619 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !620, size: 64)
!620 = !DISubroutineType(types: !621)
!621 = !{!131, !316, !211, !615}
!622 = !DIDerivedType(tag: DW_TAG_member, name: "SetVariable", scope: !541, file: !27, line: 1853, baseType: !623, size: 64, offset: 704)
!623 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_VARIABLE", file: !27, line: 764, baseType: !624)
!624 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !625, size: 64)
!625 = !DISubroutineType(types: !626)
!626 = !{!131, !211, !615, !100, !71, !88}
!627 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextHighMonotonicCount", scope: !541, file: !27, line: 1858, baseType: !628, size: 64, offset: 768)
!628 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_HIGH_MONO_COUNT", file: !27, line: 1097, baseType: !629)
!629 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !630, size: 64)
!630 = !DISubroutineType(types: !631)
!631 = !{!131, !616}
!632 = !DIDerivedType(tag: DW_TAG_member, name: "ResetSystem", scope: !541, file: !27, line: 1859, baseType: !633, size: 64, offset: 832)
!633 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RESET_SYSTEM", file: !27, line: 1062, baseType: !634)
!634 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !635, size: 64)
!635 = !DISubroutineType(types: !636)
!636 = !{null, !637, !131, !71, !88}
!637 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RESET_TYPE", file: !20, line: 145, baseType: !19)
!638 = !DIDerivedType(tag: DW_TAG_member, name: "UpdateCapsule", scope: !541, file: !27, line: 1864, baseType: !639, size: 64, offset: 896)
!639 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UPDATE_CAPSULE", file: !27, line: 1723, baseType: !640)
!640 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !641, size: 64)
!641 = !DISubroutineType(types: !642)
!642 = !{!131, !643, !71, !600}
!643 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !644, size: 64)
!644 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !645, size: 64)
!645 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CAPSULE_HEADER", file: !27, line: 1669, baseType: !646)
!646 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_CAPSULE_HEADER", file: !27, line: 1648, size: 224, elements: !647)
!647 = !{!648, !649, !650, !651}
!648 = !DIDerivedType(tag: DW_TAG_member, name: "CapsuleGuid", scope: !646, file: !27, line: 1652, baseType: !94, size: 128)
!649 = !DIDerivedType(tag: DW_TAG_member, name: "HeaderSize", scope: !646, file: !27, line: 1658, baseType: !100, size: 32, offset: 128)
!650 = !DIDerivedType(tag: DW_TAG_member, name: "Flags", scope: !646, file: !27, line: 1664, baseType: !100, size: 32, offset: 160)
!651 = !DIDerivedType(tag: DW_TAG_member, name: "CapsuleImageSize", scope: !646, file: !27, line: 1668, baseType: !100, size: 32, offset: 192)
!652 = !DIDerivedType(tag: DW_TAG_member, name: "QueryCapsuleCapabilities", scope: !541, file: !27, line: 1865, baseType: !653, size: 64, offset: 960)
!653 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_QUERY_CAPSULE_CAPABILITIES", file: !27, line: 1754, baseType: !654)
!654 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !655, size: 64)
!655 = !DISubroutineType(types: !656)
!656 = !{!131, !643, !71, !657, !658}
!657 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!658 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !637, size: 64)
!659 = !DIDerivedType(tag: DW_TAG_member, name: "QueryVariableInfo", scope: !541, file: !27, line: 1870, baseType: !660, size: 64, offset: 1024)
!660 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_QUERY_VARIABLE_INFO", file: !27, line: 1785, baseType: !661)
!661 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !662, size: 64)
!662 = !DISubroutineType(types: !663)
!663 = !{!131, !100, !657, !657, !657}
!664 = !DIDerivedType(tag: DW_TAG_member, name: "BootServices", scope: !442, file: !27, line: 2043, baseType: !665, size: 64, offset: 768)
!665 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !666, size: 64)
!666 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_BOOT_SERVICES", file: !27, line: 1972, baseType: !667)
!667 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_BOOT_SERVICES", file: !27, line: 1879, size: 3008, elements: !668)
!668 = !{!669, !670, !676, !681, !689, !694, !699, !704, !709, !719, !725, !730, !735, !737, !739, !746, !751, !756, !761, !762, !767, !773, !790, !795, !800, !806, !811, !816, !821, !826, !831, !836, !841, !846, !851, !856, !870, !877, !883, !888, !893, !898, !903, !908, !913}
!669 = !DIDerivedType(tag: DW_TAG_member, name: "Hdr", scope: !667, file: !27, line: 1883, baseType: !445, size: 192)
!670 = !DIDerivedType(tag: DW_TAG_member, name: "RaiseTPL", scope: !667, file: !27, line: 1888, baseType: !671, size: 64, offset: 192)
!671 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RAISE_TPL", file: !27, line: 644, baseType: !672)
!672 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !673, size: 64)
!673 = !DISubroutineType(types: !674)
!674 = !{!675, !675}
!675 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TPL", file: !95, line: 41, baseType: !71)
!676 = !DIDerivedType(tag: DW_TAG_member, name: "RestoreTPL", scope: !667, file: !27, line: 1889, baseType: !677, size: 64, offset: 256)
!677 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_RESTORE_TPL", file: !27, line: 656, baseType: !678)
!678 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !679, size: 64)
!679 = !DISubroutineType(types: !680)
!680 = !{null, !675}
!681 = !DIDerivedType(tag: DW_TAG_member, name: "AllocatePages", scope: !667, file: !27, line: 1894, baseType: !682, size: 64, offset: 320)
!682 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_ALLOCATE_PAGES", file: !27, line: 203, baseType: !683)
!683 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !684, size: 64)
!684 = !DISubroutineType(types: !685)
!685 = !{!131, !686, !687, !71, !688}
!686 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_ALLOCATE_TYPE", file: !27, line: 47, baseType: !26)
!687 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_MEMORY_TYPE", file: !20, line: 112, baseType: !33)
!688 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !600, size: 64)
!689 = !DIDerivedType(tag: DW_TAG_member, name: "FreePages", scope: !667, file: !27, line: 1895, baseType: !690, size: 64, offset: 384)
!690 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_FREE_PAGES", file: !27, line: 224, baseType: !691)
!691 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !692, size: 64)
!692 = !DISubroutineType(types: !693)
!693 = !{!131, !600, !71}
!694 = !DIDerivedType(tag: DW_TAG_member, name: "GetMemoryMap", scope: !667, file: !27, line: 1896, baseType: !695, size: 64, offset: 448)
!695 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_MEMORY_MAP", file: !27, line: 256, baseType: !696)
!696 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !697, size: 64)
!697 = !DISubroutineType(types: !698)
!698 = !{!131, !316, !594, !316, !316, !616}
!699 = !DIDerivedType(tag: DW_TAG_member, name: "AllocatePool", scope: !667, file: !27, line: 1897, baseType: !700, size: 64, offset: 512)
!700 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_ALLOCATE_POOL", file: !27, line: 285, baseType: !701)
!701 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !702, size: 64)
!702 = !DISubroutineType(types: !703)
!703 = !{!131, !687, !71, !116}
!704 = !DIDerivedType(tag: DW_TAG_member, name: "FreePool", scope: !667, file: !27, line: 1898, baseType: !705, size: 64, offset: 576)
!705 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_FREE_POOL", file: !27, line: 302, baseType: !706)
!706 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !707, size: 64)
!707 = !DISubroutineType(types: !708)
!708 = !{!131, !88}
!709 = !DIDerivedType(tag: DW_TAG_member, name: "CreateEvent", scope: !667, file: !27, line: 1903, baseType: !710, size: 64, offset: 640)
!710 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CREATE_EVENT", file: !27, line: 480, baseType: !711)
!711 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !712, size: 64)
!712 = !DISubroutineType(types: !713)
!713 = !{!131, !100, !675, !714, !88, !718}
!714 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EVENT_NOTIFY", file: !27, line: 457, baseType: !715)
!715 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !716, size: 64)
!716 = !DISubroutineType(types: !717)
!717 = !{null, !479, !88}
!718 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !479, size: 64)
!719 = !DIDerivedType(tag: DW_TAG_member, name: "SetTimer", scope: !667, file: !27, line: 1904, baseType: !720, size: 64, offset: 704)
!720 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_TIMER", file: !27, line: 554, baseType: !721)
!721 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !722, size: 64)
!722 = !DISubroutineType(types: !723)
!723 = !{!131, !479, !724, !72}
!724 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_TIMER_DELAY", file: !27, line: 534, baseType: !52)
!725 = !DIDerivedType(tag: DW_TAG_member, name: "WaitForEvent", scope: !667, file: !27, line: 1905, baseType: !726, size: 64, offset: 768)
!726 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_WAIT_FOR_EVENT", file: !27, line: 590, baseType: !727)
!727 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !728, size: 64)
!728 = !DISubroutineType(types: !729)
!729 = !{!131, !71, !718, !316}
!730 = !DIDerivedType(tag: DW_TAG_member, name: "SignalEvent", scope: !667, file: !27, line: 1906, baseType: !731, size: 64, offset: 832)
!731 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SIGNAL_EVENT", file: !27, line: 570, baseType: !732)
!732 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !733, size: 64)
!733 = !DISubroutineType(types: !734)
!734 = !{!131, !479}
!735 = !DIDerivedType(tag: DW_TAG_member, name: "CloseEvent", scope: !667, file: !27, line: 1907, baseType: !736, size: 64, offset: 896)
!736 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CLOSE_EVENT", file: !27, line: 606, baseType: !732)
!737 = !DIDerivedType(tag: DW_TAG_member, name: "CheckEvent", scope: !667, file: !27, line: 1908, baseType: !738, size: 64, offset: 960)
!738 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CHECK_EVENT", file: !27, line: 622, baseType: !732)
!739 = !DIDerivedType(tag: DW_TAG_member, name: "InstallProtocolInterface", scope: !667, file: !27, line: 1913, baseType: !740, size: 64, offset: 1024)
!740 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_PROTOCOL_INTERFACE", file: !27, line: 1188, baseType: !741)
!741 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !742, size: 64)
!742 = !DISubroutineType(types: !743)
!743 = !{!131, !744, !615, !745, !88}
!744 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !313, size: 64)
!745 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INTERFACE_TYPE", file: !27, line: 1164, baseType: !57)
!746 = !DIDerivedType(tag: DW_TAG_member, name: "ReinstallProtocolInterface", scope: !667, file: !27, line: 1914, baseType: !747, size: 64, offset: 1088)
!747 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_REINSTALL_PROTOCOL_INTERFACE", file: !27, line: 1238, baseType: !748)
!748 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !749, size: 64)
!749 = !DISubroutineType(types: !750)
!750 = !{!131, !313, !615, !88, !88}
!751 = !DIDerivedType(tag: DW_TAG_member, name: "UninstallProtocolInterface", scope: !667, file: !27, line: 1915, baseType: !752, size: 64, offset: 1152)
!752 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UNINSTALL_PROTOCOL_INTERFACE", file: !27, line: 1264, baseType: !753)
!753 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !754, size: 64)
!754 = !DISubroutineType(types: !755)
!755 = !{!131, !313, !615, !88}
!756 = !DIDerivedType(tag: DW_TAG_member, name: "HandleProtocol", scope: !667, file: !27, line: 1916, baseType: !757, size: 64, offset: 1216)
!757 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_HANDLE_PROTOCOL", file: !27, line: 1305, baseType: !758)
!758 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !759, size: 64)
!759 = !DISubroutineType(types: !760)
!760 = !{!131, !313, !615, !116}
!761 = !DIDerivedType(tag: DW_TAG_member, name: "Reserved", scope: !667, file: !27, line: 1917, baseType: !88, size: 64, offset: 1280)
!762 = !DIDerivedType(tag: DW_TAG_member, name: "RegisterProtocolNotify", scope: !667, file: !27, line: 1918, baseType: !763, size: 64, offset: 1344)
!763 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_REGISTER_PROTOCOL_NOTIFY", file: !27, line: 1466, baseType: !764)
!764 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !765, size: 64)
!765 = !DISubroutineType(types: !766)
!766 = !{!131, !615, !479, !116}
!767 = !DIDerivedType(tag: DW_TAG_member, name: "LocateHandle", scope: !667, file: !27, line: 1919, baseType: !768, size: 64, offset: 1408)
!768 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_HANDLE", file: !27, line: 1515, baseType: !769)
!769 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !770, size: 64)
!770 = !DISubroutineType(types: !771)
!771 = !{!131, !772, !615, !88, !316, !744}
!772 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_SEARCH_TYPE", file: !27, line: 1489, baseType: !60)
!773 = !DIDerivedType(tag: DW_TAG_member, name: "LocateDevicePath", scope: !667, file: !27, line: 1920, baseType: !774, size: 64, offset: 1472)
!774 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_DEVICE_PATH", file: !27, line: 1541, baseType: !775)
!775 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !776, size: 64)
!776 = !DISubroutineType(types: !777)
!777 = !{!131, !615, !778, !744}
!778 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !779, size: 64)
!779 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !780, size: 64)
!780 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_DEVICE_PATH_PROTOCOL", file: !781, line: 58, baseType: !782)
!781 = !DIFile(filename: "MdePkg/Include/Protocol/DevicePath.h", directory: "/home/achintya/Downloads/HARDEN_testcases/emergency-testcases/edk2-testcases", checksumkind: CSK_MD5, checksum: "6b6d593d171f69b933a87911e52d4607")
!782 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_DEVICE_PATH_PROTOCOL", file: !781, line: 43, size: 32, elements: !783)
!783 = !{!784, !785, !786}
!784 = !DIDerivedType(tag: DW_TAG_member, name: "Type", scope: !782, file: !781, line: 44, baseType: !107, size: 8)
!785 = !DIDerivedType(tag: DW_TAG_member, name: "SubType", scope: !782, file: !781, line: 51, baseType: !107, size: 8, offset: 8)
!786 = !DIDerivedType(tag: DW_TAG_member, name: "Length", scope: !782, file: !781, line: 56, baseType: !787, size: 16, offset: 16)
!787 = !DICompositeType(tag: DW_TAG_array_type, baseType: !107, size: 16, elements: !788)
!788 = !{!789}
!789 = !DISubrange(count: 2)
!790 = !DIDerivedType(tag: DW_TAG_member, name: "InstallConfigurationTable", scope: !667, file: !27, line: 1921, baseType: !791, size: 64, offset: 1536)
!791 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_CONFIGURATION_TABLE", file: !27, line: 1562, baseType: !792)
!792 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !793, size: 64)
!793 = !DISubroutineType(types: !794)
!794 = !{!131, !615, !88}
!795 = !DIDerivedType(tag: DW_TAG_member, name: "LoadImage", scope: !667, file: !27, line: 1926, baseType: !796, size: 64, offset: 1600)
!796 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_LOAD", file: !27, line: 913, baseType: !797)
!797 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !798, size: 64)
!798 = !DISubroutineType(types: !799)
!799 = !{!131, !66, !313, !779, !88, !71, !744}
!800 = !DIDerivedType(tag: DW_TAG_member, name: "StartImage", scope: !667, file: !27, line: 1927, baseType: !801, size: 64, offset: 1664)
!801 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_START", file: !27, line: 938, baseType: !802)
!802 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !803, size: 64)
!803 = !DISubroutineType(types: !804)
!804 = !{!131, !313, !316, !805}
!805 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64)
!806 = !DIDerivedType(tag: DW_TAG_member, name: "Exit", scope: !667, file: !27, line: 1928, baseType: !807, size: 64, offset: 1728)
!807 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EXIT", file: !27, line: 966, baseType: !808)
!808 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !809, size: 64)
!809 = !DISubroutineType(types: !810)
!810 = !{!131, !313, !131, !71, !211}
!811 = !DIDerivedType(tag: DW_TAG_member, name: "UnloadImage", scope: !667, file: !27, line: 1929, baseType: !812, size: 64, offset: 1792)
!812 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_IMAGE_UNLOAD", file: !27, line: 984, baseType: !813)
!813 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !814, size: 64)
!814 = !DISubroutineType(types: !815)
!815 = !{!131, !313}
!816 = !DIDerivedType(tag: DW_TAG_member, name: "ExitBootServices", scope: !667, file: !27, line: 1930, baseType: !817, size: 64, offset: 1856)
!817 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_EXIT_BOOT_SERVICES", file: !27, line: 1000, baseType: !818)
!818 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !819, size: 64)
!819 = !DISubroutineType(types: !820)
!820 = !{!131, !313, !71}
!821 = !DIDerivedType(tag: DW_TAG_member, name: "GetNextMonotonicCount", scope: !667, file: !27, line: 1935, baseType: !822, size: 64, offset: 1920)
!822 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_GET_NEXT_MONOTONIC_COUNT", file: !27, line: 1081, baseType: !823)
!823 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !824, size: 64)
!824 = !DISubroutineType(types: !825)
!825 = !{!131, !657}
!826 = !DIDerivedType(tag: DW_TAG_member, name: "Stall", scope: !667, file: !27, line: 1936, baseType: !827, size: 64, offset: 1984)
!827 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_STALL", file: !27, line: 1016, baseType: !828)
!828 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !829, size: 64)
!829 = !DISubroutineType(types: !830)
!830 = !{!131, !71}
!831 = !DIDerivedType(tag: DW_TAG_member, name: "SetWatchdogTimer", scope: !667, file: !27, line: 1937, baseType: !832, size: 64, offset: 2048)
!832 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_WATCHDOG_TIMER", file: !27, line: 1038, baseType: !833)
!833 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !834, size: 64)
!834 = !DISubroutineType(types: !835)
!835 = !{!131, !71, !72, !71, !211}
!836 = !DIDerivedType(tag: DW_TAG_member, name: "ConnectController", scope: !667, file: !27, line: 1942, baseType: !837, size: 64, offset: 2112)
!837 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONNECT_CONTROLLER", file: !27, line: 361, baseType: !838)
!838 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !839, size: 64)
!839 = !DISubroutineType(types: !840)
!840 = !{!131, !313, !744, !779, !66}
!841 = !DIDerivedType(tag: DW_TAG_member, name: "DisconnectController", scope: !667, file: !27, line: 1943, baseType: !842, size: 64, offset: 2176)
!842 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_DISCONNECT_CONTROLLER", file: !27, line: 394, baseType: !843)
!843 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !844, size: 64)
!844 = !DISubroutineType(types: !845)
!845 = !{!131, !313, !313, !313}
!846 = !DIDerivedType(tag: DW_TAG_member, name: "OpenProtocol", scope: !667, file: !27, line: 1948, baseType: !847, size: 64, offset: 2240)
!847 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL", file: !27, line: 1347, baseType: !848)
!848 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !849, size: 64)
!849 = !DISubroutineType(types: !850)
!850 = !{!131, !313, !615, !116, !313, !313, !100}
!851 = !DIDerivedType(tag: DW_TAG_member, name: "CloseProtocol", scope: !667, file: !27, line: 1949, baseType: !852, size: 64, offset: 2304)
!852 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CLOSE_PROTOCOL", file: !27, line: 1379, baseType: !853)
!853 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !854, size: 64)
!854 = !DISubroutineType(types: !855)
!855 = !{!131, !313, !615, !313, !313}
!856 = !DIDerivedType(tag: DW_TAG_member, name: "OpenProtocolInformation", scope: !667, file: !27, line: 1950, baseType: !857, size: 64, offset: 2368)
!857 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL_INFORMATION", file: !27, line: 1413, baseType: !858)
!858 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !859, size: 64)
!859 = !DISubroutineType(types: !860)
!860 = !{!131, !313, !615, !861, !316}
!861 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !862, size: 64)
!862 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !863, size: 64)
!863 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_OPEN_PROTOCOL_INFORMATION_ENTRY", file: !27, line: 1394, baseType: !864)
!864 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_OPEN_PROTOCOL_INFORMATION_ENTRY", file: !27, line: 1389, size: 192, elements: !865)
!865 = !{!866, !867, !868, !869}
!866 = !DIDerivedType(tag: DW_TAG_member, name: "AgentHandle", scope: !864, file: !27, line: 1390, baseType: !313, size: 64)
!867 = !DIDerivedType(tag: DW_TAG_member, name: "ControllerHandle", scope: !864, file: !27, line: 1391, baseType: !313, size: 64, offset: 64)
!868 = !DIDerivedType(tag: DW_TAG_member, name: "Attributes", scope: !864, file: !27, line: 1392, baseType: !100, size: 32, offset: 128)
!869 = !DIDerivedType(tag: DW_TAG_member, name: "OpenCount", scope: !864, file: !27, line: 1393, baseType: !100, size: 32, offset: 160)
!870 = !DIDerivedType(tag: DW_TAG_member, name: "ProtocolsPerHandle", scope: !667, file: !27, line: 1955, baseType: !871, size: 64, offset: 2432)
!871 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_PROTOCOLS_PER_HANDLE", file: !27, line: 1443, baseType: !872)
!872 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !873, size: 64)
!873 = !DISubroutineType(types: !874)
!874 = !{!131, !313, !875, !316}
!875 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !876, size: 64)
!876 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !615, size: 64)
!877 = !DIDerivedType(tag: DW_TAG_member, name: "LocateHandleBuffer", scope: !667, file: !27, line: 1956, baseType: !878, size: 64, offset: 2496)
!878 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_HANDLE_BUFFER", file: !27, line: 1588, baseType: !879)
!879 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !880, size: 64)
!880 = !DISubroutineType(types: !881)
!881 = !{!131, !772, !615, !88, !316, !882}
!882 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !744, size: 64)
!883 = !DIDerivedType(tag: DW_TAG_member, name: "LocateProtocol", scope: !667, file: !27, line: 1957, baseType: !884, size: 64, offset: 2560)
!884 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_LOCATE_PROTOCOL", file: !27, line: 1615, baseType: !885)
!885 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !886, size: 64)
!886 = !DISubroutineType(types: !887)
!887 = !{!131, !615, !88, !116}
!888 = !DIDerivedType(tag: DW_TAG_member, name: "InstallMultipleProtocolInterfaces", scope: !667, file: !27, line: 1958, baseType: !889, size: 64, offset: 2624)
!889 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_INSTALL_MULTIPLE_PROTOCOL_INTERFACES", file: !27, line: 1213, baseType: !890)
!890 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !891, size: 64)
!891 = !DISubroutineType(types: !892)
!892 = !{!131, !744, null}
!893 = !DIDerivedType(tag: DW_TAG_member, name: "UninstallMultipleProtocolInterfaces", scope: !667, file: !27, line: 1959, baseType: !894, size: 64, offset: 2688)
!894 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_UNINSTALL_MULTIPLE_PROTOCOL_INTERFACES", file: !27, line: 1283, baseType: !895)
!895 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !896, size: 64)
!896 = !DISubroutineType(types: !897)
!897 = !{!131, !313, null}
!898 = !DIDerivedType(tag: DW_TAG_member, name: "CalculateCrc32", scope: !667, file: !27, line: 1964, baseType: !899, size: 64, offset: 2752)
!899 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CALCULATE_CRC32", file: !27, line: 1118, baseType: !900)
!900 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !901, size: 64)
!901 = !DISubroutineType(types: !902)
!902 = !{!131, !88, !71, !616}
!903 = !DIDerivedType(tag: DW_TAG_member, name: "CopyMem", scope: !667, file: !27, line: 1969, baseType: !904, size: 64, offset: 2816)
!904 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_COPY_MEM", file: !27, line: 1134, baseType: !905)
!905 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !906, size: 64)
!906 = !DISubroutineType(types: !907)
!907 = !{null, !88, !88, !71}
!908 = !DIDerivedType(tag: DW_TAG_member, name: "SetMem", scope: !667, file: !27, line: 1970, baseType: !909, size: 64, offset: 2880)
!909 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_SET_MEM", file: !27, line: 1150, baseType: !910)
!910 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !911, size: 64)
!911 = !DISubroutineType(types: !912)
!912 = !{null, !88, !71, !107}
!913 = !DIDerivedType(tag: DW_TAG_member, name: "CreateEventEx", scope: !667, file: !27, line: 1971, baseType: !914, size: 64, offset: 2944)
!914 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CREATE_EVENT_EX", file: !27, line: 509, baseType: !915)
!915 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !916, size: 64)
!916 = !DISubroutineType(types: !917)
!917 = !{!131, !100, !675, !714, !314, !358, !718}
!918 = !DIDerivedType(tag: DW_TAG_member, name: "NumberOfTableEntries", scope: !442, file: !27, line: 2047, baseType: !71, size: 64, offset: 832)
!919 = !DIDerivedType(tag: DW_TAG_member, name: "ConfigurationTable", scope: !442, file: !27, line: 2052, baseType: !920, size: 64, offset: 896)
!920 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !921, size: 64)
!921 = !DIDerivedType(tag: DW_TAG_typedef, name: "EFI_CONFIGURATION_TABLE", file: !27, line: 1987, baseType: !922)
!922 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "EFI_CONFIGURATION_TABLE", file: !27, line: 1978, size: 192, elements: !923)
!923 = !{!924, !925}
!924 = !DIDerivedType(tag: DW_TAG_member, name: "VendorGuid", scope: !922, file: !27, line: 1982, baseType: !94, size: 128)
!925 = !DIDerivedType(tag: DW_TAG_member, name: "VendorTable", scope: !922, file: !27, line: 1986, baseType: !88, size: 64, offset: 128)
!926 = !DILocalVariable(name: "ImageHandle", arg: 1, scope: !437, file: !120, line: 180, type: !313)
!927 = !DILocation(line: 180, scope: !437)
!928 = !DILocalVariable(name: "SystemTable", arg: 2, scope: !437, file: !120, line: 181, type: !440)
!929 = !DILocation(line: 181, scope: !437)
!930 = !DILocalVariable(name: "Status", scope: !437, file: !120, line: 184, type: !131)
!931 = !DILocation(line: 184, scope: !437)
!932 = !DILocalVariable(name: "DispatchHandle", scope: !437, file: !120, line: 185, type: !313)
!933 = !DILocation(line: 185, scope: !437)
!934 = !DILocalVariable(name: "HeapManagerNotifyRegistration", scope: !437, file: !120, line: 186, type: !88)
!935 = !DILocation(line: 186, scope: !437)
!936 = !DILocalVariable(name: "CharConverterNotifyRegistration", scope: !437, file: !120, line: 187, type: !88)
!937 = !DILocation(line: 187, scope: !437)
!938 = !DILocation(line: 189, scope: !437)
!939 = !DILocation(line: 190, scope: !437)
!940 = !DILocation(line: 194, scope: !941)
!941 = distinct !DILexicalBlock(scope: !942, file: !120, line: 190)
!942 = distinct !DILexicalBlock(scope: !437, file: !120, line: 190)
!943 = !DILocation(line: 199, scope: !941)
!944 = !DILocation(line: 200, scope: !945)
!945 = distinct !DILexicalBlock(scope: !946, file: !120, line: 199)
!946 = distinct !DILexicalBlock(scope: !941, file: !120, line: 199)
!947 = !DILocation(line: 200, scope: !948)
!948 = distinct !DILexicalBlock(scope: !945, file: !120, line: 200)
!949 = !DILocation(line: 200, scope: !950)
!950 = distinct !DILexicalBlock(scope: !951, file: !120, line: 200)
!951 = distinct !DILexicalBlock(scope: !948, file: !120, line: 200)
!952 = !DILocation(line: 200, scope: !953)
!953 = distinct !DILexicalBlock(scope: !950, file: !120, line: 200)
!954 = !DILocation(line: 200, scope: !955)
!955 = distinct !DILexicalBlock(scope: !956, file: !120, line: 200)
!956 = distinct !DILexicalBlock(scope: !953, file: !120, line: 200)
!957 = !DILocation(line: 201, scope: !945)
!958 = !DILocation(line: 203, scope: !941)
!959 = !DILocation(line: 206, scope: !960)
!960 = distinct !DILexicalBlock(scope: !942, file: !120, line: 205)
!961 = !DILocation(line: 207, scope: !960)
!962 = !DILocation(line: 208, scope: !960)
!963 = !DILocation(line: 210, scope: !437)
!964 = !DILocation(line: 211, scope: !437)
!965 = !DILocation(line: 216, scope: !437)
!966 = !DILocation(line: 221, scope: !437)
!967 = !DILocation(line: 222, scope: !968)
!968 = distinct !DILexicalBlock(scope: !969, file: !120, line: 221)
!969 = distinct !DILexicalBlock(scope: !437, file: !120, line: 221)
!970 = !DILocation(line: 222, scope: !971)
!971 = distinct !DILexicalBlock(scope: !968, file: !120, line: 222)
!972 = !DILocation(line: 222, scope: !973)
!973 = distinct !DILexicalBlock(scope: !974, file: !120, line: 222)
!974 = distinct !DILexicalBlock(scope: !971, file: !120, line: 222)
!975 = !DILocation(line: 222, scope: !976)
!976 = distinct !DILexicalBlock(scope: !973, file: !120, line: 222)
!977 = !DILocation(line: 222, scope: !978)
!978 = distinct !DILexicalBlock(scope: !979, file: !120, line: 222)
!979 = distinct !DILexicalBlock(scope: !976, file: !120, line: 222)
!980 = !DILocation(line: 223, scope: !968)
!981 = !DILocation(line: 230, scope: !437)
!982 = !DILocation(line: 235, scope: !437)
!983 = !DILocation(line: 236, scope: !984)
!984 = distinct !DILexicalBlock(scope: !985, file: !120, line: 235)
!985 = distinct !DILexicalBlock(scope: !437, file: !120, line: 235)
!986 = !DILocation(line: 236, scope: !987)
!987 = distinct !DILexicalBlock(scope: !984, file: !120, line: 236)
!988 = !DILocation(line: 236, scope: !989)
!989 = distinct !DILexicalBlock(scope: !990, file: !120, line: 236)
!990 = distinct !DILexicalBlock(scope: !987, file: !120, line: 236)
!991 = !DILocation(line: 236, scope: !992)
!992 = distinct !DILexicalBlock(scope: !989, file: !120, line: 236)
!993 = !DILocation(line: 236, scope: !994)
!994 = distinct !DILexicalBlock(scope: !995, file: !120, line: 236)
!995 = distinct !DILexicalBlock(scope: !992, file: !120, line: 236)
!996 = !DILocation(line: 237, scope: !984)
!997 = !DILocation(line: 240, scope: !437)
!998 = !DILocation(line: 241, scope: !437)

^0 = module: (path: "./Sample2TestsDriver.bc", hash: (0, 0, 0, 0, 0))
^1 = gv: (name: "DebugPrint") ; guid = 478242322684871111
^2 = gv: (name: "CharConverterReadyCallback", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 50, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 1, mustBeUnreachable: 0), calls: ((callee: ^32), (callee: ^19), (callee: ^1)), refs: (^13, ^5, ^33, ^28, ^16, ^11)))) ; guid = 584718706913633304
^3 = gv: (name: ".str", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 934572594314178177
^4 = gv: (name: ".str.10", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 1923374454933278109
^5 = gv: (name: "gEfiCharConverterProtocolGuid") ; guid = 2580643386560207340
^6 = gv: (name: ".str.3", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 2618187677974536875
^7 = gv: (name: ".str.4", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 2897421038639790771
^8 = gv: (name: "w_msg", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0), refs: (^3)))) ; guid = 3070209274896910959
^9 = gv: (name: "convert", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 69, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 1, mustBeUnreachable: 0), calls: ((callee: ^32), (callee: ^19), (callee: ^1)), refs: (^33, ^20, ^31)))) ; guid = 3802914799201949233
^10 = gv: (name: "gEfiCharConverterReadyProtocolGuid") ; guid = 4420064722380067124
^11 = gv: (name: ".str.8", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 4660676668622532469
^12 = gv: (name: ".str.2", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 6055050138071385728
^13 = gv: (name: "gSmst") ; guid = 6336347229606852196
^14 = gv: (name: "HeapManagerReadyCallback", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 60, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 1, mustBeUnreachable: 0), calls: ((callee: ^32), (callee: ^19), (callee: ^1)), refs: (^13, ^24, ^20, ^21, ^16, ^15)))) ; guid = 6383680034609704177
^15 = gv: (name: ".str.7", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 6718598156897181634
^16 = gv: (name: ".str.6", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 7214463120635705994
^17 = gv: (name: "funcptr", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 8238060369180966523
^18 = gv: (name: ".str.9", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 9858397167540470451
^19 = gv: (name: "DebugPrintLevelEnabled") ; guid = 10095421576718565903
^20 = gv: (name: "mHeapManager", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 10205697537477852075
^21 = gv: (name: "__func__.HeapManagerReadyCallback", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 10276878091509595688
^22 = gv: (name: "winning_msg", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 14, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^32), (callee: ^19), (callee: ^1)), refs: (^35)))) ; guid = 10485025536255318622
^23 = gv: (name: "welcome_msg", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 41, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^32), (callee: ^19), (callee: ^1)), refs: (^8, ^12, ^6, ^17, ^22, ^7)))) ; guid = 11298069570933119262
^24 = gv: (name: "gEfiHeapManagerProtocolGuid") ; guid = 11449330682667165830
^25 = gv: (name: "Sample2TestsDriverEntryPoint", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 111, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 1, mustBeUnreachable: 0), calls: ((callee: ^32), (callee: ^19), (callee: ^1)), refs: (^13, ^24, ^20, ^29, ^14, ^34, ^18, ^17, ^23, ^10, ^2, ^26, ^27, ^4)))) ; guid = 11658379727017452484
^26 = gv: (name: "Sample2TestsDriverHandler", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 67, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 1, mustBeUnreachable: 0), calls: ((callee: ^9)), refs: (^20, ^17)))) ; guid = 12611963365562777713
^27 = gv: (name: "gEfiSample2TestsDriverCommGuid") ; guid = 12637746849648219737
^28 = gv: (name: "__func__.CharConverterReadyCallback", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 13151758227712422315
^29 = gv: (name: "gEfiHeapManagerReadyProtocolGuid") ; guid = 13373684940576142575
^30 = gv: (name: "llvm.dbg.declare") ; guid = 13513223491971101989
^31 = gv: (name: ".str.5", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 15088692727657889360
^32 = gv: (name: "DebugPrintEnabled") ; guid = 15723647242063003913
^33 = gv: (name: "mCharConverter", summaries: (variable: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 1, constant: 0)))) ; guid = 16839321578063801411
^34 = gv: (name: "__func__.Sample2TestsDriverEntryPoint", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 17864532103309354773
^35 = gv: (name: ".str.1", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 18048282324771447228
^36 = flags: 8
^37 = blockcount: 137
