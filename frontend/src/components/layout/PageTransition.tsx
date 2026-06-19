"use client";

import { useEffect, useState } from "react";
import { usePathname } from "next/navigation";

export function PageTransition({ children }: { readonly children: React.ReactNode }) {
  const pathname = usePathname();
  const [entering, setEntering] = useState(true);

  useEffect(() => {
    setEntering(false);
    const id = requestAnimationFrame(() => setEntering(true));
    return () => cancelAnimationFrame(id);
  }, [pathname]);

  return (
    <div className={entering ? "route-enter" : "route-shell"}>
      {children}
    </div>
  );
}
