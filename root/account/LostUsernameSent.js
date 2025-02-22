/*
 * @flow strict
 * Copyright (C) 2018 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import * as React from 'react';

import StatusPage from '../components/StatusPage.js';
import {CONTACT_URL} from '../constants.js';

const LostUsernameSent = (): React.Element<typeof StatusPage> => (
  <StatusPage title={hyphenateTitle(l('Lost Username'), l('Email Sent!'))}>
    <p>
      {exp.l(
        `We've sent you information about your MusicBrainz account.
         If you don't receive this email or still have problems
         logging in, please {link|contact us}.`,
        {link: CONTACT_URL},
      )}
    </p>
  </StatusPage>
);

export default LostUsernameSent;
