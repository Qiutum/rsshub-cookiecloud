#!/usr/bin/env sh

cat > /tmp/extra.ts <<EOF
import { createCookieCloudSyncJob } from '@/routes/cookiecloud/cookie-cloud';
import { _config as cookieCloudConfig } from '@/routes/cookiecloud/index';
setTimeout(async () => await createCookieCloudSyncJob(cookieCloudConfig, false), 10);
EOF

cat /tmp/extra.ts ./lib/index.ts > /tmp/index.ts.tmp
mv /tmp/index.ts.tmp ./lib/index.ts

echo 'process.exit()' >> /app/scripts/workflow/build-routes.ts
env NODE_ENV= npm run build

npm run start
