"use client";

import Link from "next/link";
import Image from "next/image";
import { ConnectButton } from "@rainbow-me/rainbowkit";
import { useAccount } from "wagmi";
import { useEffect } from "react";

export function Navigation() {
  useEffect(() => {}, []);

  return (
    <header className="px-4 lg:px-6 h-20 flex items-center justify-between">
      <div className="flex items-center">
        <Link className="flex items-center justify-center" href="/">
          <span className="ml-2 text-2xl font-bold">faucet-claim </span>
        </Link>
      </div>
      <div className="flex items-center space-x-4">
        <ConnectButton />
      </div>
    </header>
  );
}
