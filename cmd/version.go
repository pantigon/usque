package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var (
	version = "v3.0.0"
	commit  = "By Pantigon"
	date    = "2026-05-25T15:11:59Z"
)

var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "Print the version number of usque",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Printf("usque version: %s\n", version)
		fmt.Printf("Commit: %s\n", commit)
		fmt.Printf("Build Date: %s\n", date)
	},
}

func init() {
	rootCmd.AddCommand(versionCmd)
}
