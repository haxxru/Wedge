export default function ProfileLoadingState() {
  return (
    <div className="flex flex-1 min-h-[60vh] items-center justify-center bg-[#fbf9f2]">
      <div className="text-center">
        <div className="w-10 h-10 border-4 border-[#4f6231] border-t-transparent rounded-full animate-spin mx-auto mb-4" />
        <p className="text-sm text-[#75786c]">
          프로필을 불러오는 중입니다...
        </p>
      </div>
    </div>
  );
}
